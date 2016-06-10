package com.projetoAnuncio.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.projetoAnuncio.beans.Anuncio;
import com.projetoAnuncio.beans.Usuario;
import com.projetoAnuncios.dao.AnuncioDao;
import com.projetoAnuncios.dao.UsuarioDao;

@Controller
@Transactional
public class UsuarioController {

	@Autowired
	private UsuarioDao usuarioDao;
	@Autowired
	private AnuncioDao anuncioDao;
	
	@RequestMapping("/cadastrarUsuario")
	public String cadastrandoUsuario(Usuario usuario, RedirectAttributes redirect){
		usuarioDao.persiste(usuario);
		redirect.addFlashAttribute("sucesso", true);
		return "redirect:/";
	}
	
	@RequestMapping(value="/usuarioLogin", method = RequestMethod.POST)
	public String logar(Usuario usuarioInformado, HttpSession session, RedirectAttributes redirect){
		Usuario usuario = usuarioDao.thereIs(usuarioInformado);
		if(usuario != null){
			session.setAttribute("usuarioLogado", usuario);
			return "redirect:home";
		}else{
			redirect.addFlashAttribute("logado",false);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/alterarUsuario", method = RequestMethod.POST)
	public String alterarUsuario(Usuario usuario, RedirectAttributes redirect, HttpSession session){
		usuarioDao.merge(usuario);
		session.setAttribute("usuarioLogado", usuario);
		redirect.addFlashAttribute("alterado",true);
		return "redirect:meusDados";
	}
	
	@RequestMapping(value = "/meusAnuncios", method = RequestMethod.GET )
	public ModelAndView meusAnuncios(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/_html/_logado/meusAnuncios");
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		List<Anuncio> anuncios = (List<Anuncio>) anuncioDao.findAllById(usuario);
		mav.addObject("listaAnuncios", anuncios);
		if(anuncios!=null){
			for (Anuncio anuncio : anuncios) {
				System.out.println("Meu anuncio é: "+anuncio.getTitulo()+" valor "+anuncio.getValor());
			}
		}else{
			System.out.println("Array nulo");
		}
		return mav;
	}
	
	@RequestMapping(value = "/verificarSenha", method = RequestMethod.POST)
	public String verificarSenha(String senha, HttpSession session, RedirectAttributes redirect){
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		if(usuario.getSenha().equals(senha)){
			redirect.addFlashAttribute("senhaVerificada", true);
			return "redirect:meusDados";
		}else{
			redirect.addFlashAttribute("senhaVerificada", false);
			return "redirect:meusDados";
		}
	}
	
}
