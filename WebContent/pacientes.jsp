<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="domains.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <title>Pacientes</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="style/css/pacientes.css">
    <link rel="stylesheet" type="text/css" href="style/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
    <script src="scripts/jquery-3.3.1.min.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
  	<script type="text/javascript" charset="utf8" src="scripts/pacientes.js"></script>

  </head>
  <body>
  
  	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	 	<%-- 
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">WebSiteName</a>
	    </div>
	    --%>
	    <img style="width:8%; height:8%; margin-top:0.3%; margin-right:1%; float:left" src="images/logo.jpg">
	    <ul class="nav navbar-nav">
	      <li>
	      <form  action="/TFG-Web/controller" method="post">
	        	<input type="hidden" name="option" value="pacientes">
	       	 	<input type="submit" class="btn btn-primary botonesHeader1" value="Pacientes">
	      </form>
	      </li>
	      <li>
	      <form class="" action="/TFG-Web/controller" method="post">
	        	<input type="hidden" name="option" value="cuestionarios">
	       	 	<input type="submit" class="btn btn-info botonesHeader2" value="Cuestionarios">
	      </form>
	      </li>
	      <li>
	      <form class="" action="/TFG-Web/controller" method="post">
	        	<input type="hidden" name="option" value="protocolos">
	       	 	<input type="submit" class="btn btn-info botonesHeader3" value="Protocolos">
	      </form>
	      </li>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	      <li>
	      	<a href="registroPaciente.html"><button class="btn btn-success botonesHeader4" type="button"><img src="images/add.png">   Registrar paciente</button></a>
	      </li>
	    </ul>
	  </div>
	</nav>
	
	<div id="cuerpo">
  
  	<h1>PACIENTES</h1>
  	
  	<h2>Lista de pacientes</h2>
  	<table id="pacientesTable" class="display">
  	  <thead>
		  <tr>
		    <th style="text-align:center">Nombre</th>
		    <th style="text-align:center">Datos</th>
		    <th style="text-align:center">Protocolo</th>
		  </tr>
	  </thead>
	  <tbody>
	  
	<% 
	ArrayList<User> listUsers = new ArrayList<User>(); 
	listUsers = (ArrayList<User>) request.getAttribute("listUsers");
	
	if(0 != listUsers.size()) { 
    	for(int i=0; i<listUsers.size(); i++) 
    	{ 
    		
    	%>
    	 <tr style="text-align:center">
    	
		     <td><%=listUsers.get(i).getNombre().toString()%> <%=listUsers.get(i).getApellido1().toString()%> <%=listUsers.get(i).getApellido2().toString()%></td>
		     
		     <td> 
		     	<form class="" action="/TFG-Web/controller" method="post">
		        	<input type="hidden" name="option" value="infoUser">
		        	<input type="hidden" name="email" value="<%=listUsers.get(i).getEmail().toString()%>" >
		       	 	<input type="image" alt="Submit" src="images/folder.png">
		     	</form>
		     </td>
		     <td>Protocolo-Oswestry</td>
	     </tr>
     	<%
    	}
	} 
	%>
    </tbody>	
	</table>
	
	</div>
	
  </body>
</html>
