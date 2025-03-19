-- exercicios

-- 01) Buscar o nome e o CPF dos médicos com menos de 40 anos ou com especialidade diferente de traumatologia 
use clinica;
SELECT nome, cpf, especialidade
FROM medicos 
WHERE idade < 40 OR especialidade != 'traumatologia';



-- 02) Buscar todos os dados das consultas marcadas no período da tarde após o dia 19/06/2006
SELECT *
FROM consultas
WHERE data > '2006-06-19' AND hora > '12:00';

-- 03) Buscar o nome e a idade dos pacientes que não residem em Florianópolis
SELECT nome,idade
FROM pacientes
WHERE cidade NOT IN ('Florianopolis');
-- ou
SELECT nome, idade
FROM pacientes
WHERE cidade != 'Florianópolis';


-- 04) Buscar a hora das consultas marcadas antes do dia 14/06/2024 e depois do dia 20/12/2024
SELECT hora
FROM consultas
WHERE data between '2006-06-14' AND 2006-06-20;

-- 05) Buscar o nome e a idade (em meses) dos pacientes
SELECT nome, idade*12
FROM pacientes;

-- 06) Em quais cidades residem os funcionários?
SELECT DISTINCT cidade
FROM funcionarios;


-- 07) Qual o menor e o maior salário dos funcionários da Florianópolis?
SELECT MIN(salario)
FROM funcionarios
WHERE cidade = 'Florianopolis';



-- 10) Qual o horário da última consulta marcada para o dia 13/06/2024?
SELECT max(hora)
FROM consultas
WHERE data = '2006-06-13';

-- 11) Qual a média de idade dos médicos e o total de ambulatórios atendidos por eles?
SELECT ROUND(avg(idades),2),count(nroa)
FROM medicos;

-- 12) Buscar o código, o nome e o salário líquido dos funcionários. O salário líquido é obtido pela diferença entre o salário cadastrado menos 20% deste mesmo salário
SELECT codf, nome, salario - (salario * 0.20)
FROM funcionarios;


-- 13) Buscar o nome dos funcionários que terminam com a letra “a”
SELECT nome
FROM funcionarios
WHERE nome LIKE '%a';

-- 14) Buscar o nome e CPF dos funcionários que não possuam a seqüência “00000” em seus CPFs
SELECT nome, cpf
FROM funcionarios
WHERE cpf NOT LIKE '%00000%';

-- 15) Buscar o nome e a especialidade dos médicos cuja segunda e a última letra de seus nomes seja a letra “o”
SELECT nome, especialidade
FROM medicos
WHERE nome LIKE '_o%'  -- A segunda letra é "o"
AND nome LIKE '%o';  -- a ultima é "o"

-- 16) Buscar os códigos e nomes dos pacientes com mais de 25 anos que estão com tendinite, fratura, gripe e sarampo 
SELECT codp, nome
FROM pacientes
WHERE idade > 25
AND doenca IN ('tendinite','fratura','gripe','sarampo');