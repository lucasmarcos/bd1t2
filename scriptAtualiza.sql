-- Paulo Henrique Moschen Sartori
-- Fabio Henrique Lorenzetti
-- Lucas da Silva Marcos
-- Anderson Pereira Brzezinski
-- Leonardo Dall Asta Kruger

-- atualiza o nome e endereco de um unico consumidor com um cpf especifico
UPDATE consumidor SET nome = 'Jean Smart', endereco = 'Pato Branco' WHERE cpf = '62691733025';

-- muda os detalhes de um contato especifico
UPDATE contato SET detalhes = 'Agora com mais informações, muito mais detalhes!' WHERE contato.protocolo = 1;

-- muda o setor de um unico atendente pelo num. de seu cracha
UPDATE atendente SET setor = 'Reparos' WHERE cracha = 1;

-- marca como 'Urgente' todas as medidas internas 'Atrasadas'
UPDATE medida_interna_tomada SET status = 'Urgente' WHERE status = 'Atrasada';

-- aumenta em uma semana o prazo de todas as repostas que tem apenas mais 2 dias para serem concluidas
UPDATE resposta SET prazo = (prazo + interval '1 week') WHERE prazo < (current_date + interval '2 days');

-- define o empregado de cracha 1 como resposavel de todos os setores sem resposaveis
UPDATE setor SET responsavel = 1 WHERE responsavel = NULL;
