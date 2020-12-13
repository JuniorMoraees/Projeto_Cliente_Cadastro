package br.com.estudo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.estudo.entity.Cliente;
import br.com.estudo.repository.RepositoryCliente;

@Controller
public class ControllerCliente {
	
	@Autowired
	RepositoryCliente repository;
	
	
	@PostMapping(value = "/cliente/gravar", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
				public void gravar(
						@RequestParam String nome, 
						@RequestParam String email, 
						@RequestParam String endereco,
						HttpServletResponse response, 
						HttpServletRequest request, 
						HttpSession session) {
				session = request.getSession(true);
					try {
						Cliente c = new Cliente(null, nome, email, endereco);
						repository.save(c);
						session.setAttribute("msgInit", "Bem vindo ao Spring Boot");
						session.setAttribute("msg", "sistema em jsp");
						session.setAttribute("lista", repository.findAll());
						response.sendRedirect("/");
					} catch (Exception ex) {
						ex.printStackTrace();
				session.setAttribute("msg", "error :" + ex.getMessage());
				System.out.println("ok");
						}
				}
	
		@GetMapping(value = "/")
				public ModelAndView init() {
					ModelAndView model = new ModelAndView("sistema");
				try {
				List<Cliente> lista = (List<Cliente>) repository.findAll();
				model.addObject("msgInit", "Bem vindo ao Spring Boot");
				model.addObject("msg", "sistema em jsp");
				model.addObject("lista", lista);
				} catch (Exception ex) {
				}
				return model;
			}
		
	@GetMapping(value = "/editar")
				public ModelAndView editar(
						HttpServletResponse response,
						HttpServletRequest request, 
						HttpSession session) {
				session = request.getSession(true);
					ModelAndView model = new ModelAndView("editar");
					model.addObject("cliente", session.getAttribute("cliente"));
					return model;
				}
			
	
	@GetMapping(value = "/excluir/{id}")
				public void excluirID(
						@PathVariable Long id,
						HttpServletResponse response, 
						HttpServletRequest request,
						HttpSession session) {
				session = request.getSession(true);
				try {
					Cliente resposta = repository.findById(id).get();
					repository.delete(resposta);
					List<Cliente> lista = (List<Cliente>) repository.findAll();
						session.setAttribute("msgInit", "Exclusao");
						session.setAttribute("msg", "Excluindo Dados");
						session.setAttribute("lista", repository.findAll());
						response.sendRedirect("/");
				} catch (Exception ex) {
					}
	}
	
	
	@GetMapping(value = "/edicao/{id}")
				public void editar(
						@PathVariable Long id,
						HttpServletResponse response, 
						HttpServletRequest request,
						HttpSession session) {
				session = request.getSession(true);
				try {
					Cliente resposta = repository.findById(id).get();
					session.setAttribute("msgInit", "Editar os Dados");
					session.setAttribute("msg", "Edição");
					session.setAttribute("cliente", resposta);
					response.sendRedirect("/editar");
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
	@PostMapping(value = "/alterar/alterar", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
				public void alterar(
						@RequestParam String id, 
						@RequestParam String nome, 
						@RequestParam String email,
						@RequestParam String endereco,
						HttpServletResponse response, 
						HttpServletRequest request, 
						HttpSession session) {
				session = request.getSession(true);
					try {
						Cliente c = new Cliente(new Long(id), nome, email, endereco);
						repository.save(c);
						session.setAttribute("msgInit", "Editar os Dados");
						response.sendRedirect("/");
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}

}
