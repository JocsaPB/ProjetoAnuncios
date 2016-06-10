<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pt-br" style="overflow: hidden">
<head>
<meta charset="UTF-8">
<title>Carros.com - Home</title>

<%@include file="../_includes/head.jsp"%>

</head>

<body>
	<div class="container">
		<ol class="breadcrumb"
			style="margin-top: 50px; background: none; position: fixed absolute;">
			<li class="active">Home</li>
		</ol>

		<%@include file="../_includes/navBar-logado.jsp"%>

		<c:if test="${ sucesso == true }">
			<script type="text/javascript">
      		alert("Anúncio cadastrado com sucesso!");
      	</script>

		</c:if>

		<!-- INÍCIO CONTENT E SIDEBAR -->
		<div class="row row-content">

			<!-- ÍNÍCIO CONTENT -->
			<div id="content" class="col-md-12 alinhamento-content">

				<h2 class="text-center">Meus últimos anúncios adicionados!</h2>
				<div class="well div-content-anuncios">


					<div class="list-group">

						<c:forEach items="${ultimosAnuncios}" var="anuncio">
							<c:if test="${usuarioLogado.id == anuncio.usuario.id}">
								<div class="list-group-item"
									style="margin-left: 70px; margin-right: 70px;">
									<a href="anuncio">
										<div class="media col-md-3">
											<figure class="pull-left">
												<!--IMG STANDARD src="http://placehold.it/350x250"-->
												<img class="media-object img-rounded img-responsive"
													src="resources/_img/carro1.jpg" alt="carro1">
											</figure>
										</div>
										<div class="col-md-6">
											<h4 class="list-group-item-heading"
												style="color: #373735 !important">${anuncio.titulo}</h4>
											<h5 style="color: #373735 !important">Vendedor:
												${anuncio.usuario.nome}</h5>
											<h5 style="color: #373735 !important">Preço:
												${anuncio.valor}</h5>
											<p class="list-group-item-text"
												style="color: #373735 !important">${anuncio.descricao}</p>
										</div>
									</a>
									<div class="col-md-3 text-center">
										<h2 style="height: 9px"></h2>
										<a href="formEditarAnuncio/${anuncio.id}"
											style="color: white;"><button type="button"
												class="btn btn-warning btn-block">Editar</button></a>
									</div>
								</div>
							</c:if>
							<c:if test="${usuarioLogado.id != anuncio.usuario.id}">
								<div class="list-group-item"
									style="margin-left: 70px; margin-right: 70px;">
									<div class="media col-md-3">
										<figure class="pull-left">
											<!--IMG STANDARD src="http://placehold.it/350x250"-->
											<img class="media-object img-rounded img-responsive"
												src="resources/_img/carro1.jpg" alt="carro1">
										</figure>
									</div>
									<div class="col-md-6">
										<h4 class="list-group-item-heading">${anuncio.titulo}</h4>
										<h5 style="color: #373735 !important">Vendedor:
											${anuncio.usuario.nome}</h5>
										<h5 style="color: #373735 !important">Preço:
											${anuncio.valor}</h5>
										<p class="list-group-item-text">${anuncio.descricao}</p>
									</div>
									<!-- EDITAR PARA APARECER OS ANUNCIOS QUE PODEM SER EDITÁVEIS -->
									<div class="col-md-3 text-center">
										<h2 style="height: 9px"></h2>
										<a href="anuncio/?id=${anuncio.id}"><button type="submit"
												class="btn btn-primary btn-block">+ INFO</button></a>
									</div>
								</div>
							</c:if>
						</c:forEach>


						<div style="min-height: 35px; margin-top: 15px;">
							<h3 class="text-center" style="padding-top: 9px">
								Crie seu anúncio fácil e simples clicando <a
									href="formCadastrarAnuncio">aqui!</a>
							</h3>
						</div>
					</div>

				</div>

			</div>
			<!-- FIM CONTENT -->

		</div>
	</div>

</body>