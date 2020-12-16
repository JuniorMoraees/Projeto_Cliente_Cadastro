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

<title>Cadastro</title>

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

<c:set var="caminho" value="${pageContext.request.contextPath}"/>
<c:out value="${caminho}" /><br/>

<form method="post" action="/cliente/gravar">
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalExemplo">
  CADASTRAR CLIENTES
</button>

<!-- Modal -->
<div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-info">
        <h5 class="modal-title col-md-9 offset-3" id="exampleModalLabel" >CADASTRAR CLIENTES</h5>
      </div>
      <div class="modal-body col-md-1 offset-1">
        <label for="nome">NOME</label>
        <input type="text" name="nome" id="nome" size="50" class="forma-control" />
        <label for="email">EMAIL</label>
        <input type="email" name="email" id="email" size="50" class="forma-control" />
        <label for="endereco">ENDERECO</label>
        <input type="text" name="endereco" id="endereco" size="50" class="forma-control" />
      </div>
      <div class="modal-footer">
      <button type="submit" class="btn btn-info">Cadastrar</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>

<button type="button" class="btn btn-info" data-toggle="modal" data-target=".bd-example-modal-lg">
LISTAR CLIENTES
</button>

<!-- Modal --><div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    <div class="modal-header bg-info">
        <h5 class="modal-title col-md-6 offset-3 text-center" id="exampleModalLabel" >LISTAR CLIENTES</h5>
      </div>
      <div class="modal-body">
        <table width="780px" border="1">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Email</th>
					<th>Endereco</th>
					<th>Excluir</th>
					<th>Editar</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${lista}" var="cli">
					<tr>
						<td>${cli.nome}</td> 
						<td>${cli.email}</td> 
						<td>${cli.endereco}</td>
						<td><a href="${caminho}/excluir/${cli.idCliente}"><i class="fas fa-user-times col-md-9"></i></a></td>
						<td><a href="${caminho}/edicao/${cli.idCliente}"><i class="fas fa-user-edit col-md-9"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</form>
</body>

<script>

$('#meuModal').on('shown.bs.modal', function () {
	  $('#meuInput').trigger('focus')
	})
	
</script>
</html>