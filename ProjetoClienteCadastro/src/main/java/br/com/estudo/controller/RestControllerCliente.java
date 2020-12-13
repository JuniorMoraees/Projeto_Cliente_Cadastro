package br.com.estudo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.estudo.entity.Cliente;
import br.com.estudo.repository.RepositoryCliente;

@RestController
@ResponseBody
@RequestMapping("cliente")
public class RestControllerCliente {
	
	@Autowired
	RepositoryCliente repository;
	
	@GetMapping(path = {"/id"})
	public ResponseEntity<?> buscar(@PathVariable long id) {
		return repository.findById(id).map(record ->
		ResponseEntity.ok().body(record)).orElse(ResponseEntity.badRequest().build());
	}
	
	@GetMapping
	public List<Cliente> findAll(){
		return repository.findAll();
	}

}
