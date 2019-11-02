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
