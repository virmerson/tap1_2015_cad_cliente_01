
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Clientes</title>
<script type="text/javascript">
	function confirmaExclusao(id) {
		confirmou = window.confirm("Tem Certeza que deseja Excluir?")
		if (confirmou == true) {
			location.href = "ClienteController?acao=exc&id=" + id;
		}
	}
</script>
</head>
<body>

	<h1>Lista de Clientes JSTL</h1>



	<c:forEach items="${requestScope.cli}" var="c"> 

	${c.id} | ${c.nome} 
	  <a href='javascript:confirmaExclusao(${c.id})'> excluir </a> | 
	  
	  <a href='ClienteController?acao=edit&id=${c.id}'> editar </a>

	   <br />

	</c:forEach>



</body>
</html>