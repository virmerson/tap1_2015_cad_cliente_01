<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="ClienteController" method="POST">
		
		<h1> Cadastro de Cliente com JSTL</h1>
		<input type="hidden" name="id" value="${requestScope.cli.id}">
		
		
		<label>
		Nome:
		</label>
		<input type="text" name="nome" value="${requestScope.cli.nome}">
		
		<label>
		Fone:
		</label>
		<input type="text" name="fone" value="${requestScope.cli.fone}">
		
		<input type="submit" value="Salvar">
</form>
</body>
</html>