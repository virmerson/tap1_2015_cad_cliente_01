<!DOCTYPE html>
<%@page import="br.ucdb.Cliente"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Cliente cliente = (Cliente)request.getAttribute("cli");
%>
<form action="ClienteController" method="POST">
		
		
		<input type="hidden" name="id" value="<%=cliente.getId()%>">
		
		
		<label>
		Nome:
		</label>
		<input type="text" name="nome" value="<%=cliente.getNome()%>">
		
		<label>
		Fone:
		</label>
		<input type="text" name="fone" value="<%=cliente.getFone()%>">
		
		<input type="submit" value="Salvar">
</form>
</body>
</html>