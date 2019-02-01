<%@ page import="br.uerj.rh.model.*" %>
<%@ page import="br.uerj.rh.BDconfig.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>	
<%
		if(request.getParameter("novaSituacao")== null){
			session.setAttribute("mensagem", "É NECESSÁRIO SELECIONAR UMA NOVA SITUAÇÃO PARA PROSSEGUIR!");
			response.sendRedirect("ManutencaoCandidato.jsp?cpf="+request.getParameter("cpf")+
								  "&nome="+request.getParameter("nome")+
								  "&processo="+request.getParameter("processo")+
								  "&unidade="+request.getParameter("unidade")+
								  "&perfil="+request.getParameter("perfil")+
								  "&espec="+request.getParameter("espec")+
								  "&regiao="+request.getParameter("regiao")+
								  "&situacao="+request.getParameter("situacao"));
								
		}
		String cpf, nome, processo, perfil, espec, regiao, stAtual, stNova, matricula, 
		unidade, lotacao, localiz, portaria, data;
		int idConcurso, idVaga;
				
		cpf = request.getParameter("cpf");
		nome=request.getParameter("nome");
		processo=request.getParameter("processo");
		unidade=request.getParameter("unidade");
		perfil=request.getParameter("perfil");
		espec=request.getParameter("espec");
		stAtual=request.getParameter("situacao");
		stNova=request.getParameter("novaSituacao");
		portaria=request.getParameter("portaria");
		matricula=request.getParameter("matricula");
		data=request.getParameter("data");
		if(request.getParameter("idConcurso") != null){
			idConcurso=Integer.parseInt(request.getParameter("idConcurso"));
		}
		else{
			idConcurso=0;
		}
		
		
		
		
		if(stNova.equals("Apto")||stNova.equals("Nomeado")){
			if(data != null){
				out.print(data + "<br>");
				out.print(portaria + "<br>");
			}
			else{ 
				if(matricula != null){
				out.print(matricula + "<br>");
				}
				else{
					response.sendRedirect("ManutencaoCandidato.jsp?cpf="+request.getParameter("cpf")+
										  "&nome="+request.getParameter("nome")+
										  "&processo="+request.getParameter("processo")+
										  "&unidade="+request.getParameter("unidade")+
										  "&perfil="+request.getParameter("perfil")+
										  "&espec="+request.getParameter("espec")+
										  "&regiao="+request.getParameter("regiao")+
										  "&situacao="+request.getParameter("situacao")+
										  "&novaSituacao="+request.getParameter("novaSituacao"));
				}
			}
		}
	
		
		/*
		out.print(cpf + "<br>");
		out.print(nome + "<br>");
		out.print(processo + "<br>");
		out.print(unidade + "<br>");
		out.print(perfil + "<br>");
		out.print(espec + "<br>");
		out.print(regiao + "<br>");
		out.print(stAtual + "<br>");
		out.print(stNova + "<br>");
		*/
		if(stNova.equals("Fim de Fila")){
			if(DAO_mCand.processaFimFila(cpf)){
				session.setAttribute("mensagem", "Situação alterada com sucesso!");
				if(stAtual.equals("Candidato")){
					boolean hist = DAO_mCand.escreverHistoricoCand(idConcurso, cpf, 1, 5, "");
				}
				else if(stAtual.equals("Fim de Fila")){
					boolean hist = DAO_mCand.escreverHistoricoCand(idConcurso, cpf, 5, 5, "");
				}
				else{
					boolean hist = DAO_mCand.escreverHistoricoCand(idConcurso, cpf, 2, 5, "");
					
					if(true/*substituir o true pelo metodo de selecao de candidato*/){
						session.setAttribute("mensagem2", "Novo candidato selecionado para a vaga!");
						
					}
					else{
						session.setAttribute("mensagem2", "Falha ao tentar selecionar um candidato!");
					}
				}	
				
			}
			
		}
		else if(stNova.equals("Eliminado")){
			
		}
%>
	
