-- inner join
SELECT *
FROM directors as d
	INNER JOIN movies as m
		ON d.id = m.director_id;
        
-- seleciona todas as linhas das duas tabelas, 
-- desde que haja correspondência entre as colunas.
-- Se houver algum registro em uma das tabelas que não
-- tenha correspondência na outra tabela, esses registros não serão exibidos.


-- left join
SELECT *
FROM movies as m
	LEFT JOIN directors as d
			ON m.director_id = d.id;

-- right join
-- Nesta operação, todas as linhas da tabela direita são retornadas, 
-- juntamente com as linhas da tabela esquerda que correspondem às da tabela direita.

SELECT *
FROM movies as m
	RIGHT JOIN directors as d
			ON m.director_id = d.id;



-- 01 Liste todos os diretores e os filmes que eles dirigiram 
SELECT * from directors as d
	JOIN movies as m on d.id = m.director_id;
	
    
-- 02 Liste todos os filmes e seus tickets vendidos
SELECT * FROM movies as m
	JOIN tickets as t ON m.id = t.movie_id;
    
    
    
-- 03.Liste todos os filmes, seus diretores e os tickets vendidos 
SELECT * FROM movies as m
	JOIN directors as d ON d.id = m.director_id
    JOIN tickets as t ON m.id = t.movie_id;
        
        
-- 04 Liste todos os diretores, incluindo aqueles que não dirigiram nenhum filme 
 select * from directors as d
	left join movies as m on d.id = m.director_id; 
    
    
-- 05 Liste todos os filmes, incluindo aqueles que não têm um diretor associado
 select * from directors as d
	right join movies as m on d.id = m.director_id;

-- 06 Liste todos os filmes que têm tickets e seus diretores, incluindo os filmes sem tickets
select * 
from movies as m
	join directors as d on m.director_id = d.id
	left join tickets as t on t.movie_id = m.id;
	

-- 07 Liste todos os filmes que não têm tickets e seus diretores
SELECT *
FROM movies as m
	LEFT JOIN tickets as t on m.id = t.movie_id
	JOIN directors as d ON d.id = m.director_id
WHERE t.id is null;

-- 08 Liste todos os diretores, incluindo aqueles que não dirigiram nenhum filme, e os filmes que têm tickets
select *
from directors as d
    left join movies as m on d.id = m.director_id
	join tickets as t on t.movie_id = m.id;
    
-- 09 Liste todos os filmes que têm tickets e seus diretores
select *
from movies as m
	JOIN tickets as t on t.movie_id = m.id
	JOIN directors AS d ON d.id = m.director_id;

    
-- 10 Liste todos os filmes e seus diretores, incluindo os filmes sem diretores
select *
from movies as m 
	left join directors as d on m.director_id = d.id;
