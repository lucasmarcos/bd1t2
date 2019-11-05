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

-- todos os chamados, e quando tem item eles tambem
SELECT chamado.protocolo  AS "Chamado",
       item_comprado.item AS "Código do Item"
FROM chamado
LEFT OUTER JOIN item_comprado
ON chamado.protocolo = item_comprado.chamado;

-- todos os servicos e se tiver chamados com eles vem também
-- TÁ ERRADO
SELECT chamado.protocolo          AS "Chamado",
       servico_contratado.servico AS "Código do Serviço"
FROM chamado
RIGHT OUTER JOIN servico_contratado
ON chamado.protocolo = servico_contratado.chamado;

-- FULL OUTER JOIN
-- ?

-- union
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

-- L I V R E algebra

SELECT atendente.nome   AS "Atendente",
       atendente.cracha AS "Crachá",
       COUNT(*)         AS "Número de Atendimentos"
FROM atendente, contato, contato_sac
WHERE contato.protocolo = contato_sac.contato
  AND contato_sac.atendente = atendente.cracha
GROUP BY atendente.cracha;

SELECT EXTRACT(MONTH FROM contato_sac.inicio) AS "Mês",
       COUNT(*)                               AS "Atendimentos"
FROM contato_sac, contato
WHERE contato_sac.contato = contato.protocolo
GROUP BY EXTRACT(MONTH FROM contato_sac.inicio);

SELECT item.nome AS "Item",
       COUNT(*)  AS "Reclamações"
FROM item, chamado, item_comprado
WHERE item.codigo = item_comprado.item
  AND chamado.protocolo = item_comprado.chamado
GROUP BY item.codigo

-- 2 GROUP BY + HAVING

-- L I V R E  comando novo sql
