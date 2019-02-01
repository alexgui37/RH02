package br.uerj.rh.BDconfig;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import br.uerj.rh.model.*;
import br.uerj.rh.BDconfig.ConexaoBD;

public class DAO_mCand {
	
	public static synchronized boolean processaFimFila(String idCand){
		try{
			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement(
					"SET @conta = ( SELECT COUNT( id_situacao ) \r\n" +
					"FROM concurso_candidato\r\n" + 
					"WHERE id_situacao =5 );\r\n" + //Captura a ultima posição de fim de fila
					"\r\n" + 
					"UPDATE concurso_candidato SET id_situacao= 5, nu_candidato_posicao_fim= (@conta + 1) , id_VAGA= null\r\n" + 
					"WHERE cd_chave_candidato= ?;");
			ps.setString(1, idCand);
			ps.executeUpdate();
			ps.close();
			c.close();
			a.fechaBd();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	public static synchronized boolean escreverHistoricoCand(int idConcurso, String idCand, int stAntiga, int stNova, String doc){
		try{
			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement(
					"INSERT INTO concurso_candidato_historico(id_concurso_especialidade, cd_chave_candidato,\r\n" + 
					"id_situacao_antiga,id_situacao_nova, dt_mudanca_situacao, ds_documento_autorizacao)\r\n" + 
					"VALUES ( ?, ?, ?, ?, NOW(), ?)");
			ps.setInt(1, idConcurso);
			ps.setString(2, idCand);
			ps.setInt(3, stAntiga);
			ps.setInt(4, stNova);
			ps.setString(5, doc);
			ps.executeUpdate();
			ps.close();
			c.close();
			a.fechaBd();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	public static synchronized boolean escreverHistoricoVaga(int idVaga, String idCand, int situacao){
		try{
			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement(
					"INSERT INTO concurso_vaga_historico(id_vaga, dt_atualizacao, cd_chave_candidato, id_situacao)\r\n" + 
					"VALUES ( ?, NOW(), ?, ?)");
			ps.setInt(1, idVaga);
			ps.setString(2, idCand);
			ps.setInt(3, situacao);
			ps.executeUpdate();
			ps.close();
			c.close();
			a.fechaBd();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}	
	}
}
