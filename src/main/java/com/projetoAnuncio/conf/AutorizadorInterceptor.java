package com.projetoAnuncio.conf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
		throws Exception {
		
		String uri = request.getRequestURI();
		if(uri.endsWith("/")||
				uri.endsWith("anuncio")||
				uri.endsWith("formCadastroUsuario")||
				uri.endsWith("cadastrarUsuario")||
				uri.endsWith("todosAnunciosDeslogado")||
				uri.endsWith("usuarioLogin")||
				uri.endsWith("pesquisar")||
				uri.endsWith("pesquisarDeslogado"))
		{
			return true;
		}
		
		if(request.getSession().getAttribute("usuarioLogado") != null){
			return true;
		}
		response.sendRedirect("/ProjetoAnuncios");
		return false;
	}
}
