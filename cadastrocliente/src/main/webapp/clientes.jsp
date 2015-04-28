<%@page import="br.ucdb.Cliente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Clientes</title>
<script type="text/javascript">

function confirmaExclusao(id){
	confirmou = window.confirm("Tem Certeza que deseja Excluir?")
	if(confirmou==true){
		location.href="ClienteController?acao=exc&id="+id;
	}
}
</script>
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

	<%=c.getId()%> | <%=c.getNome()%>
	  <a href='javascript:confirmaExclusao(<%=c.getId()%>)'> excluir </a> | 
	  
	  <a href='ClienteController?acao=edit&id=<%=c.getId()%>'> editar </a>
	  
	   <br/>

	<%
		}
	%>



</body>
</html>