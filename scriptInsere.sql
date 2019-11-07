-- Paulo Henrique Moschen Sartori
-- Fabio Henrique Lorenzetti
-- Lucas da Silva Marcos
-- Anderson Pereira Brzezinski
-- Leonardo Dall Asta Kruger

INSERT INTO consumidor (cpf, nome, rg, nascimento, endereco) VALUES
	('12345678910', 'Lucas Marcos',      '987654321', '1994-11-26', 'New Vegas'),
	('62691733025', 'Solidus Snake',     '987654322', '2080-01-01', 'Nova Iorque'),
	('43720607003', 'Paul Schrader',     '987654323', '1990-12-25', 'Verê'),
	('22190772095', 'Bill Hader',        '987654324', '1450-04-02', 'Belo Horizonte'),
	('85317105021', 'Michael Myers',     '987654325', '1989-12-13', 'Dois Vizinhos'),
	('80599496088', 'Jessica Chastain',  '987654326', '1999-09-30', 'São Franscisco'),
	('44724358025', 'Regina King',       '987654327', '2001-06-12', 'Los Angeles'),
	('01980411018', 'Caroline Polachek', '987654328', '2012-12-12', 'Anor Londo');

INSERT INTO setor (nome) VALUES
	('Reparos'),
	('Remédios'),
	('Roteiro'),
	('Reclamações'),
	('Lavanderia'),
	('Plásticos');

INSERT INTO atendente (nome, setor) VALUES
	('Felipe Marcos',   'Reparos'),
	('Kanye West',      'Remédios'),
	('Kristen Bell',    'Roteiro'),
	('Martin Scorsese', 'Reclamações'),
	('Laura Palmer',    'Plásticos');

INSERT INTO empregado (nome, setor) VALUES
	('David Lynch',         'Reparos'),
	('Kleber Mendonça',     'Roteiro'),
	('Fernanda Montenegro', 'Roteiro'),
	('Péricles',            'Reclamações'),
	('Kathryn Bigelow',     'Plásticos');

INSERT INTO item (nome) VALUES
	('GamerGirl Bath Water'),
	('COMBO: The Outer Worlds + Outer Wilds'),
	('FKA Twigs - MAGDALENE (Vinil)'),
	('RED RANGER, incluso GEMINI 5K S35');

INSERT INTO servico (nome) VALUES
	('Controle da Danos'),
	('Descoberta de Vigilantes Mascarados'),
	('Limpeza de Vômito nas Paredes'),
	('Modelagem 3D');

INSERT INTO faq (pergunta, resposta) VALUES
	('Como desliga?', 'Aperta o botão.'),
	('Esses cachorros são seus?', 'São de rua.'),
	('Posso entregar no outro dia?', 'Não.');

INSERT INTO medida_interna (nome, descricao) VALUES
	('Telefonema rápido', ''),
	('Burocraticamente enviar e-mails ao superiores', ''),
	('Burocraticamente buscar informações com o setor especializado', ''),
	('Burocraticamente esperar o prazo expirar', '');

--
INSERT INTO chamado (status) VALUES ('Resolvido');

INSERT INTO contato (consumidor, chamado, detalhes) VALUES
	('12345678910', 1, 'nada aconteceu eu acho, esqueci. nada a reportar.'),
	('12345678910', 1, 'olá o atendente que me respondeu foi bem grosso nossa horrível essa empressa vim por esse e-mail apenas espalhar o ódio.'),
	('12345678910', 1, 'por favor nos deixe em paz!!!');

INSERT INTO contato_sac (contato, inicio, termino, atendente) VALUES
	(1, '2019-11-05 01:29', '2019-11-05 01:30', 1);

INSERT INTO contato_site (contato, envio) VALUES
	(2, '2019-11-05 01:31');

INSERT INTO resposta (contato, atendente, prazo, tipo) VALUES
	(3, 1, '2099-11-05', 'E-Mail');
--
INSERT INTO chamado (status) VALUES ('Em andamento');
--
INSERT INTO chamado (status) VALUES ('Iniciado');
--

INSERT INTO medida_interna_tomada (medida, chamado, status, observacoes) VALUES
	('Telefonema rápido', 1, 'Concluído', '');

INSERT INTO item_comprado (item, chamado) VALUES
	(1, 1);

INSERT INTO servico_contratado (servico, chamado) VALUES
	(1, 1),
	(2, 1),
	(3, 1);

INSERT INTO consulta_ao_faq (chamado, pergunta) VALUES
	(1, 'Como desliga?');
