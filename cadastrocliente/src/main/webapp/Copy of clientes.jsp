<%@page import="br.ucdb.Cliente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Clientes</title>

</head>
<body>

	<h1>Lista de Clientes</h1>
	<%
		//Scriptlet
		List<Cliente> clientes = (List<Cliente>) request
				.getAttribute("cli");

		for (int i = 0; i < clientes.size(); i++) {
			Cliente c = clientes.get(i);
	%>

	<%=c.getNome()%>
	  <a href='ClienteController?acao=exc&pos=<%=i%>'> excluir </a> 

	<%
		}
	%>



</body>
</html>