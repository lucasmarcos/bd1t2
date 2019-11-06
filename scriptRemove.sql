-- seis unicas
DELETE FROM consumidor WHERE cpf = '62691733025';
DELETE FROM atendente WHERE cracha = 1;

-- tres filtradas
DELETE FROM consumidor WHERE nascimento > current_date;
DELETE FROM atendente WHERE setor = NULL;
DELETE FROM contato_site WHERE envio < (currente_date - (interval '5 years'));
