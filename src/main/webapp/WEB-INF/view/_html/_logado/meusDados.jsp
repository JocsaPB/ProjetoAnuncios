<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en" style="overflow: hidden">
<head>
<meta charset="utf-8">
<title>Meus anúncios</title>

<%@include file="../_includes/head.jsp"%>

</head>

<body>
	<div class="container">

		<ol class="breadcrumb"
			style="margin-top: 50px; background: none; position: fixed absolute;">
			<li><a href="home">Home</a></li>
			<li class="active">Meus dados</li>
		</ol>

		<!-- CONFIRMAÇÃO DE SENHA -->
		<!-- set up the modal to start hidden and fade in and out -->
		<div id="myModal" class="modal fade bs-example-modal-sm">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<!-- dialog body -->
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						Informe sua senha para liberação!
					</div>
					<!-- dialog buttons -->
					<div class="modal-footer">
					<form action="verificarSenha" method="post">
						<input class="form-control" type="password" name="senha">
						<a ><button type="submit" class="btn btn-inverse" style="margin-top: 5px">OK</button></a>
					</form>
					</div>
				</div>
			</div>
		</div>

		<%@include file="../_includes/navBar-logado.jsp"%>

		<c:if test="${alterado == true}">
			<script>
				alert("Usuario alterado com sucesso!");
			</script>
		</c:if>

		<!-- INÍCIO CONTENT E SIDEBAR -->
		<div class="row" style="position: absolute; top: 10%;">
			<h2 class="text-center col-md-11">Meus Dados</h2>

			<!-- ÍNÍCIO CONTENT -->
			<div class="well alinhamento-content col-md-9"
				style="height: 540px; width: 1055px; left: 41px;">


				<div class="row">
					<div class="col-md-9" style="left: 145px; margin-top: 50px">
						<form role="form" method="post" action="<c:url value="/alterarUsuario"></c:url>">
							<div hidden="true" class="form-group">
								<label for="nome">ID:</label> <input type="password"
									class="form-control" id="id" name="id" value="${usuarioLogado.id}"
									readonly="readonly">
							</div>
							<div class="form-group">
								<label for="nome">Nome:</label> <input type="text"
									class="form-control" id="nome" name="nome" value="${usuarioLogado.nome}"
									readonly="readonly">
							</div>
							<div class="form-group">
								<label for="email">E-mail:</label> <input type="email"
									class="form-control" id="email" name="email" value="${usuarioLogado.email}"
									readonly="readonly">
							</div>
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
									class="form-control" id="pwd" name="senha" value="${usuarioLogado.senha}"
									readonly="readonly">
							</div>
							
							
							<button type="button" onclick="abrirModal()" class="btn btn-default" style="color: black">Liberar</button>
							<button id="botaoAlterar" disabled="disabled" type="submit" class="btn btn-warning">Alterar</button>
							<c:if test="${senhaVerificada == true}">
								<script type="text/javascript">
									document.getElementById("botaoAlterar").disabled = false;
									document.getElementById("nome").readOnly = false;
 									document.getElementById("email").readOnly = false;
 									document.getElementById("pwd").readOnly = false;
								</script>
							</c:if>
						
						
						</form>
					</div>
				</div>


			</div>
			<!-- FIM CONTENT -->

		</div>
	</div>

</body>