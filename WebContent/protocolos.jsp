<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="domains.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <title>Pacientes</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="style/css/protocolos.css">
    <link rel="stylesheet" type="text/css" href="style/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
    <script src="scripts/jquery-3.3.1.min.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
  	<script type="text/javascript" charset="utf8" src="scripts/protocolos.js"></script>

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
	    <ul class="nav navbar-nav navbar-right">
	      <li style="margin:5%; margin-right:5%">
	      	<form class="" action="/TFG-Web/controller" method="post">
		     <input type="hidden" name="option" value="createProtocol">
		     <input class="btn btn-success" type="submit" src="images/add.png" value="Añadir protocolo">
		   </form>
	      </li>
	    </ul>
	  </div>
	</nav>
  
    <div id="cuerpo">
  	
  	<h1>PROTOCOLOS</h1>
  	
  	<h2>Lista de protocolos</h2>
  	
	<% 
	
	if(null != request.getAttribute("listProtocols")) {
		ArrayList<Protocolo> listProtocols = new ArrayList<Protocolo>(); 
		listProtocols = (ArrayList<Protocolo>) request.getAttribute("listProtocols");
		
		if(0 != listProtocols.size()) { 
			%>
			<table id="protocolosTable" class="display">
		  	  <thead>
				  <tr>
				    <th style="text-align:center">Nombre</th>
				    <th style="text-align:center">Cuestionario</th>
				    <th style="text-align:center">Frecuencia (días)</th>
				  </tr>
			  </thead>
			  <tbody>
			  <% 
		    	for(int i=0; i<listProtocols.size(); i++) 
		    	{ 
		    		
		    	%>
		    	  <tr style="text-align:center">
		    	  
		    	  	 <td><%=listProtocols.get(i).getNombre().toString()%></td>
		    	 	 <td><%=listProtocols.get(i).getCuestionario().toString()%></td>
		    	 	 <td><%=listProtocols.get(i).getFrecuencia()%></td>
			     	 
			      </tr>
		     	<%
		    	}
			 %>
			 </tbody>	
			</table>
		<%
	    } else {
	    	%>
	    		<ul>
			      <li>
			     	 <p>No hay protocolos registrados</p>
			      </li>
			    </ul>
	    	<%
	    }
	} else {
    	%>
    	<ul>
	      <li>
	     	 <p>No hay protocolos registrados</p>
	      </li>
	    </ul>
		
		<%
	}
	%>
	
	</div>
  </body>
</html>
