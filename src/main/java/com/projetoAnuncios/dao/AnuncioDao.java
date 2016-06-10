package com.projetoAnuncios.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.projetoAnuncio.beans.Anuncio;
import com.projetoAnuncio.beans.Usuario;

@Repository
public class AnuncioDao {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void persiste(Anuncio anuncio){
			this.manager.persist(anuncio);
	}

	public void merge(Anuncio anuncio){
		this.manager.merge(anuncio);
	}
	
	public Anuncio find(int id){
			Anuncio anuncio = this.manager.find(Anuncio.class, id);
			return anuncio;
	}
	
	public List<Anuncio> findAll(){
			return (ArrayList<Anuncio>) this.manager.createQuery("select a from anuncio as a order by id desc").getResultList();
	}
	
	public List<Anuncio> findAllById(Usuario usuario){
		try {
			return (ArrayList<Anuncio>) 
					this.manager.createQuery("select c from anuncio as c "
							+ "where usuario_id = :usuarioId order by id desc").setParameter("usuarioId", usuario.getId()).getResultList();
		} catch (Exception e) {
			System.out.println(e.getStackTrace());
		}
		return null;
	}
	
	public List<Anuncio> theThreeLast(Usuario usuario){
		if(usuario==null){
			return (List<Anuncio>) this.manager.createQuery("select a from anuncio as a order by id desc").setMaxResults(3).getResultList();	
		}else{
			return (List<Anuncio>) this.manager.createQuery("select a from anuncio as a where usuario_id = :usuarioId order by id desc").setParameter("usuarioId", usuario.getId()).setMaxResults(3).getResultList();
		}
	}
	
	public List<Anuncio> pesquisar(Anuncio anuncio){
		StringBuffer query = new StringBuffer("select a from anuncio as a where 1=1");
		
		if(!anuncio.getTitulo().isEmpty()){
			query.append(" and a.titulo like :titulo");
		}
		if(anuncio.getValor() != 0){
			query.append(" and a.valor = :valor");
		}
		query.append(" order by a.id desc");
		
		Query q = this.manager.createQuery(query.toString(),Anuncio.class);
		
		if(!anuncio.getTitulo().isEmpty()){
			q.setParameter("titulo", "%"+ anuncio.getTitulo() +"%");
		}
		if(anuncio.getValor() != 0){
			q.setParameter("valor", anuncio.getValor());
		}
		
		return q.getResultList();
	}
	
	public List<Anuncio> pesquisarById(Anuncio anuncio, Usuario usuario){
		StringBuffer query = new StringBuffer("select a from anuncio as a where a.usuario_id = :usuarioId");
		
		if(!anuncio.getTitulo().isEmpty()){
			query.append(" and a.titulo like :titulo");
		}
		query.append(" order by a.id desc");
		
		Query q = this.manager.createQuery(query.toString(),Anuncio.class);
		
		if(!anuncio.getTitulo().isEmpty()){
			q.setParameter("titulo", "%"+ anuncio.getTitulo() +"%");
			q.setParameter("usuarioId", usuario.getId());
		}
		
		return q.getResultList();
	}
	
	
	public void remove(int id){
		Anuncio anuncio = find(id); 
		this.manager.remove(anuncio);
	}
	
	
	
	
}
