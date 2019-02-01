<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="br.uerj.rh.model.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="img/favicon.ico">
	<link rel="Stylesheet" type="text/css" href="pages/css/style.css">

	<title>Manutenção de Candidatos</title>

	<!-- Bootstrap core CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href="css/dashboard.css" rel="stylesheet">
</head>
<body>
	<%
  		Usuario user = (Usuario) session.getAttribute("usuario");
    	if(user == null){
    		String mensagem = (String) session.getAttribute("mensagem");
    		if(mensagem == null){
    			mensagem = "É NECESSÁRIO SE LOGAR PARA ACESSAR O SISTEMA.";
    			session.setAttribute("mensagem", mensagem);
    		}
    		response.sendRedirect("login.jsp");
    	}
  	%>
	<nav class="navbar navbar-light fixed-top bg-light flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Sistema RH UERJ</a>
		<img src="img/logo_uerj_cor.png" alt="" width="40" >
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap">
				<a class="nav-link" href="sair.jsp">Sair</a>
			</li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item">
							<a class="nav-link active" href="../index.jsp">
								<span data-feather="home"></span>
								Inicio <span class="sr-only"></span>
							</a>
						</li>
						<!--<li class="nav-item">
							<a class="nav-link" href="mconcusos.jsp">
								<span data-feather="layers"></span>
								Manutenção de Concursos
							</a>
						</li>  -->
						<li class="nav-item">
							<a class="nav-link" href="mfuncionario.jsp">
								<span data-feather="users"></span>
								Manutenção de Funcionários
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="ManutencaoCandidato.jsp">
								<span data-feather="users">(current)</span>
								Manutenção de Candidatos
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">
								<span data-feather="users"></span>
								Manutenção de Usuários
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">
								<span data-feather="bar-chart-2"></span>
								Relatórios
							</a>
						</li>
					</ul>
      </div>
  </nav>

  <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">

  	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
  		<h1 class="h2">Manutenção de Candidatos</h1>
		</div>

		<%
			String cpf="", nome="", processo="", unidade="", perfil="", espec="", regiao="", stAtual="";
			
			if(request.getParameter("cpf")!=null){
				cpf = request.getParameter("cpf");
				nome=request.getParameter("nome");
				processo=request.getParameter("processo");
				unidade=request.getParameter("unidade");
				perfil=request.getParameter("perfil");
				espec=request.getParameter("espec");
				regiao=request.getParameter("regiao");
				stAtual=request.getParameter("situacao");
			}
			
		%>
		<div class="table-responsive">				
				<form class="formlugar" id="ManutencaoCandidato" method="get" action="ManutCandProc.jsp">
					<div class="form-group">
						<div class="form-group col-md-6">
						
							<!-- Envia para o processamento, mas não aparecepara o usuário -->
							<input type="text" class="form-control" value="<%=cpf %>" 
							id="cpf" name="cpf" readonly style="display:none;">
							
							<table>
							
								<tr>
										<td>Nome:</td>
										<td><input type="text" class="form-control" value="<%=nome %>" 
										id="nome" name="nome" readonly size="60"></td>
								</tr>
								 <tr>
										<td>Processo:</td>
										<td><input type="text" class="form-control" value="<%=processo %>" 
										id="processo" name="processo" readonly></td>
								</tr>
								<!-- <tr>
										<td>Unidade:</td>
										<td><input type="text" class="form-control" value="<%=unidade %>" 
										id="unidade" name="unidade" readonly></td>
								</tr>-->
								<tr>
										<td>Perfil:</td>
										<td><input type="text" class="form-control" value="<%=perfil %>" 
										id="perfil" name="perfil" readonly></td>
								</tr>
								<tr>
										<td>Especialidade:   </td>
										<td><input type="text" class="form-control" value="<%=espec %>" 
										id="espec" name="espec" readonly></td>
								</tr>
								<tr>
										<td>Região:</td>
										<td><input type="text" class="form-control" value="<%=regiao %>" 
										id="regiao" name="regiao" readonly></td>
								</tr>
								<tr>
										<td>Situação Atual:</td>
										<td><input type="text" class="form-control" value="<%=stAtual %>" 
										id="situacao" name="situacao" readonly></td>
								</tr>
												
							</table><br>
					
							<%if(stAtual.equals("Nomeado")||stAtual.equals("Eliminado")||stAtual.equals("Exonerado")){
								out.print("Candidatos com situação EXONERADO ou ELIMINADO não podem ser alterados.<br>"+
										  "Candidatos NOMEADOS devem ser alterados na página MANUTENÇÃO DE FUNCIONÁRIOS.");
							}
							else 
								if(request.getParameter("novaSituacao") != null){
								String novaSituacao = request.getParameter("novaSituacao");
								if(novaSituacao.equals("Apto")){%>
									<label for="inputEmail4">Nova Situação</label>
									<input type="text" class="form-control" value="<%=novaSituacao %>" 
									id="novaSituacao" name="novaSituacao" readonly><br>
									<label for="inputEmail4">Matrícula</label>
									<input type="text" class="form-control" id="matricula" name="matricula" required 
									placeholder="Informe a matrícula do candidato"><br>
									<span>
										<input type="submit" class="btn btn-primary" id="enviar" name="enviar" 
										value="Enviar" style="margin:15;"/>
										<input type="button" class="btn btn-danger" value="Voltar" 
										onClick="history.go(-1)" style="margin:15;"/>
									</span>
							<%	}
								else if(novaSituacao.equals("Nomeado")){%>
									<label for="inputEmail4">Nova Situação</label>
									<input type="text" class="form-control" value="<%=novaSituacao %>" 
										id="novaSituacao" name="novaSituacao" readonly><br>
									<label for="inputEmail4">Portaria</label>
									<input type="text" class="form-control" id="portaria" name="portaria" required 
										placeholder="Informe o código da portaria de nomeação do candidato"><br>
									<label for="inputEmail4">Data da Portaria</label>
									<input class="form-control" type="date" id="data" name ="data" required value=""><br>
									<label for="inputEmail4">Unidade</label>
									<input type="text" class="form-control" id="unidade" name="unidade" required 
										placeholder="Informe a unidade do funcionário"><br>
									<label for="inputEmail4">Lotação</label>
									<input type="text" class="form-control" id="lotacao" name="lotacao" required 
										placeholder="Informe a lotação do funcionário"><br>
									<label for="inputEmail4">Localização</label>
									<input type="text" class="form-control" id="localiz" name="localiz" required 
										placeholder="Informe a localização do funcionário"><br>
									<span>
										<input type="submit" class="btn btn-primary" id="enviar" name="enviar" 
											value="Enviar" style="margin:15;"/>
										<input type="button" class="btn btn-danger" value="Voltar" 
											onClick="history.go(-1)" style="margin:15;"/>
									</span>
							<%	}
							}
							else{%>												
							<label for="inputEmail4">Nova Situação</label>
							<select class="form-control" id="novaSituacao" name="novaSituacao" required>
						      <option selected disabled>Selecione a nova situação do candidato...</option>
						      <%if(stAtual.equals("Candidato") || stAtual.equals("Fim de Fila")){ %>
						      	  <option>Fim de fila</option>
						      <%}
						      else if(stAtual.equals("Aguardando Convocação")){%>
						      	  <option>Convocado</option>
						      <%}
						      else if(stAtual.equals("Convocado")){%>
							      <option>Eliminado</option>
							      <option>Fim de Fila</option>
							      <option>Apto</option>
						      <%}
						      else if(stAtual.equals("Apto")){%>
							      <option>Eliminado</option>
							      <option>Nomeado</option>
						      <%} %>
						    </select>
						    <p><font color="red"><br><i>
							      <%
							      		String mensagem = (String) session.getAttribute("mensagem");
							      		if(mensagem != null){
							      			out.print(mensagem);
							      			session.setAttribute("mensagem", null);
							      		}
							      %>
						    </i></font></p>
							</div>
							<span>
								<input type="submit" class="btn btn-primary" id="enviar" name="enviar" 
								value="Enviar" style="margin:15;"/>
								<input type="button" class="btn btn-danger" value="Voltar" 
								onClick="history.go(-1)" style="margin:15;"/>
							</span>	
							<%} %>
					</div>		
				</form>
		</div>
	</main>
</div>
</div>

    <!-- Bootstrap core JavaScript
    	================================================== -->
    	<!-- Placed at the end of the document so the pages load faster -->
    	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    	<script src="../../assets/js/vendor/popper.min.js"></script>
    	<script src="../../dist/js/bootstrap.min.js"></script>

    	<!-- Icons -->
    	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    	<script>
    		feather.replace()
    	</script>

    	
</body>
</html>