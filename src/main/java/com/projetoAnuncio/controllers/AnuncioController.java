package com.projetoAnuncio.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.projetoAnuncio.beans.Anuncio;
import com.projetoAnuncio.beans.Usuario;
import com.projetoAnuncios.dao.AnuncioDao;

@Controller
@Transactional
public class AnuncioController {

	@Autowired
	private AnuncioDao anuncioDao;

	@RequestMapping(value = "/cadastrarAnuncio", method = RequestMethod.POST)
	public String cadastrarAnuncio(Anuncio anuncio, RedirectAttributes redirect, HttpServletRequest request) {
		try {
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
			System.out.println("Anuncio é: "+anuncio.getTitulo()+" "+anuncio.getModelo()+" "+anuncio.getDescricao());
			anuncio.setUsuario(usuario);
			System.out.println(anuncio.getUsuario().getNome()+" "+anuncio.getUsuario().getId());
			anuncioDao.persiste(anuncio);
			redirect.addFlashAttribute("sucesso", true);
			return "redirect:meusAnuncios";
		} catch (Exception e) {
			System.out.println(e.getStackTrace());
			return "";
		}
	}

	
	@RequestMapping(value = "/persistirAlteracaoAnuncio", method = RequestMethod.POST)
	public ModelAndView editarAnuncio(Anuncio anuncio, RedirectAttributes redirect, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:meusAnuncios");
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		anuncio.setUsuario(usuario);
		anuncioDao.merge(anuncio);
		redirect.addAttribute("alterou", true);
		return mav;
	}
	
	
	@RequestMapping(value = "/pesquisarDeslogado", method = RequestMethod.POST)
	public ModelAndView pesquisa(Anuncio anuncio, RedirectAttributes redirect){
		ModelAndView mav = new ModelAndView("/todosAnunciosDeslogado");
		
		List<Anuncio> anuncios = anuncioDao.pesquisar(anuncio);
		if(anuncios.size()>0){
			mav.addObject("todosAnuncios", anuncios);
		}else{
			redirect.addFlashAttribute("vazio",true);
			mav.addObject("todosAnuncios", anuncioDao.findAll());
		}
		
		return mav;
	}
	
	
	@RequestMapping(value = "/pesquisarLogado", method = RequestMethod.POST)
	public ModelAndView pesquisaLogado(Anuncio anuncio, RedirectAttributes redirect){
		ModelAndView mav = new ModelAndView("/_html/_logado/todosAnunciosLogado");
		
		List<Anuncio> anuncios = anuncioDao.pesquisar(anuncio);
		if(anuncios.size()>0){
			mav.addObject("todosAnuncios", anuncios);
		}else{
			redirect.addFlashAttribute("vazio",true);
			mav.addObject("todosAnuncios", anuncioDao.findAll());
		}
		
		return mav;
	}
	
	//PESQUISA REALIZADA NA CLASSE MEUS ANUNCIOS
	@RequestMapping(value = "/pesquisarLogadoB", method = RequestMethod.POST)
	public ModelAndView pesquisaLogadoB(Anuncio anuncio, RedirectAttributes redirect, HttpSession session){
		ModelAndView mav = new ModelAndView("/_html/_logado/meusAnuncios");
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		List<Anuncio> anuncios = anuncioDao.pesquisarById(anuncio, usuario);
		if(anuncios.size()>0){
			mav.addObject("todosAnuncios", anuncios);
		}else{
			redirect.addFlashAttribute("vazio",true);
			
			mav.addObject("todosAnuncios", anuncioDao.findAllById(usuario));
		}
		
		return mav;
	}
	
	
	@RequestMapping("/anuncio")
	public ModelAndView anuncio(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/anuncio");
		mav.addObject("anuncio",anuncioDao.find(Integer.parseInt(request.getParameter("id"))));
		return mav;
	}
		
	@RequestMapping("/removerA/{id}")
	public String removerA(@PathVariable("id") Integer id, RedirectAttributes redirect){
		redirect.addAttribute("removeu", true);
		anuncioDao.remove(id);
		return "redirect:/meusAnuncios";
	}
	
	@RequestMapping("/removerB/{id}")
	public String removerB(@PathVariable("id") Integer id, RedirectAttributes redirect){
		redirect.addAttribute("removeu", true);
		anuncioDao.remove(id);
		return "redirect:/todosAnunciosLogado";
	}
	

}
