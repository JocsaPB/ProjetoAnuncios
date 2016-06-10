<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<!-- INICIO NAVBAR -->
	<div id="navbar">
		<nav class="navbar navbar-inverse navbar-fixed-top "
			style="width: 84%; left: 7.5%;">
			<div class="navbar-header">
				<!--  PRA QUE SERVE ISTO?
                 
                 <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                 <span class="sr-only">Toggle navigation</span>
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
               </button> -->
				<a class="navbar-brand" href="<c:url value="/home"></c:url>">Carros.com</a>
			</div>
			<div class="collapse navbar-collapse js-navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<c:url value="/todosAnunciosLogado"></c:url>">Anúncios</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a class="dropdown-toggle">Usuario:
							${usuarioLogado.nome}</a>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Minha
							conta <span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<!--                       <li><a href="meusAnuncios">Meus anúncios</a></li> -->
							<li><a href="<c:url value="/meusAnuncios"></c:url>">Meus
									anúncios</a></li>
							<li><a href="<c:url value="/meusDados"></c:url>">Meus
									dados</a></li>
							<li class="divider"></li>
							<li><a href="<c:url value="/"></c:url>">Deslogar</a></li>
						</ul></li>
					<ul class="nav navbar-nav">
						<li>&nbsp&nbsp &nbsp</li>
					</ul>
					</a>
					</li>
				</ul>
			</div>
			<!-- /.nav-collapse -->
		</nav>
	</div>
</div>
<!-- FIM NAVBAR -->