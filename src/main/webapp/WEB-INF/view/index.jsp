<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pt-br" style="overflow: hidden">
<head>
<meta charset="utf-8">
<title>Carros.com</title>

<%@include file="_html/_includes/head.jsp"%>

</head>

<body>
	<div class="container">
	
		<c:if test="${logado == false}">
			<script type="text/javascript">
				alert("Usuário inválido, por favor tente novamente!");
			</script>
		</c:if>

		<c:if test="${sucesso == true}">
			<script type="text/javascript">
				alert("Cadastro realizado com sucesso!");
			</script>
		</c:if>

		<c:if test="${usuarioLogado == null}">
			<%@include file="_html/_includes/navBar-deslogado.jsp"%>
		</c:if>
		<c:if test="${usuarioLogado != null}">
			<%@include file="_html/_includes/navBar-logado.jsp"%>
		</c:if>
				
		<!-- INÍCIO CONTENT E SIDEBAR -->
		<div class="row row-content">

			<!-- ÍNÍCIO CONTENT -->
			<div id="content" class="col-md-12 alinhamento-content">

				<h2 class="text-center">Últimos anúncios adicionados!</h2>
				<div class="well div-content-anuncios width-projeto"">


					<div class="list-group">
						<c:forEach items="${theLastThree}" var="anuncio">
							<div class="list-group-item" style="margin-left: 70px; margin-right: 70px;">
								<div class="media col-md-3">
									<figure class="pull-left">
										<!--IMG STANDARD src="http://placehold.it/350x250"-->
										<c:url value="resources/_img/carro1.jpg" var="url"></c:url>
										<img class="media-object img-rounded img-responsive"
											src="${url}" alt="carro2">
									</figure>
								</div>
								<div class="col-md-6">
									<h4 class="list-group-item-heading">${anuncio.titulo}</h4>
									<p class="list-group-item-text">${anuncio.descricao}</p>
								</div>
								<div class="col-md-3 text-center">
									<h2 style="height: 9px"></h2>
									<a href="anuncio/?id=${anuncio.id}" ><button type="submit" class="btn btn-primary btn-block">+
										INFO</button></a>
								</div>
							</div>
						
						</c:forEach>
						<div style="min-height: 45px; margin-top: 22px;">
							<h3 class="text-center" style="padding-top: 9px">
								Crie seu cadastro e anuncie clicando <a
									href="formCadastroUsuario">aqui!</a>
							</h3>
						</div>
					</div>

				</div>

			</div>
			<!-- FIM CONTENT -->
		</div>
	</div>
</body>
</html>