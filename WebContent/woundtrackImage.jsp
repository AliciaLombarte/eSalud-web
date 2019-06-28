<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Imagen</title>
<link rel="stylesheet" type="text/css" href="style/css/pacientes.css">
<link rel="stylesheet" type="text/css"
	href="style/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
<script src="scripts/jquery-3.3.1.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="scripts/pacientes.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<img
			style="width: 8%; height: 8%; margin-top: 0.3%; margin-right: 1%; float: left"
			src="images/logo.jpg">
		<ul class="nav navbar-nav">
			<li>
				<form action="/TFG-Web/controller" method="post">
					<input type="hidden" name="option" value="pacientes"> <input
						type="submit" class="btn btn-primary botonesHeader1"
						value="Pacientes">
				</form>
			</li>
			<li>
				<form class="" action="/TFG-Web/controller" method="post">
					<input type="hidden" name="option" value="cuestionarios"> <input
						type="submit" class="btn btn-info botonesHeader2"
						value="Cuestionarios">
				</form>
			</li>
			<li>
				<form class="" action="/TFG-Web/controller" method="post">
					<input type="hidden" name="option" value="protocolos"> <input
						type="submit" class="btn btn-info botonesHeader3"
						value="Protocolos">
				</form>
			</li>
		</ul>
	</div>
	</nav>
		<%
		String image = request.getAttribute("image").toString();
	%>
	<div>
		<img alt="wountrack image" src="<%=image%>">
	</div>
</body>
</html>