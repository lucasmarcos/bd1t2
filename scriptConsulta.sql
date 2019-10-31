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
