<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en" style="overflow: hidden">
<head>
<meta charset="utf-8">
<title>Carros.com - Anúncios</title>
<%@include file="../_includes/head.jsp"%>
</head>

<body>
	<div class="container">
		<ol class="breadcrumb"
			style="margin-top: 50px; background: none; position: fixed absolute;">
			<li><a href="home">Home</a></li>
			<li class="active">Todos os anúncios</li>
		</ol>
		<%@include file="../_includes/navBar-logado.jsp"%>

		<!-- INÍCIO CONTENT E SIDEBAR -->
		<div class="row row-content">

			<!-- ÍNÍCIO CONTENT -->
			<div id="content" class="col-md-12 alinhamento-content">

				<h2 class="text-center">Todos os anúncios</h2>
				<div class="well div-content-anuncios">
					<form class="form-inline" action="pesquisarLogado" method="post"
						style="margin-left: 250px;">
						<label>Anúncio</label> <input type="text" class="form-control"
							name="titulo" placeholder="Título do anúncio" /> <input
							type="number" class="form-control" name="valor"
							placeholder="Preço" />
						<button type="submit" style="margin-right: 1px"
							class="btn btn-primary">Pesquisar</button>
						<button type="button" onclick="cadastrarAnuncio()"
							class="btn btn-primary">Novo anúncio</button>
					</form>
					<br>
					<div class="list-group div-content-todos-anuncios">
						<c:forEach items="${todosAnuncios}" var="anuncio">
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
										<a href="<c:url value="/formEditarAnuncio/${anuncio.id}"></c:url>"
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
											<a href="anuncio/?id=${anuncio.id}" ><button type="submit" class="btn btn-primary btn-block">+
												INFO</button></a>
										</div>
									</div>
							</c:if>
						</c:forEach>

					</div>

				</div>
				<!-- FIM CONTENT -->

			</div>

		</div>
	</div>

		</script>
</body>