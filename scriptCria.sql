DROP TABLE IF EXISTS contato;
DROP TABLE IF EXISTS consumidor;
DROP TABLE IF EXISTS atendente;

CREATE TABLE consumidor (
	cpf CHAR(11),
	nome VARCHAR(64) NOT NULL,
	rg CHAR(9) NOT NULL,
	nascimento DATE,
	endereco VARCHAR(128),
	CONSTRAINT pk_consumidor PRIMARY KEY (cpf)
);

CREATE TABLE atendente (
	cracha SERIAL,
	nome VARCHAR(64) NOT NULL,
	setor VARCHAR(64) NOT NULL, -- sendo um chave estrangeira no modelo original
	CONSTRAINT pk_atendente PRIMARY KEY (cracha)
);

CREATE TABLE contato (
	protocolo SERIAL,
	data DATE,
	inicio TIME,
	termino TIME,
	descricao VARCHAR(256),
	status VARCHAR(32),
	consumidor CHAR(11),
	atendente INTEGER,
	CONSTRAINT fk_contato_consumidor FOREIGN KEY (consumidor) REFERENCES consumidor (cpf),
	CONSTRAINT fk_contato_atendente  FOREIGN KEY (atendente)  REFERENCES atendente (cracha)
);
