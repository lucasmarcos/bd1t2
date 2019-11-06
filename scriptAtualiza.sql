--
UPDATE consumidor SET nome = 'Jean Smart', endereco = 'Pato Branco' WHERE cpf = '62691733025';

--
UPDATE contato SET detalhes = 'Agora com mais informações, muito mais detalhes!' WHERE contato.protocolo = 1; -- unico

--
UPDATE atendente SET setor = 'Reparos' WHERE cracha = 1; -- unico

--
UPDATE medida_interna_tomada SET status = 'Urgente' WHERE status = 'Atrasada'; -- filtro

--
UPDATE resposta SET prazo = (prazo + interval '1 week') WHERE prazo > (current_date - interval '2 days'); -- filtro

--
UPDATE setor SET responsavel = 1 WHERE responsavel = NULL; -- filtro
