<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="domains.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <title>Información Paciente</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="style/css/infoUser.css">
    <link rel="stylesheet" type="text/css" href="style/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
    <script src="scripts/jquery-3.3.1.min.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
  	<script type="text/javascript" charset="utf8" src="scripts/infoUser.js"></script>
  	
  	<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
  	
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
    </div>
    </nav>
  	
  	<% 
	ArrayList<WoundTracks> listWounds = new ArrayList<WoundTracks>(); 
  	listWounds = (ArrayList<WoundTracks>) request.getAttribute("wound");
  	String nombreUser = request.getAttribute("nombreUser").toString();
  	%>
  	
  	<input type="hidden" value="<%=nombreUser%>" id ="nombreUser">
  	
  	<div id="cuerpo">
  	
  	<h2>Datos de <%=request.getAttribute("nombreUser")%></h2>
  	
  	
  	<table id="infoUserTable" class="display nowrap">
  	  <thead>
		  <tr>
		    <th style="text-align:center">Fecha</th>
		    <th style="text-align:center">Nivel de dolor de pierna</th>
		    <th style="text-align:center">Nivel de dolor de espalda</th>
		    <th style="text-align:center">Temperatura</th>
		    <th style="text-align:center">Resultado Oswestry</th>
		  </tr>
	  </thead>
	  <tbody>
	  
	  	<% 
		if(0 != listWounds.size()) { 
	    	for(int i=0; i<listWounds.size(); i++) 
	    	{ 
	    		
				Date fecha = listWounds.get(i).getFecha();
				DateFormat dateFormat = new SimpleDateFormat("dd/MM/YYYY");
				
				%><!--<input type="hidden" value="<%=nombreUser%> - <%=dateFormat.format(fecha)%>" id ="nombreUser"> --><%
				
	    		%>
		    	<tr style="text-align:center">
				    <td><%=dateFormat.format(fecha)%></td>
				    <td><%=listWounds.get(i).getDolorPierna()%></td>
				    <td><%=listWounds.get(i).getDolorEspalda()%></td>
				    <td><%=listWounds.get(i).getTemperatura()%>ºC</td>
				    <td><%=listWounds.get(i).getScore()%></td>
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
