<div class="row">
	<!-- INICIO NAVBAR -->
	<div id="navbar">

		<nav class="navbar navbar-inverse navbar-fixed-top"
			style="width: 84%; left: 7.5%;">
			<div class="navbar-header">
				<!--  PRA QUE SERVE ISTO?
                 
                 <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                 <span class="sr-only">Toggle navigation</span>
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
               </button> -->

				<a class="navbar-brand" href="<c:url value="/"></c:url>">Carros.com</a>
				<!-- INDEX -->
			</div>

			<div class="collapse navbar-collapse js-navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<c:url value="/todosAnunciosDeslogado"></c:url>">Anúncios</a></li>
					<!-- TODOS ANUNCIOS -->
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Faça
							seu Login <span class="caret"> </span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li>
								<form class="form-inline" role="form" method="post"
									action="<c:url value="/usuarioLogin"></c:url>">
									<div>
										<input type="text" name="email" placeholder="Email"
											class="input-sm form-control margin5"></input>
									</div>
									<div>
										<input type="password" name="senha" placeholder="Senha"
											class="input-sm form-control margin5"></input>
									</div>
									<button type="submit" class="btn btn-sm btn-inverse"
										value="Logar">Logar</button>
								</form>
							</li>
							<li class="divider"></li>
							<li><a href="<c:url value="/formCadastroUsuario"></c:url>">Cadastrar</a></li>
							<!-- CADASTRO -->
						</ul></li>
					<ul class="nav navbar-nav">
						<li>&nbsp&nbsp &nbsp</li>
					</ul>
				</ul>

			</div>
			<!-- /.nav-collapse -->
		</nav>
	</div>
</div>
<!-- FIM NAVBAR -->