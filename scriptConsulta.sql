-- selecinamos o nome do atendente e o status de todos os contatos de 'Lucas Marcos'
SELECT consumidor.nome  AS "Consumidor",
       atendente.nome   AS "Atendente",
       contato.detalhes AS "Detalhes do contato"
FROM atendente, consumidor, contato, contato_sac
WHERE contato_sac.atendente = atendente.cracha
  AND contato.protocolo = contato_sac.contato
  AND contato.consumidor = consumidor.cpf
  AND consumidor.nome = 'Lucas Marcos';

-- o protocolo e detalhes de todos os contatos de chamados 'Em andamento'
SELECT contato.protocolo AS "Protocolo do contato",
       contato.detalhes  AS "Detalhes"
FROM chamado, contato
WHERE contato.chamado = chamado.protocolo
  AND chamado.status = 'Em andamento';

-- todos os chamados, incluindo opcionalmente os items que ele menciona
SELECT chamado.protocolo  AS "Chamado",
       item_comprado.item AS "Código do Item"
FROM chamado
LEFT OUTER JOIN item_comprado
ON chamado.protocolo = item_comprado.chamado;

-- todos os servicos e o estado dos chamados que referenciam eles, se houver
SELECT chamado.status AS "Estado do Chamado",
       servico.nome   AS "Serviço"
FROM chamado
RIGHT OUTER JOIN servico_contratado
ON chamado.protocolo = servico_contratado.chamado
RIGHT OUTER JOIN servico
ON servico_contratado.servico = servico.codigo;

-- tods os consumidores e atendentes, alem de detalhes do contato entre eles (se ocorreu)
SELECT consumidor.nome  AS "Consumidor",
       atendente.nome   AS "Atendente",
       contato.detalhes AS "Detalhes do Contato"
FROM consumidor
FULL OUTER JOIN contato
ON contato.consumidor = consumidor.cpf
FULL OUTER JOIN contato_sac
ON contato_sac.contato = contato.protocolo
FULL OUTER JOIN atendente
ON atendente.cracha = contato_sac.atendente;

-- o nome de todos os atendentes e o nome de todos os reponsaveis por algum setor
(SELECT atendente.nome AS "Atendentes e Responsáveis"
FROM atendente)
UNION
(SELECT empregado.nome
FROM empregado, setor
WHERE setor.responsavel = empregado.cracha);

-- consumidores que abriram chamados tanto para items quanto para serviços
(SELECT consumidor.cpf AS "CPF",
        consumidor.nome AS "Consumidor"
FROM consumidor, contato, chamado, item_comprado
WHERE consumidor.cpf = contato.consumidor
  AND contato.chamado = chamado.protocolo
  AND chamado.protocolo = item_comprado.chamado)
INTERSECT
(SELECT consumidor.cpf,
        consumidor.nome
FROM consumidor, contato, chamado, servico_contratado
WHERE consumidor.cpf = contato.consumidor
  AND contato.chamado = chamado.protocolo
  AND chamado.protocolo = servico_contratado.chamado);

-- consumidores que não entraram em contato por e-mail
(SELECT consumidor.cpf  AS "CPF",
        consumidor.nome AS "Consumidor"
FROM consumidor, contato
WHERE consumidor.cpf = contato.consumidor)
EXCEPT
(SELECT consumidor.cpf, consumidor.nome
FROM consumidor, contato, contato_site
WHERE consumidor.cpf = contato.consumidor
  AND contato.protocolo = contato_site.contato);

-- todos os atendente que respoderam chamados sobre todos os item cadastrados
SELECT atendente.cracha AS "Crachá",
       atendente.nome   AS "Nome"
FROM atendente
WHERE NOT EXISTS
((SELECT codigo FROM item)
 EXCEPT
(SELECT item_comprado.item
FROM contato, contato_sac, chamado, item_comprado
WHERE contato.protocolo = contato_sac.contato
  AND atendente.cracha = contato_sac.atendente
  AND contato.chamado = chamado.protocolo
  AND chamado.protocolo = item_comprado.chamado));

-- !!!
-- precisamos fazer: L I V R E (refletindo a que fizermos em algebra relacional)
-- !!!

-- numero de atendimetos que cada atendente fez
SELECT atendente.nome   AS "Atendente",
       COUNT(*)         AS "Número de Atendimentos"
FROM atendente, contato, contato_sac
WHERE contato.protocolo = contato_sac.contato
  AND contato_sac.atendente = atendente.cracha
GROUP BY atendente.cracha;

-- atendimentos em cada mes
SELECT EXTRACT(MONTH FROM contato_sac.inicio) AS "Mês",
       COUNT(*)                               AS "Atendimentos"
FROM contato_sac, contato
WHERE contato_sac.contato = contato.protocolo
GROUP BY EXTRACT(MONTH FROM contato_sac.inicio);

-- quantas reclamacoes cada item teve
SELECT item.nome AS "Item",
       COUNT(*)  AS "Reclamações"
FROM item, chamado, item_comprado
WHERE item.codigo = item_comprado.item
  AND chamado.protocolo = item_comprado.chamado
GROUP BY item.codigo;

-- consumidores que fizeram mais de 10 contatos
SELECT consumidor.nome AS "Consumidor",
       COUNT(*)        AS "Contatos Feitos"
FROM consumidor, contato
WHERE consumidor.cpf = contato.consumidor
GROUP BY consumidor.nome
HAVING COUNT(*) > 10;

-- numero de atendimetos por setor
SELECT setor.nome AS "Setor",
       COUNT(*)   AS "Atendimentos"
FROM atendente, setor
WHERE atendente.setor = setor.nome
GROUP BY setor.nome
HAVING COUNT(*) > 10;

--
-- precisamos fazer: L I V R E (usando um comando novo do psql)
--
