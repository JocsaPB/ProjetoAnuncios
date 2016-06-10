package com.projetoAnuncios.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

import com.projetoAnuncio.beans.Usuario;

@Repository
public class UsuarioDao {

	@PersistenceContext
	private EntityManager manager;
	
	public void persiste(Usuario usuario){
			this.manager.persist(usuario);
	}

	public void merge(Usuario usuario){
		System.out.println("Entrou no merge");
		System.out.println(usuario.getId());
		System.out.println(usuario.getNome());
		System.out.println(usuario.getEmail());
		System.out.println(usuario.getSenha());
		this.manager.merge(usuario);
	}
	
	public Usuario find(int id){
		Usuario usuario = this.manager.find(Usuario.class, id);
		return usuario;
	}
	
	public List<Usuario> findAll(){
		return (ArrayList<Usuario>) this.manager.createQuery("select c from usuario as c").getResultList();
	}
	
	public void remove(int id){
		Usuario usuario = find(id); 
		this.manager.remove(usuario);
	}
	
	public Usuario thereIs(Usuario usuarioInformado){
		Usuario usuario;
		System.out.println(usuarioInformado.getEmail());
		try {
			usuario  = (Usuario) this.manager.createQuery("select U from usuario U where U.email = :email")
					.setParameter("email", usuarioInformado.getEmail()).getSingleResult();
			if(usuario != null){
				if(usuario.getSenha().equals(usuarioInformado.getSenha())){
					return usuario;
				}else{
					return null;
				}
			}else{
				return null;
			}
		} catch (Exception e) {
			System.out.println(e.getStackTrace());
			return null;
		}
		
	}
	
}
