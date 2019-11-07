-- Paulo Henrique Moschen Sartori
-- Fabio Henrique Lorenzetti
-- Lucas da Silva Marcos
-- Anderson Pereira Brzezinski
-- Leonardo Dall Asta Kruger

-- remove um unico consumidor
DELETE FROM consumidor WHERE cpf = '62691733025';

-- remove um atendente
DELETE FROM contato_sac WHERE atendente = 1;
DELETE FROM resposta WHERE atendente = 1;
DELETE FROM atendente WHERE cracha = 1;

-- remove uma pergunta do faq e suas consultas salvas
DELETE FROM consulta_ao_faq WHERE pergunta = 'Como desliga?';
DELETE FROM faq WHERE pergunta = 'Como desliga?';

-- remove um servico contratado de um chamado
DELETE FROM servico_contratado WHERE servico = 1 AND chamado = 1;

-- remove um setor e todos seus empregados
DELETE FROM empregado WHERE setor = 'Reparos';
DELETE FROM setor WHERE nome = 'Reparos';

-- remove todos os setores sem responsaveis
DELETE FROM setor WHERE responsavel = NULL;

-- todos os consumidores com datas de nascimento invalidas (depois do dia de hoje)
DELETE FROM consumidor WHERE nascimento > current_date;

-- todos os contatos no site mais velhos que 5 anos
DELETE FROM contato_site WHERE envio < (current_date - (interval '5 years'));
