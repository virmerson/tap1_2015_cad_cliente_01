package br.ucdb;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/clicontroller", "/ClienteServlet", "/ClienteController",
		"/ClienteController.do" })
public class ClienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ClienteService clienteService = new ClienteService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String acao = req.getParameter("acao");
		System.out.println(acao);
		
		if (acao==null || acao==""){
			Cliente cliente = new Cliente();
			cliente.setFone("");
			cliente.setNome("");
			cliente.setId(0);
			req.setAttribute("cli", cliente);
			req.getRequestDispatcher("cliente.jsp").forward(req, resp);
		}else if (acao.equals("lis")) {
			// Pegar a lista

			List<Cliente> clientes = clienteService.buscarTodos();

			// Adiciona a lista no request como atributo

			req.setAttribute("cli", clientes);

			// Levar para o JSP
			RequestDispatcher view = req.getRequestDispatcher("clientes.jsp");
			view.forward(req, resp);
		} else if (acao.equals("exc")) {
			String id = req.getParameter("id");
			clienteService.excluir(Integer.parseInt(id));
			resp.getWriter()
					.print("<script> window.alert('Excluido Sucesso!'); location.href='ClienteController?acao=lis'; </script>");

		} else if (acao.equals("edit")) {
			String id = req.getParameter("id");
			Cliente clienteBuscado = clienteService.buscarPorId(Integer
					.parseInt(id));

			req.setAttribute("cli", clienteBuscado);
			req.getRequestDispatcher("cliente.jsp").forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		String nome = request.getParameter("nome");
		String fone = request.getParameter("fone");
		String id = request.getParameter("id");

		Cliente cliente = new Cliente();
		if (id != null && id != "" && id!="0") {
			cliente.setId(Integer.parseInt(id));
		}
		cliente.setNome(nome);
		cliente.setFone(fone);

		try {
			clienteService.salvar(cliente);

			response.getWriter()
					.print("<script> window.alert('Salvo Sucesso!'); location.href='ClienteController?acao=lis'; </script>");

		} catch (ServiceException e) {

			response.getWriter()
					.print("<script> window.alert('"
							+ e.getMessage()
							+ "'); location.href='ClienteController?acao=lis'; </script>");

			e.printStackTrace();
		}

	}

}
