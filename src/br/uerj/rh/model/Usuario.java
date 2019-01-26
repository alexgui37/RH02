package br.uerj.rh.model;

public class Usuario {
	private String usuario, senha, nome;
	private int permissao;
	
	public Usuario(String usuario, String senha, String nome, int permissao) {
		super();
		this.usuario = usuario;
		this.senha = senha;
		this.nome = nome;
		this.permissao = permissao;
	}
	public Usuario(String usuario, String senha, int permissao) {
		super();
		this.usuario = usuario;
		this.senha = senha;
		this.permissao = permissao;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public int getPermissao() {
		return permissao;
	}
	public void setPermissao(int permissao) {
		this.permissao = permissao;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	

}
