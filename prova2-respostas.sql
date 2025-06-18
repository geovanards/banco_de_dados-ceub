-- 01.Para cada autor, exiba o total de livros cadastrados e
-- quantos estão disponíveis atualmente. 
-- Mostre apenas os autores com mais de 1 livro no sistema.
select
    a.nome as autor,
    count(l.id_livros) as total_de_livros,
    sum(case when l.disponibilidade = 'Disponível' then 1 else 0 end) as livros_disponiveis
from
    autores a
join
    livros l on a.id_autores = l.autores_id
group by
    a.nome
having
    count(l.id_livros) > 1;

-- 02. Liste o nome dos usuários e a quantidade de livros que cada um já pegou emprestado.
-- Mostre apenas os usuários que já realizaram pelo menos 2 empréstimos,
-- ordenando do que mais emprestou para o que menos emprestou.  

select 
	u.nome as "Usuário",
    count(e.id_emprestimos) as "qnt_emprestimos"
from usuarios u
join
	emprestimos e on u.id_usuarios = e.id_usuario
group by
	u.nome
having count(e.id_emprestimos) >= 2
order by "qnt_emprestimos" desc;



-- 03.Classifique os usuários como "Alta", "Média" ou "Baixa" atividade com base na quantidade de empréstimos:
-- 10 ou mais: Alta
-- Entre 5 e 9: Média
-- Abaixo de 5: Baixa

select u.nome as usuario,
	count(e.id_emprestimos) as total_emprestimos,
    case when count(e.id_emprestimos) >= 10 then 'alta'
		 when count(e.id_emprestimos) between 5 and 9 then 'Média'
    else 'baixa'
end as classf_atv
from usuarios u
	left join
    emprestimos e on u.id_usuarios = e.id_usuario
group by
    u.id_usuarios, u.nome
order by
    total_emprestimos desc;
    
    
    

-- 04.Mostre quantos usuários se cadastraram em cada mês.
select
    date_format(data_cadastro, '%Y-%m') as mes_cadastro,
    count(id_usuarios) AS quantidade_de_usuarios
from
    usuarios
group by
    mes_cadastro
order by
    mes_cadastro;



    
    
    
-- 05.Mostre os usuários que mais pegaram livros emprestados,
-- juntamente com o total de empréstimos por usuário, ordenados do maior para o menor.

select u.nome as usuario,
	count(e.id_emprestimos) as total_emprestimos
from usuarios u
join emprestimos e on id_usuarios= e.id_usuario
group by u.nome order by total_emprestimos desc;