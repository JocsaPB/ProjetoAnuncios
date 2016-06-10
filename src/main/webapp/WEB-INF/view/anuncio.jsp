<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Carros.com - Anúncios</title>
<%@include file="_html/_includes/head.jsp"%>
</head>

<body>
	<div class="container">

		<%@include file="_html/_includes/navBar-deslogado.jsp"%>
      
      <!-- INÍCIO CONTENT E SIDEBAR -->     
      <div class="row row-content">

         <!-- ÍNÍCIO CONTENT -->
         <div id="content" class="col-md-12 alinhamento-content">
               
               <h2 class="text-center">Anúncio</h2>
               <div class="well div-content-anuncios">
                  
                  
                  <div class="list-group">
                     <div class="well anuncio">
                            <div class="media col-md-3">
                                <figure class="pull-left">
                                	<!--IMG STANDARD src="http://placehold.it/350x250"-->
									<c:url value="resources/_img/carro1.jpg" var="url"></c:url>
									<img class="media-object img-rounded img-responsive"
										src="${urdl}">
                                </figure>
                            </div>
                            <div class="col-md-6">
                                <h3 class="list-group-item-heading"> ${anuncio.titulo} </h3>
                                <label>Anunciante:</label> ${anuncio.usuario.nome}<br>
                                <label>Modelo:</label> ${anuncio.modelo}<br>
                                <label>Fabricante:</label> ${anuncio.fabricante}<br>
                                <label>Ano de fabricação:</label> ${anuncio.ano} <br>
                                <label>Potência do motor:</label> ${anuncio.potenciaDoMotor} <br>
                                <label>Preço: </label> R$ ${anuncio.valor}<br> 
                                
                                <p style="text-align: justify"><label>Descrição:</label> ${anuncio.descricao}</p>
                                <br>
                            </div>
                            <div class="col-md-3 text-center">
                            	<h2></h2>
                                <button type="button" class="btn btn-default btn-block" onclick="voltar()" style="background: #373735; color: white"> Voltar </button>
                            </div>
                      </div>
                  </div>

               </div>

         </div>
         <!-- FIM CONTENT -->
	

      </div>

	</div>
</body>
</html>