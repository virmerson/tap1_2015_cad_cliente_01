package br.ucdb;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet({ "/clicontroller", "/ClienteServlet", "/ClienteController", "/ClienteController.do" })
public class ClienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//Pegar a lista
		GerenciadorCliente gc = new GerenciadorCliente();
		List<Cliente> clientes = gc.getClientes();
		
		//Adiciona a lista no request como atributo
		
		req.setAttribute("cli", clientes);

		//Levar para o JSP
		RequestDispatcher view = req.getRequestDispatcher("clientes.jsp");
		view.forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome =  request.getParameter("nome");
		
		Cliente cliente = new Cliente();
		cliente.setNome(nome);
		
		GerenciadorCliente gc = new GerenciadorCliente();
		gc.salvar(cliente);
		
		
	}

}
