<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pt-br" style="overflow-x: hidden !important">
<head>
<head>
<meta charset="utf-8">
<title>Carros.com</title>

<%@include file="_html/_includes/head.jsp"%>
</head>

<body>
	<div class="container">

		<%@include file="_html/_includes/navBar-deslogado.jsp"%>

		<!-- INÍCIO CONTENT E SIDEBAR -->
		<div class="row" style="position: absolute; top: 10%;">
			<h2 class="text-center col-md-11">Novo Cadastro</h2>

			<!-- ÍNÍCIO CONTENT -->
			<div class="well alinhamento-content col-md-9"
				style="height: 540px; left: 41px; width: 1055px">


				<div class="row">
					<div class="col-md-9" style="left: 145px; margin-top: 50px">
						<form role="form" action="cadastrarUsuario">
							<div class="form-group">
								<label for="nome">Nome:</label> <input type="text"
									class="form-control" name="nome" id="nome"
									placeholder="Digite seu nome">
							</div>
							<div class="form-group">
								<label for="email">E-mail:</label> <input type="email"
									class="form-control" name="email" id="email"
									placeholder="Digite seu email">
							</div>
							<div class="form-group">
								<label for="senha">Password:</label> <input type="password"
									class="form-control" name="senha" id="senha"
									placeholder="Digite uma senha">
							</div>
							<button type="submit" class="btn btn-default">Cadastrar</button>
						</form>
					</div>
				</div>
			</div>
			<!-- FIM CONTENT -->



		</div>
</body>
</html>