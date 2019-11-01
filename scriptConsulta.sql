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

-- left join de alguma coisa sei lá
SELECT *
FROM consumidor
LEFT OUTER JOIN contato
             ON contato.consumidor = consumidor.cpf
ORDER BY consumidor.nome;

-- right join wtf
SELECT *
FROM contato
RIGHT OUTER JOIN atendente
              ON atendente.cracha = contato.atendente
ORDER BY atendente.nome;

-- sem sentido algum
SELECT *
FROM atendente
FULL OUTER JOIN contato
             ON contato.atendente = atendente.cracha;

-- UNION
-- INTERSECT
-- MINUS
