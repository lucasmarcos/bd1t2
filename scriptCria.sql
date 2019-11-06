DROP TABLE IF EXISTS servico_contratado;
DROP TABLE IF EXISTS servico;
DROP TABLE IF EXISTS item_comprado;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS medida_interna_tomada;
DROP TABLE IF EXISTS medida_interna;
DROP TABLE IF EXISTS consulta_ao_faq;
DROP TABLE IF EXISTS faq;
DROP TABLE IF EXISTS resposta;
DROP TABLE IF EXISTS contato_site;
DROP TABLE IF EXISTS contato_sac;
DROP TABLE IF EXISTS contato;
DROP TABLE IF EXISTS chamado;
DROP TABLE IF EXISTS consumidor;
DROP TABLE IF EXISTS atendente;
DROP TABLE IF EXISTS empregado CASCADE;
DROP TABLE IF EXISTS setor;

CREATE TABLE consumidor (
	cpf CHAR(11),
	nome VARCHAR(64) NOT NULL,
	rg CHAR(9) NOT NULL UNIQUE,
	nascimento DATE,
	endereco VARCHAR(128),
	CONSTRAINT pk_consumidor PRIMARY KEY (cpf)
);

CREATE TABLE setor (
	nome VARCHAR(32),
	responsavel INTEGER,
	CONSTRAINT pk_setor PRIMARY KEY (nome)
);

CREATE TABLE atendente (
	cracha SERIAL,
	nome VARCHAR(64) NOT NULL,
	setor VARCHAR(32) NOT NULL,
	CONSTRAINT pk_atendente PRIMARY KEY (cracha),
	CONSTRAINT fk_atendente_setor FOREIGN KEY (setor) REFERENCES setor (nome)
);

CREATE TABLE empregado (
	cracha SERIAL,
	nome VARCHAR(64) NOT NULL,
	setor VARCHAR(32) NOT NULL,
	CONSTRAINT pk_empregado PRIMARY KEY (cracha),
	CONSTRAINT fk_empregado_setor FOREIGN KEY (setor) REFERENCES setor (nome)
);

ALTER TABLE setor ADD CONSTRAINT fk_responsavel FOREIGN KEY (responsavel) REFERENCES empregado (cracha);

CREATE TABLE chamado (
	protocolo SERIAL,
	status VARCHAR(32) NOT NULL,
	CONSTRAINT pk_chamado PRIMARY KEY (protocolo),
	CONSTRAINT check_status CHECK (status IN ('Resolvido', 'Em andamento', 'Iniciado'))
);

CREATE TABLE contato (
	protocolo SERIAL,
	consumidor CHAR(11) NOT NULL,
	chamado INTEGER NOT NULL,
	detalhes VARCHAR(256),
	CONSTRAINT pk_contato PRIMARY KEY (protocolo),
	CONSTRAINT fk_contato_consumidor FOREIGN KEY (consumidor) REFERENCES consumidor (cpf),
	CONSTRAINT fk_contato_chamado FOREIGN KEY (chamado) REFERENCES chamado (protocolo)
);

CREATE TABLE contato_sac (
	contato INTEGER NOT NULL,
	inicio TIMESTAMP NOT NULL,
	termino TIMESTAMP NOT NULL,
	atendente INTEGER NOT NULL,
	CONSTRAINT fk_sac FOREIGN KEY (contato) REFERENCES contato (protocolo),
	CONSTRAINT fk_sac_atendente FOREIGN KEY (atendente) REFERENCES atendente (cracha)
);

CREATE TABLE contato_site (
	contato INTEGER NOT NULL,
	envio TIMESTAMP NOT NULL,
	CONSTRAINT fk_site FOREIGN KEY (contato) REFERENCES contato (protocolo)
);

CREATE TABLE resposta (
	contato INTEGER NOT NULL,
	atendente INTEGER NOT NULL,
	prazo DATE NOT NULL,
	tipo VARCHAR(16) NOT NULL,
	detalhes VARCHAR(64),
	CONSTRAINT fk_sac_atendente FOREIGN KEY (atendente) REFERENCES atendente (cracha),
	CONSTRAINT fk_site FOREIGN KEY (contato) REFERENCES contato (protocolo)
);

CREATE TABLE medida_interna (
	nome VARCHAR(32),
	descricao VARCHAR(128),
	CONSTRAINT pk_medida_interna PRIMARY KEY (nome)
);

CREATE TABLE medida_interna_tomada (
	protocolo SERIAL,
	medida VARCHAR(32),
	chamado INTEGER NOT NULL,
	status VARCHAR(16) NOT NULL,
	observacoes VARCHAR(128),
	CONSTRAINT pk_medida_tomada PRIMARY KEY (protocolo),
	CONSTRAINT fk_chamado_medida FOREIGN KEY (chamado) REFERENCES chamado (protocolo),
	CONSTRAINT fk_medida_interna FOREIGN KEY (medida) REFERENCES medida_interna (nome)
);

CREATE TABLE item (
	codigo SERIAL,
	nome VARCHAR(64) NOT NULL UNIQUE,
	CONSTRAINT pk_item PRIMARY KEY (codigo)
);

CREATE TABLE item_comprado (
	item INTEGER NOT NULL,
	chamado INTEGER NOT NULL,
	CONSTRAINT fk_chamado_item FOREIGN KEY (chamado) REFERENCES chamado (protocolo),
	CONSTRAINT fk_item_comprado FOREIGN KEY (item) REFERENCES item (codigo)
);

CREATE TABLE servico (
	codigo SERIAL,
	nome VARCHAR(64) NOT NULL UNIQUE,
	CONSTRAINT pk_servico PRIMARY KEY (codigo)
);

CREATE TABLE servico_contratado (
	servico INTEGER NOT NULL,
	chamado INTEGER NOT NULL,
	CONSTRAINT fk_chamado_servico FOREIGN KEY (chamado) REFERENCES chamado (protocolo),
	CONSTRAINT fk_servico_contratado FOREIGN KEY (servico) REFERENCES servico (codigo)
);

CREATE TABLE faq (
	pergunta VARCHAR(64) NOT NULL,
	resposta VARCHAR(64) NOT NULL,
	CONSTRAINT pk_faq PRIMARY KEY (pergunta)
);

CREATE TABLE consulta_ao_faq (
	chamado INTEGER,
	pergunta VARCHAR(64),
	CONSTRAINT fk_chamado_servico FOREIGN KEY (chamado) REFERENCES chamado (protocolo),
	CONSTRAINT fk_faq FOREIGN KEY (pergunta) REFERENCES faq (pergunta)
);
