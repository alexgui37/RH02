
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
			String novaSituacao = request.getParameter("novaSituacao");
			
			if(novaSituacao.equals("Apto")||novaSituacao.equals("Nomeado")){
				if(request.getParameter("data") != null){
					out.print(request.getParameter("data")+"<br>");
					out.print(request.getParameter("portaria")+"<br>");
				}
				else{ 
					if(request.getParameter("matricula") != null){
					out.print(request.getParameter("matricula")+"<br>");
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
	
			String cpf, nome, processo, unidade, perfil, espec, regiao, stAtual, stNova;
			
				
			cpf = request.getParameter("cpf");
			nome=request.getParameter("nome");
			processo=request.getParameter("processo");
			unidade=request.getParameter("unidade");
			perfil=request.getParameter("perfil");
			espec=request.getParameter("espec");
			regiao=request.getParameter("regiao");
			stAtual=request.getParameter("situacao");
			stNova=request.getParameter("novaSituacao");
			
			out.print(cpf + "<br>");
			out.print(nome + "<br>");
			out.print(processo + "<br>");
			out.print(unidade + "<br>");
			out.print(perfil + "<br>");
			out.print(espec + "<br>");
			out.print(regiao + "<br>");
			out.print(stAtual + "<br>");
			out.print(stNova + "<br>");
			
	%>
	
