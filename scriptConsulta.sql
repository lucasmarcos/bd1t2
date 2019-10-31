-- todos os contatos com o nome do consumidor e do atendete
SELECT consumidor.nome   AS "Consumidor",
       atendente.nome    AS "Atendente",
       contato.descricao AS "Descrição Geral do Contato",
       contato.status    AS "Status do Contato"
FROM consumidor, atendente, contato
WHERE contato.consumidor = consumidor.cpf
  AND contato.atendente = atendente.cracha
ORDER BY contato.inicio,
         consumidor.nome,
         atendente.nome;

-- todos os atendimentos 'Resolvidos' de 'Lucas Marcos'
SELECT consumidor.nome   AS "Consumidor",
       contato.descricao AS "Descrição Geral do Contato",
       contato.status    AS "Status do Contato"
FROM consumidor, contato
WHERE contato.consumidor = consumidor.cpf
  AND consumidor.nome    = 'Lucas Marcos'
  AND contato.status     = 'Resolvido'
ORDER BY contato.status,
         contato.inicio,
         consumidor.nome;

-- LEFT OUTER JOIN
-- RIGHT OUTER JOIN
-- FULL OUTER JOIN

-- UNION
-- INTERSECT
-- MINUS
