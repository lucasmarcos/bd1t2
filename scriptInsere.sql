-- DELETE FROM contato;
-- DELETE FROM atendente;
-- DELETE FROM consumidor;

INSERT INTO consumidor (cpf, nome, rg, nascimento, endereco) VALUES
	('12345678910', 'Lucas Marcos',      '987654321', '1994-11-26', 'Rua Goiás, 92'),
	('62691733025', 'Solidus Snake',     '987654322', '2080-01-01', 'Nova Iorque'),
	('43720607003', 'Paul Schrader',     '987654323', '1990-12-25', 'Verê'),
	('22190772095', 'Bill Hader',        '987654324', '1450-04-02', 'Belo Horizonte'),
	('85317105021', 'Michael Myers',     '987654325', '1989-12-13', 'Dois Vizinhos'),
	('80599496088', 'Jessica Chastain',  '987654326', '1999-09-30', 'São Franscisco'),
	('44724358025', 'Regina King',       '987654327', '2001-06-12', 'Los Angeles'),
	('01980411018', 'Caroline Polachek', '987654328', '2012-12-12', 'Anor Londo');

INSERT INTO setor (nome, responsavel) VALUES
	('Reparos',    0),
	('Hospício',   0),
	('Roteiro',    0),
	('Lavanderia', 0),
	('Plásticos',  0);

INSERT INTO atendente (nome, setor) VALUES
	('Felipe Marcos',   1),
	('Kanye West',      1),
	('Kristen Bell',    1),
	('Martin Scorsese', 1),
	('Laura Palmer',    1);

INSERT INTO item (nome) VALUES
	('GamerGirl Bath Water');

INSERT INTO servico (nome) VALUES
	('Controle da Danos');

INSERT INTO faq (pergunta, resposta) VALUES
	('Como desliga?', 'Aperta o botão.');

INSERT INTO medida_interna (nome, descricao) VALUES
	('8m x 54cm', '');

-- INSERT INTO contato (inicio, termino, descricao, status, consumidor, atendente) VALUES
--	('2019-10-31 22:00:00', '2019-10-31 23:00:00', 'gente minha geladeira tá falando sozinha', 'Resolvido',
--		(SELECT cpf    FROM consumidor WHERE nome = 'Lucas Marcos'  LIMIT 1),
--		(SELECT cracha FROM atendente  WHERE nome = 'Felipe Marcos' LIMIT 1)),
--
--	('2001-02-01 05:37:08', '2099-09-11 16:22:31', 'bem legal o produto', 'Iniciado',
--		(SELECT cpf    FROM consumidor WHERE nome = 'Solidus Snake' LIMIT 1),
--		(SELECT cracha FROM atendente  WHERE nome = 'Laura Palmer'  LIMIT 1)),
--
--	('2019-10-31 22:00:00', '2019-10-31 23:00:00', 'poderia fazer café também sugiro', 'Em andamento',
--		(SELECT cpf    FROM consumidor WHERE nome = 'Bill Hader'      LIMIT 1),
--		(SELECT cracha FROM atendente  WHERE nome = 'Martin Scorsese' LIMIT 1));
