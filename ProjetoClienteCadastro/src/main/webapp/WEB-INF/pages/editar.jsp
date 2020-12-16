<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/4.4.1/css/bootstrap.min.css" />
<link rel="stylesheet" href="/webjars/font-awesome/5.12.0/css/all.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="static/materialize/css/materialize.min.css"  media="screen,projection"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<title>Edicao</title>

<style>
body {
  background-image: url("https://www.ideiademarketing.com.br/wp-content/uploads/2016/09/fotolia_48083232_l1.jpg");
  background-size: 100%;
}
span{
	font-size: 50px;
}
</style>

</head>
	<body>	
		
	<p>
		<div class="card col-md-6 offset-md-3">
 <div class="card-header bg-info">
 	<h5 class="card-title col-md-6 offset-3 text-center">
   	 ${msg}
    </h5>
</div>
  				<div class="card-body col-md-12">
				<form method="post" action="/alterar/alterar">
				<div class="form-group">
				    <label for="id">Id</label>
				    <input type="number" class="form-control" name="id" id="id" required="required" value="${cliente.idCliente}" readonly />
				      <label for="nome">Nome</label>
				      <input type="text" class="form-control" name="nome" id="nome" placeholder="Email" required="required" value="${cliente.nome}" />
				      <label for="email">Email</label>
				      <input type="email" class="form-control" name="email" id="inputPassword4" placeholder="Password" required="required" value="${cliente.email}" />			
				    <label for="endereco">Endereco</label>
				    <input type="text" class="form-control" name="endereco" id="endereco" required="required" value="${cliente.endereco}" />
				    
				    <br/>
				    
				  <button type="submit" class="btn btn-lg btn-info">ALTERAR DADOS</button>
				  <button type="submit" class="btn btn-lg btn-info"><a href="sistema.jsp"></a>CANCELAR</button>
				  </div>
				</form>
				</div>				
			</div>	
</body>
	
	</html>