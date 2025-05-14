select nroa, capacidade, 
	CASE
		WHEN capacidade <= 25 then 'Pequeno'
        WHEN capacidade > 25 and capacidade < 50 THEN 'Médio'
        WHEN capacidade >= 50 THEN 'Grande'
        ELSE 'Valor incorreto'
	END as tamanho
FROM clinica.ambulatorios;


SELECT id_evento,count(*) as qtd
FROM inscricoes
GROUP BY id_evento HAVING qtd >= 1;

-- 1.Crie uma consulta SQL que exiba o nome do participante, 
-- o nome do evento e uma coluna chamada status_descricao que deve exibir:
-- 'Pago' se o status_pagamento for 'pago'
-- 'Pendente' se o status_pagamento for 'pendente'
-- 'Cancelado' se o status_pagamento for 'cancelado'
-- 'Desconhecido' para quaisquer outros valores

select p.nome as nome_participante,
e.nome_evento,
CASE i.status_pagamento
	WHEN 'pago' THEN 'Pago'
    WHEN 'pendente' THEN 'Pendente'
    WHEN 'cancelado' THEN 'Cancelado'
    ELSE 'Desconhecido'
END AS status_descricao
FROM Inscricoes i
JOIN Participantes p ON i.id_participante = p.id
JOIN Eventos e ON i.id_evento = e.id;


-- 2.Escreva uma consulta que exiba o nome do evento, 
-- as datas de início e fim e uma nova coluna chamada 
-- classificacao_evento, com base na duração do evento:
-- 'Evento de 1 dia' se data_inicio for igual a data_fim
-- 'Evento de Curta Duração' se a diferença for de até 3 dias
-- 'Evento de Longa Duração' se for mais que 3 dias
-- Use DATEDIFF() junto com CASE.


SELECT nome_evento, data_fim, data_inicio,
CASE 
	WHEN data_inicio = data_fim THEN 'Evento por 1 dia'
    WHEN DATEDIFF(data_fim, data_inicio) <= 3 THEN 'Evento de Curta Duração'
    ELSE 'Evento de Longa Duração'
	END as classificacao_evento
FROM Eventos;

-- 3.Liste todos os participantes com uma coluna extra chamada tipo_participante, que deve conter:
-- 'Veterano' se a data de inscrição for anterior a 2024
-- 'Novo' se a inscrição for em 2024 ou posterior
-- Use YEAR() e CASE

SELECT 
	nome, email, data_inscricao,
    CASE
		WHEN YEAR (data_inscricao) < 2024 THEN 'Veterano'
        ELSE 'Novo'
	END as tipo_participante
FROM Participantes;

-- 4.Crie uma consulta que retorne o nome dos organizadores, seus cargos e uma nova coluna chamada funcao, com:
-- 'Gestor Principal' se o cargo for igual a 'Diretor'
-- 'Coordenação' se o cargo for 'Coordenador' ou 'Supervisor'
-- 'Apoio' para todos os outros cargos

SELECT nome, cargo,
	CASE cargo
		WHEN  'Diretor' THEN 'Gestor Principal'
        WHEN  'Supervisor' THEN 'Coordenação'
        WHEN 'Supervisor' THEN 'Coordenação'
	ELSE 'Apoio'
    END  as funcao
FROM Organizadores;

SELECT nome, cargo,
	CASE 
		WHEN  cargo ='Diretor' THEN 'Gestor Principal'
        WHEN  cargo IN ('Supervisor', 'Supervisor') THEN 'Coordenação'
	ELSE 'Apoio'
    END  as funcao
FROM Organizadores;

-- 5.Crie uma consulta que exiba o nome dos participantes e uma coluna chamada prioridade_contato, que deve mostrar:
-- 'WhatsApp' se o telefone estiver preenchido (telefone IS NOT NULL)
-- 'E-mail' se o telefone for NULL e o e-mail estiver preenchido
-- 'Sem contato disponível' se ambos forem NULL

SELECT nome,
	CASE
		WHEN (telefone IS NOT NULL) THEN 'WhatsApp'
        WHEN (telefone IS NOT NULL and email IS NOT NULL) THEN 'E-mail'
        WHEN (telefone IS NOT NULL and email IS NOT NULL) THEN 'Sem contato disponível'
	END as prioridade_contato
FROM Participantes;

/* 6.Liste todos os eventos com nome, tipo e uma nova coluna chamada classificacao_tipo, que mostre:
 'Competição' se o tipo de evento for 'Campeonato', 'Corrida' ou 'Torneio'
 'Formativo' se for 'Oficina', 'Curso' ou 'Palestra'
 'Outro' para qualquer outro tipo
 Use CASE com múltiplos valores por WHEN.*/

SELECT nome_evento, tipo_evento,
	CASE 
		WHEN tipo_evento IN ('Campeonato', 'Corrida', 'Torneio') THEN 'Competição'
        WHEN tipo_evento IN ('Oficina', 'Curso', 'Palestra') THEN 'Formativo'
        ELSE 'Outro tipo'
	END as classificacao_tipo
FROM Eventos as e;

/*Exercícios de Having

Liste os eventos que têm participantes com pagamento pendente
 e exiba apenas aqueles com mais de 1 pendência registrada.*/
SELECT e.nome_evento, COUNT(*) AS qtd_pendencias
FROM Eventos e
JOIN Inscricoes i ON e.id = i.id_evento
WHERE i.status_pagamento = 'Pendente'
GROUP BY e.nome_evento
HAVING COUNT(*) > 1;




-- Exiba os organizadores e a quantidade de eventos organizados por cada um,
-- mostrando apenas aqueles que organizaram mais de 1 evento.

-- Mostre os nomes dos participantes e a quantidade de eventos em que estão inscritos, 
-- limitando o resultado apenas aos que têm mais de uma inscrição.

-- Liste os eventos que têm mais da metade dos inscritos com pagamento pendente. 
-- Para cada evento, exiba a quantidade de pendências e o total de inscrições.





