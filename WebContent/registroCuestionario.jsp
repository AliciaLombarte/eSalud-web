<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="domains.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <title>Cuestionarios</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="style/css/cuestionarios.css">
    <link rel="stylesheet" type="text/css" href="style/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
    <script src="scripts/jquery-3.3.1.min.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
  	<script type="text/javascript" charset="utf8" src="scripts/cuestionarios.js"></script>

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
	       	 	<input type="submit" class="btn btn-info botonesHeader1" value="Pacientes">
	      </form>
	      </li>
	      <li>
	      <form class="" action="/TFG-Web/controller" method="post">
	        	<input type="hidden" name="option" value="cuestionarios">
	       	 	<input type="submit" class="btn btn-primary botonesHeader2" value="Cuestionarios">
	      </form>
	      </li>
	      <li>
	      <form class="" action="/TFG-Web/controller" method="post">
	        	<input type="hidden" name="option" value="protocolos">
	       	 	<input type="submit" class="btn btn-info botonesHeader3" value="Protocolos">
	      </form>
	      </li>
	    </ul>
	    
	  </div>
	</nav>
	
	
	
	<div id="cuerpo">
	
      
	    <form name='myForm' id='randomTeams' class="" action="/TFG-Web/controller" method="post">
	      <h2>Registrar cuestionario</h2>
	      <input type="hidden" name="option" value="registro">
	      <div style="border:1px solid grey" id='a-players'>
	        Pregunta: <input type="text" name="pregunta">
		    <div id="input-player-list">
		   		Respuestas: <input id="a-player1" type='text' name='fname'><br>
		   		<input id="a-player1" type='text' name='fname2'><br>
		    </div>
		    <input type='button' id='addPlayer' value='Añadir respuesta'>
		    <%--  <input type='button' id='removePlayer' value='Eliminar respuesta'> --%>
	      </div>
	      <input type='button' id='addQuestion' value='Añadir pregunta'>
		  <%-- <input type='button' id='removeQuestion' value='Eliminar pregunta'> --%>
	      <input type="submit" value="Enviar">
	    </form>
	  

    </div>
    
  </body>
</html>
