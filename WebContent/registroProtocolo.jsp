<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="domains.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <title>Inicio</title>
    <link rel="stylesheet" type="text/css" href="style/css/registroProtocolo.css">
    <script type="text/javascript" src="scripts/.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="style/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script>
    
    </script>
  </head>
  <body>
  
  <nav class="navbar navbar-default">
	  <div class="container-fluid">
	 	<!--  
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">WebSiteName</a>
	    </div>
	    --> 
	    <img style="width:8%; height:8%; margin-top:0.3%; margin-right:1%; float:left" src="images/logo.jpg">
	    <ul class="nav navbar-nav">
	      <li>
	      <form  action="/TFG-Web/controller" method="post">
	        	<input type="hidden" name="option" value="pacientes">
	       	 	<input type="submit" class="btn btn-info botonesHeader1" value="Pacientes">
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
	       	 	<input type="submit" class="btn btn-primary botonesHeader3" value="Protocolos">
	      </form>
	      </li>
	    </ul>
	  </div>
	</nav>
   
    
    <div class="wrapper">
      <form class="form-signin" action="/TFG-Web/controller" method="post">
        <h2 class="form-signin-heading">Añadir protocolo</h2>
        <br>
        <input type="hidden" name="option" value="protocol">
        <input class="form-control" type="text" name="nombre" placeholder="Nombre del protocolo">
        <br>
        <p> Seleccione el cuestionario: 
        <select name="cuestionario">
        	
        	<% 
        	ArrayList<Cuestionario> listCuestionarios = new ArrayList<Cuestionario>(); 
    		listCuestionarios = (ArrayList<Cuestionario>) request.getAttribute("listCuestionarios");
    		request.setAttribute("listCuestionarios",listCuestionarios);
    		
    		if(0 != listCuestionarios.size()) { 
    	    	for(int i=0; i<listCuestionarios.size(); i++) 
    	    	{ 
    	    	%>
    	    		<option value="<%=listCuestionarios.get(i).getNombre()%>"><%=listCuestionarios.get(i).getNombre()%></option>
    	    	<%
    	    	}
    	    }
    	    %>
		</select>
		</p>
		<br>
        <input class="form-control" type="number" min="1" name="frecuencia" placeholder="Frecuencia de aviso (días)" >
        <br>
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="Añadir">
      </form>

    </div>
     
  </body>
</html>
