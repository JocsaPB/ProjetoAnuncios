<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en" style="overflow-x: hidden !important">
<head>
<meta charset="utf-8">
<title>Carros.com - Anúncios</title>
<%@include file="../_includes/head.jsp"%>
</head>

<body>
	<div class="container">
		<ol class="breadcrumb"
			style="margin-top: 50px; background: none; position: fixed absolute;">
			<li><a href="<c:url value="/home"></c:url>">Home</a></li>
			<li class="active">Alterando anúncio</li>
		</ol>

		<%@include file="../_includes/navBar-logado.jsp"%>

		<!-- INÍCIO CONTENT E SIDEBAR -->
		<div class="row" style="position: absolute; top: 10%;">
			<h2 class="text-center col-md-11">Alterar anúncio</h2>

			<!-- ÍNÍCIO CONTENT -->
			<div class="well alinhamento-content col-md-9"
				style="height: 540px; left: 41px; width: 1055px; overflow-y: auto">

				<div class="row">
					<div class="col-md-9" style="left: 145px; margin-top: 20px">
						<form role="form" action="<c:url value="/persistirAlteracaoAnuncio"></c:url>" method="post">
							<div hidden="true" class="form-group">
								<input type="number" name="id" id="id" value="${anuncio.id}">
							</div>
							<div class="form-group">
								<label for="titulo">Título do seu anúncio:</label> <input
									type="text" class="form-control" name="titulo" id="titulo"
									value="${anuncio.titulo}" placeholder="Digite o título">
							</div>
							<div class="form-group">
								<label for="modelo">Modelo:</label> <input type="text"
									class="form-control" name="modelo" id="modelo"
									value="${anuncio.modelo}" placeholder="Digite o modelo">
							</div>
							<div class="form-group">
								<label for="fabricante"> Fabricante:</label> <input type="text"
									class="form-control" name="fabricante" id="fabricante"
									value="${anuncio.fabricante}" placeholder="Digite o fabricante">
							</div>
							<div class="form-group">
								<label for="ano"> Ano:</label> <input type="number"
									class="form-control" name="ano" id="ano" value="${anuncio.ano}"
									placeholder="Ano de fabricação">
							</div>
							<div class="form-group">
								<label for="potencia">Potência do motor:</label> <input
									type="text" class="form-control" name="potenciaDoMotor"
									value="${anuncio.potenciaDoMotor}" id="potencia"
									placeholder="Digite a potência">
							</div>
							<div class="form-group">
								<label for="valor"> Valor:</label> <input type="text"
									class="form-control" name="valor" id="valor"
									value="${anuncio.valor}" placeholder="Digite o preço">
							</div>
							<div class="form-group">
								<label for="comment">Breve descrição:</label>
								<textarea class="form-control" rows="5" name="descricao"
									id="comment" placeholder="No máximo 300 caracteres">${anuncio.descricao}</textarea>
							</div>

							<button type="submit" style="color: white"
								class="btn btn-warning">Alterar</button>
						</form>
					</div>
				</div>
			</div>
			<!-- FIM CONTENT -->

		</div>
	</div>

</body>
</html>