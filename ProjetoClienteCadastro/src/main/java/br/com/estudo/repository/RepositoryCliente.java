package br.com.estudo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.estudo.entity.Cliente;

public interface RepositoryCliente extends JpaRepository<Cliente, Long>{

}
