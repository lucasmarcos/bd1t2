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
	('Hospício'),
	('Roteiro'),
	('Lavanderia'),
	('Plásticos');

INSERT INTO atendente (nome, setor) VALUES
	('Felipe Marcos',   (SELECT codigo FROM setor WHERE nome = 'Reparos')),
	('Kanye West',      (SELECT codigo FROM setor WHERE nome = 'Hospício')),
	('Kristen Bell',    (SELECT codigo FROM setor WHERE nome = 'Roteiro')),
	('Martin Scorsese', (SELECT codigo FROM setor WHERE nome = 'Lavanderia')),
	('Laura Palmer',    (SELECT codigo FROM setor WHERE nome = 'Plásticos'));

INSERT INTO empregado (nome, setor) VALUES
	('David Lynch',         (SELECT codigo FROM setor WHERE nome = 'Reparos')),
	('Kleber Mendonça',     (SELECT codigo FROM setor WHERE nome = 'Hospício')),
	('Fernanda Montenegro', (SELECT codigo FROM setor WHERE nome = 'Roteiro')),
	('Péricles',            (SELECT codigo FROM setor WHERE nome = 'Lavanderia')),
	('Kathryn Bigelow',     (SELECT codigo FROM setor WHERE nome = 'Plásticos'));

INSERT INTO item (nome) VALUES
	('GamerGirl Bath Water'),
	('COMBO: The Outer Worlds + Outer Wilds'),
	('RED Weapon');

INSERT INTO servico (nome) VALUES
	('Controle da Danos'),
	('Descoberta de Vigilantes Mascarados'),
	('Modelagem 3D');

INSERT INTO faq (pergunta, resposta) VALUES
	('Como desliga?', 'Aperta o botão.'),
	('Esses cachorros são seus?', 'São de rua.'),
	('Posso entregar no outro dia?', 'Não.');

INSERT INTO medida_interna (nome, descricao) VALUES
	('8m x 54cm', ''),
	('1cm x 1cm', 'cm'),
	('74 pés', ''),
	('76m^3', ''),
	('8 km/h', 'por hora?');

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
	('8 km/h', 1, 'Concluído', '');

INSERT INTO item_comprado (item, chamado) VALUES
	(1, 1);

INSERT INTO servico_contratado (servico, chamado) VALUES
	(1, 1),
	(2, 1),
	(3, 1);

INSERT INTO consulta_ao_faq (chamado, pergunta) VALUES
	(1, 'Como desliga?');
