<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="domains.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
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
	    <%--
	    <ul class="nav navbar-nav navbar-right">
	      <li>
	      	<a href="registroCuestionario.jsp"><button class="btn btn-success botonesHeader4" type="button"><img src="images/add.png">   Añadir cuestionario</button></a>
	      </li>
	    </ul>
	    --%>
	  </div>
	</nav>
	
	<div id="cuerpo">
  
  	<h1>CUESTIONARIOS</h1>
  	<h2>Lista de cuestionarios</h2>
	<%
	if(null != request.getAttribute("listCuestionarios")) {
		ArrayList<Cuestionario> listCuestionarios = new ArrayList<Cuestionario>(); 
		listCuestionarios = (ArrayList<Cuestionario>) request.getAttribute("listCuestionarios");
		
		if(0 != listCuestionarios.size()) { 
			%>
			<table id="cuestionariosTable" class="display">
		  	  <thead>
				  <tr>
				    <th style="text-align:center">Nombre</th>
				    <th style="text-align:center">Nº preguntas</th>
				    <%-- <th style="text-align:center">Editar</th>--%>
				  </tr>
			  </thead>
			  <tbody>
			  <% 
	    	for(int i=0; i<listCuestionarios.size(); i++) 
	    	{ 
	    		
	    	%>
	    		<tr style="text-align:center">
	    		<td><%=listCuestionarios.get(i).getNombre().toString()%> </td>
	    		<td>10</td>
	    		<%--
		        <td>
		    	  <form class="" action="/TFG-Web/controller" method="post">
		        	<input type="hidden" name="option" value="editCuestionario">
		        	<input type="hidden" name="email" value="<%=listCuestionarios.get(i).getNombre().toString()%>" >
		       	 	<input type="image" alt="Submit" src="images/edit.png">
		     	</form>
		        </td>
		        --%>
		      	</tr>
	     	<%
	    	} %>
			 </tbody>	
			</table>
		<%
	    } else {
	    	%>
			<p>No hay cuestionarios creados</p>
		<%
		}
	}else {
    	%>
		<p>No hay cuestionarios creados</p>
	<%
	}
	%>
	
	</div>
  </body>
</html>
