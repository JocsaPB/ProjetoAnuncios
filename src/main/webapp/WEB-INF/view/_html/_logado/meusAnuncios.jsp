<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<li class="active">Meus anúncios</li>
		</ol>

		<%@include file="../_includes/navBar-logado.jsp"%>
		<!-- INSERÇÃO DE ANUNCIO, CONFIRMAÇÃO -->
		<c:if test="${inseriu == true}">
			<script type="text/javascript">
	      		alert("O anúncio foi inserido com sucesso!");	
	      	</script>
		</c:if>
		<c:if test="${removeu == true}">
			<script type="text/javascript">
	      		alert("O anúncio foi removido com sucesso!");	
	      	</script>
		</c:if>


		<!-- INÍCIO CONTENT E SIDEBAR -->
		<div class="row row-content">

			<!-- ÍNÍCIO CONTENT -->
			<div id="content" class="col-md-12 alinhamento-content">
				
				<c:if test="${listaAnuncios.size() <= 3 }">
					<script>
						document.getElementById("botaoPesquisar").style.display='none';
						alert("Escondeu?");
					</script>
				</c:if>

				<h2 class="text-center">Meus anúncios</h2>
				<div class="well div-content-anuncios">
					<form action="pesquisarLogadoB" class="form-inline" style="margin-left: 325px;">
						<label>Anúncio</label> <input type="text" name="titulo" class="form-control" placeholder="Título do anúncio!">
						<button type="button" id="botaoPesquisar" class="btn btn-primary">Pesquisar</button>
						<button type="button" onclick="cadastrarAnuncio()"
							class="btn btn-primary">Novo anúncio</button>
					</form>
					<br>

					<div class="list-group div-content-todos-anuncios">
						<c:forEach items="${listaAnuncios}" var="meuAnuncio">
							<a href="anuncio/?id=${meuAnuncio.id}"
								style="color: #373735 !important">
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
										<h4 class="list-group-item-heading">${meuAnuncio.titulo}
										</h4>
										<p class="list-group-item-text">${meuAnuncio.descricao}</p>
									</div>
									<div class="col-md-3 text-center">
										<h2></h2>
										<a href="<c:url value="/formEditarAnuncio/${meuAnuncio.id}"></c:url>"><buttontype="button" class="btn btn-warning btn-block">Editar</button></a>
										<a href="<c:url value="/removerA/${meuAnuncio.id}"></c:url>"><button type="button" style="color: white; margin-top: 5px" class="btn btn-danger btn-block">Deletar</button></a>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>

				</div>
				<!-- FIM CONTENT -->

			</div>
	</div>
</body>