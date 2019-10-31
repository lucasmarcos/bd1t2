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
	inicio TIMESTAMP NOT NULL,
	termino TIMESTAMP NOT NULL,
	descricao VARCHAR(256),
	status INTEGER, -- um enum de todos os estados possivel com detalhes especificos em 'descricao'
	consumidor CHAR(11) NOT NULL,
	atendente INTEGER NOT NULL,
	CONSTRAINT fk_contato_consumidor FOREIGN KEY (consumidor) REFERENCES consumidor (cpf),
	CONSTRAINT fk_contato_atendente  FOREIGN KEY (atendente)  REFERENCES atendente (cracha)
);

COMMENT ON COLUMN contato.status
IS 'Status [1 Iniciado] [2 Em andamento] [3 Finalizado]';
