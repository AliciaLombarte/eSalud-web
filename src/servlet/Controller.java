package servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

import domains.Cuestionario;
import domains.Doctor;
import domains.ListCuestionario;
import domains.ListProtocolo;
import domains.ListWounds;
import domains.Protocolo;
import domains.Result;
import domains.User;
import domains.WoundTracks;

@WebServlet("/controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		Doctor doctor = new Doctor();
		User user = new User();
		Result result = new Result();
		Client client = null;
		WebTarget webResource;

		String option = request.getParameter("option").toString();
		switch (option) {

		case "login":
			doctor.setEmail(request.getParameter("email").toString());
			doctor.setPass(request.getParameter("password").toString());

			client = ClientBuilder.newClient();

			webResource = client.target("http://localhost:8081/loginDoctor");
			result = (Result) webResource.request("application/json").accept("application/json")
					.post(Entity.entity(doctor, MediaType.APPLICATION_JSON), Result.class);
			System.out.println(result.toString());
			if (result.getResult() == 200) {
				client = ClientBuilder.newClient();
				webResource = client.target("http://localhost:8081/pacientes");
				result = (Result) webResource.request("application/json").accept("application/json")
						.post(Entity.entity(doctor, MediaType.APPLICATION_JSON), Result.class);
				request.setAttribute("listUsers", result.getListUsers());

				session.setAttribute("doctorEmail", request.getParameter("email").toString());
				session.setAttribute("doctorPass", request.getParameter("password").toString());
				request.getRequestDispatcher("pacientes.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("inicio.html").forward(request, response);
			}

			break;

		case "pacientes":

			doctor.setEmail(session.getAttribute("doctorEmail").toString());
			doctor.setPass(session.getAttribute("doctorPass").toString());

			client = ClientBuilder.newClient();
			webResource = client.target("http://localhost:8081/pacientes");
			result = (Result) webResource.request("application/json").accept("application/json")
					.post(Entity.entity(doctor, MediaType.APPLICATION_JSON), Result.class);
			request.setAttribute("listUsers", result.getListUsers());

			request.getRequestDispatcher("pacientes.jsp").forward(request, response);

			break;

		case "imagen":

			client = ClientBuilder.newClient();
			String img_id = request.getParameter("id").toString();
			webResource = client.target("http://localhost:8081/getWoundtrackImage?img_id="+img_id);
			String image = webResource.request("application/json").accept("application/json").get(String.class);
			if (null != image) {
				request.setAttribute("image", image);
			}
			request.getRequestDispatcher("woundtrackImage.jsp").forward(request, response);

			break;

		case "protocolos":

			client = ClientBuilder.newClient();

			webResource = client.target("http://localhost:8081/protocolos");
			ListProtocolo protocolos = (ListProtocolo) webResource.request("application/json")
					.accept("application/json").get(ListProtocolo.class);
			if (null != protocolos.getProtocolo()) {
				request.setAttribute("listProtocols", protocolos.getProtocolo());
			}

			request.getRequestDispatcher("protocolos.jsp").forward(request, response);

			break;

		case "cuestionarios":

			client = ClientBuilder.newClient();
			webResource = client.target("http://localhost:8081/cuestionarios");
			ListCuestionario cuestionarios = (ListCuestionario) webResource.request("application/json")
					.accept("application/json").get(ListCuestionario.class);
			if (null != cuestionarios.getCuestionarios()) {
				request.setAttribute("listCuestionarios", cuestionarios.getCuestionarios());
			}

			request.getRequestDispatcher("cuestionarios.jsp").forward(request, response);

			break;

		case "registro":

			user.setNombre(request.getParameter("nombre").toString());
			user.setApellido1(request.getParameter("apellido1").toString());
			user.setApellido2(request.getParameter("apellido2").toString());
			user.setEdad(Integer.parseInt(request.getParameter("edad")));
			user.setEmail(request.getParameter("email").toString());
			user.setDoctor(session.getAttribute("doctorEmail").toString());

			user.setUsername(user.getNombre() + user.getApellido1() + user.getEdad());

			String[] symbols = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };
			int length = 10;
			Random random = null;
			try {
				random = SecureRandom.getInstanceStrong();
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			StringBuilder sb = new StringBuilder(length);
			for (int i = 0; i < length; i++) {
				int indexRandom = random.nextInt(symbols.length);
				sb.append(symbols[indexRandom]);
			}
			String password = sb.toString();

			user.setPass(password);

			client = ClientBuilder.newClient();
			webResource = client.target("http://localhost:8081/registroPaciente");
			result = (Result) webResource.request("application/json").accept("application/json")
					.post(Entity.entity(user, MediaType.APPLICATION_JSON), Result.class);

			if (result.getResult() == 200) {
				doctor.setEmail(session.getAttribute("doctorEmail").toString());
				client = ClientBuilder.newClient();
				webResource = client.target("http://localhost:8081/pacientes");
				result = (Result) webResource.request("application/json").accept("application/json")
						.post(Entity.entity(doctor, MediaType.APPLICATION_JSON), Result.class);
				request.setAttribute("listUsers", result.getListUsers());

				// Recipient's email ID needs to be mentioned.
				// String to = user.getEmail();
				String to = user.getEmail();
				// Sender's email ID needs to be mentioned
				String from = "tfgalejandroperez@gmail.com";

				// Get system properties
				Properties properties = System.getProperties();

				// Setup mail server
				properties.setProperty("mail.host", "smtp.gmail.com");
				properties.setProperty("mail.username", "tfgalejandroperez@gmail.com");
				properties.setProperty("mail.password", "tfg100330118");
				properties.setProperty("mail.defaultEncoding", "UTF-8");
				properties.setProperty("mail.smtp.auth", "true");
				properties.setProperty("mail.smtp.starttls.required", "true");
				properties.setProperty("mail.smtp.starttls.enable", "true");
				properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				properties.setProperty("mail.smtp.socketFactory.fallback", "false");
				properties.setProperty("mail.smtp.port", "465");
				properties.setProperty("mail.smtp.socketFactory.port", "465");

				Session sessionEmail = Session.getInstance(properties, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("tfgalejandroperez@gmail.com", "tfg100330118");
					}
				});

				try {
					// Create a default MimeMessage object.
					MimeMessage message = new MimeMessage(sessionEmail);

					// Set From: header field of the header.
					message.setFrom(new InternetAddress(from));

					// Set To: header field of the header.
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

					// Set Subject: header field
					message.setSubject("Datos de registro HospitalApp");

					// Send the actual HTML message, as big as you like
					message.setContent(
							"<p>Usted ha sido registrado como paciente en el sistema de HospitalApp, sus datos para iniciar sesión son:</p>"
									+ "<br><p> - Email: " + to + " </p>" + "<p> - Contraseña: " + password + "</p>"
									+ "<br><p>La contraseña podrá ser modificada desde la aplicación pero requerirá de la original para su cambio.</p>"
									+ "<br><p>Un cordial saludo</p>",
							"text/html");

					// Send message
					Transport.send(message);

				} catch (MessagingException mex) {
					mex.printStackTrace();
				}

				request.setAttribute("email", user.getEmail());
				request.getRequestDispatcher("pacientes.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("registroPaciente.html").forward(request, response);
			}

			break;

		case "infoUser":

			user.setEmail(request.getParameter("email").toString());

			client = ClientBuilder.newClient();
			webResource = client.target("http://localhost:8081/infoUser");
			ListWounds wound = (ListWounds) webResource.request("application/json").accept("application/json")
					.post(Entity.entity(user, MediaType.APPLICATION_JSON), ListWounds.class);
			request.setAttribute("wound", wound.getList());
			request.setAttribute("email", user.getEmail());
			request.setAttribute("nombreUser", wound.getNombre());

			request.getRequestDispatcher("infoUser.jsp").forward(request, response);

			break;

		case "createProtocol":

			client = ClientBuilder.newClient();
			webResource = client.target("http://localhost:8081/cuestionarios");
			ListCuestionario cuestionarios2 = (ListCuestionario) webResource.request("application/json")
					.accept("application/json").get(ListCuestionario.class);
			if (null != cuestionarios2.getCuestionarios()) {
				request.setAttribute("listCuestionarios", cuestionarios2.getCuestionarios());
			}

			request.getRequestDispatcher("registroProtocolo.jsp").forward(request, response);

			break;

		case "protocol":

			Protocolo protocolo = new Protocolo();

			protocolo.setNombre(request.getParameter("nombre").toString());
			protocolo.setCuestionario(request.getParameter("cuestionario").toString());
			protocolo.setFrecuencia(Integer.parseInt(request.getParameter("frecuencia").toString()));

			client = ClientBuilder.newClient();
			webResource = client.target("http://localhost:8081/protocol");
			result = (Result) webResource.request("application/json").accept("application/json")
					.post(Entity.entity(protocolo, MediaType.APPLICATION_JSON), Result.class);

			if (result.getResult() == 200) {

				webResource = client.target("http://localhost:8081/protocolos");
				ListProtocolo protocolos1 = (ListProtocolo) webResource.request("application/json")
						.accept("application/json").get(ListProtocolo.class);
				if (null != protocolos1.getProtocolo()) {
					request.setAttribute("listProtocols", protocolos1.getProtocolo());
				}
				request.getRequestDispatcher("protocolos.jsp").forward(request, response);
			} else {
				ArrayList<Cuestionario> listCuestionarios = new ArrayList<Cuestionario>();
				listCuestionarios = (ArrayList<Cuestionario>) request.getAttribute("listCuestionarios");
				request.setAttribute("listCuestionarios", listCuestionarios);
				request.getRequestDispatcher("registroProtocolo.jsp").forward(request, response);
			}

			break;

		default:
			break;

		}

	}

}
