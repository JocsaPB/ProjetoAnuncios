<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en" style="overflow: hidden">
<head>
<meta charset="UTF-8">
<title>Carros.com - Anúncios</title>
<%@include file="_html/_includes/head.jsp"%>
</head>

<body>
	<div class="container">

		<%@include file="_html/_includes/navBar-deslogado.jsp"%>

		<!-- Se a lista voltar vazia, é informado o aviso -->"
		<c:if test="${vazio == true}">
			<script type="text/javascript">
				alert("Não foi encontrado nenhum valor referente a pesquisa!");
			</script>
		</c:if>

		<!-- INÍCIO CONTENT E SIDEBAR -->
		<div class="row row-content">

			<!-- ÍNÍCIO CONTENT -->
			<div id="content" class="col-md-12 alinhamento-content">

				<h2 class="text-center">Todos os anúncios</h2>
				<div class="well div-content-anuncios">
					<form class="form-inline" action='<c:url value="/pesquisarDeslogado"></c:url>' method="post"
						style="margin-left: 300px;">
						<label>Anúncio</label> 
						<input type="text" class="form-control"	name="titulo" placeholder="Título do anúncio" /> 
						<input type="number" class="form-control" name="valor" placeholder="Preço" />
						<button type="submit" class="btn btn-primary">Pesquisar</button>
					</form>
					<br>
					<div class="list-group div-content-todos-anuncios">
						<c:forEach items="${todosAnuncios}" var="anuncio">
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
									<h5>Vendedor: ${anuncio.usuario.nome}</h5>
									<h5>Preço: ${anuncio.valor}</h5>
									<p class="list-group-item-text">${anuncio.descricao}</p>
								</div>
								<div class="col-md-3 text-center">
									<h2 style="height: 9px"></h2>
									<a href="anuncio/?id=${anuncio.id}"><button type="submit"
											class="btn btn-primary btn-block">+ INFO</button></a>
								</div>
							</div>
						</c:forEach>

					</div>

				</div>
				<!-- FIM CONTENT -->

			</div>
		</div>
	</div>
</body>