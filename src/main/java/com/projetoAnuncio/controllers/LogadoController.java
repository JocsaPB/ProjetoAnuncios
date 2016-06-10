package com.projetoAnuncio.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.projetoAnuncio.beans.Usuario;
import com.projetoAnuncios.dao.AnuncioDao;

@Controller
@Transactional
public class LogadoController {

	@Autowired
	private AnuncioDao anuncioDao;
	
	@RequestMapping("/home")
	public ModelAndView home(HttpSession session){
		ModelAndView mav = new ModelAndView("/_html/_logado/home");
		mav.addObject("ultimosAnuncios",  anuncioDao.theThreeLast((Usuario)session.getAttribute("usuarioLogado")));
		return mav;
	}
	
	@RequestMapping("/todosAnunciosLogado")
	public ModelAndView todosAnuncios(HttpSession session){
		ModelAndView mav = new ModelAndView("/_html/_logado/todosAnunciosLogado");
		mav.addObject("todosAnuncios",anuncioDao.findAll());
		return mav;
	}
	
	@RequestMapping("/meusAnuncios")
	public String anunciosCliente(){
		return "/_html/_logado/meusAnuncios";
	}
	
	@RequestMapping(value = "/meusDados", method = RequestMethod.GET)
	public ModelAndView meusDados(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/_html/_logado/meusDados");
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		mav.addObject("usuarioLogado", usuario);
		return mav;
	}
	
	@RequestMapping("/formCadastrarAnuncio")
	public String cadastroAnuncio() {
		return "/_html/_logado/cadastrarAnuncio";
	}
	
	@RequestMapping("/formEditarAnuncio/{id}")
	public ModelAndView formEditarAnuncio(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView("/_html/_logado/editarAnuncio");
		mav.addObject("anuncio",anuncioDao.find(id));
		return mav;
	}
	
	
}
