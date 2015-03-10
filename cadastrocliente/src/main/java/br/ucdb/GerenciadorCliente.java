package br.ucdb;

import java.util.ArrayList;
import java.util.List;

public class GerenciadorCliente {
	private static List<Cliente> clientes =  new ArrayList<Cliente>(); 
	public void salvar(Cliente cliente) {
		clientes.add(cliente);
	}
	
	public List<Cliente> getClientes() {
		return clientes;
	}

}
