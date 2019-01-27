package br.uerj.rh.model;

public class Vaga {
	private int num_vaga;
	private int id_concurso;
	private String status_vaga;
	private String num_processo_conc;
	private Especialidade vaga_espec;
	private Historico_Vaga hist;
	private String perfil;
	private String especialidade;
	private String regiao;
	private String unidade;
	private String localizacao;
	private String lotacao;
	
	
	public Vaga(int num_vaga, int id_concurso, String status_vaga, String num_processo_conc, String perfil,
			String especialidade, String regiao, String unidade, String localizacao, String lotacao) {
		super();
		this.num_vaga = num_vaga;
		this.id_concurso = id_concurso;
		this.status_vaga = status_vaga;
		this.num_processo_conc = num_processo_conc;
		this.perfil = perfil;
		this.especialidade = especialidade;
		this.regiao = regiao;
		this.unidade = unidade;
		this.localizacao = localizacao;
		this.lotacao = lotacao;
	}
	public Vaga(int id_concurso, int num_vaga, String status_vaga, String num_processo_conc, String especialidade) {
		super();
		this.num_vaga = num_vaga;
		this.id_concurso = id_concurso;
		this.status_vaga = status_vaga;
		this.num_processo_conc = num_processo_conc;
		this.especialidade = especialidade;
	}
	public int getId_concurso() {
		return id_concurso;
	}
	public String getEspecialidade() {
		return especialidade;
	}
	public String getStatus() {
		return this.status_vaga;
	}
	public Historico_Vaga getHist() {
		return this.hist;
	}
	public void setStatus(String status) {
		this.status_vaga = status;
	}
	public String getProcesso(){
		return this.num_processo_conc;
	}
	public void setProcesso(String num_proc) {
		this.num_processo_conc = num_proc;
	}
	public Especialidade getVaga_espec() {
		return vaga_espec;
	}

	public void setVaga_espec(Especialidade vaga_espec) {
		this.vaga_espec = vaga_espec;
	}
	public void setHistorico(Historico_Vaga hist) {
		this.hist = hist;
	}
	public int getNum_vaga() {
		return num_vaga;
	}
	public void setNum_vaga(int num_vaga) {
		this.num_vaga = num_vaga;
	}
	public String getRegiao() {
		return regiao;
	}
	public void setRegiao(String regiao) {
		this.regiao = regiao;
	}
	public String getUnidade() {
		return unidade;
	}
	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}
	public String getLotacao() {
		return lotacao;
	}
	public void setLotacao(String lotacao) {
		this.lotacao = lotacao;
	}
	public String getPerfil() {
		return perfil;
	}
	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}
	public String getLocalizacao() {
		return localizacao;
	}
	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}
	
	
}