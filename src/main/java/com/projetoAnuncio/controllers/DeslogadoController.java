package com.projetoAnuncio.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.projetoAnuncios.dao.AnuncioDao;

@Controller
@Transactional
public class DeslogadoController {

	@Autowired
	private AnuncioDao anuncioDao;
	
	@RequestMapping("/")
	public ModelAndView index(HttpSession session){
		session.setAttribute("usuarioLogado", null);
		ModelAndView mav = new ModelAndView("/index");
		mav.addObject("theLastThree",anuncioDao.theThreeLast(null));
		return mav;
	}
		
	@RequestMapping("/todosAnunciosDeslogado")
	public ModelAndView todosOsAnuncios(){
		ModelAndView mav = new ModelAndView("/todosAnunciosDeslogado");
		mav.addObject("todosAnuncios", anuncioDao.findAll());
		return mav;
	}
	
	@RequestMapping("/formCadastroUsuario")
	public String cadastrarUsuario(){
		return "/cadastroUsuario";
	}
	
}
