USE aula_db_exemplos;

-- 1
SELECT titulo FROM livros;

-- 2
SELECT nome
FROM autores
WHERE nascimento < '1900-01-01';

-- 3
SELECT l.titulo, a.nome
FROM livros l
INNER JOIN autores a ON l.autor_id = a.id
WHERE nome = 'J.K. Rowling';

-- 4
SELECT a.nome, m.curso
FROM alunos a
INNER JOIN matriculas m ON a.id = m.aluno_id
WHERE curso = 'Engenharia de Software';

-- 5
SELECT produto, SUM(receita) AS total_receita
FROM vendas
GROUP BY produto;

-- 6
SELECT a.nome, COUNT(autor_id) AS numero_livros
FROM autores a
INNER JOIN livros l ON a.id = l.autor_id
GROUP BY a.nome;

-- 7
SELECT m.curso, COUNT(a.id) AS qtd_alunos
FROM matriculas m
INNER JOIN alunos a ON m.aluno_id = a.id
GROUP BY m.curso;

-- 8
SELECT produto, AVG(receita) AS media_receita
FROM vendas
GROUP BY produto;

-- 9
SELECT produto, SUM(receita) AS total_receita
FROM vendas
GROUP BY produto
HAVING total_receita > 10000;

-- 10
SELECT a.nome, COUNT(autor_id) AS qtd_livros
FROM autores a
INNER JOIN livros l ON a.id = l.autor_id
GROUP BY a.nome
HAVING qtd_livros > 2;

-- 11
SELECT a.nome, l.titulo
FROM autores a
INNER JOIN livros l ON a.id = l.autor_id;

-- 12
SELECT a.nome, m.curso
FROM alunos a
INNER JOIN matriculas m ON a.id = m.aluno_id;

-- 13
SELECT a.nome, l.titulo
FROM autores a
LEFT JOIN livros l ON a.id = l.autor_id;

-- 14
SELECT a.nome, m.curso
FROM alunos a
RIGHT JOIN matriculas m ON a.id = m.aluno_id;

-- 15
SELECT a.nome, m.curso
FROM alunos a
INNER JOIN matriculas m ON a.id = m.aluno_id;

-- 16
SELECT nome
FROM autores
WHERE id = (
	SELECT autor_id
    FROM livros
    GROUP BY autor_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- 17
SELECT produto, SUM(receita) AS total_vendas
FROM vendas
GROUP BY produto
ORDER BY total_vendas
LIMIT 1;

-- 19
SELECT a.nome, COUNT(aluno_id) AS cursos_matriculados
FROM alunos a
INNER JOIN matriculas m ON a.id = m.aluno_id
GROUP BY a.nome;

-- 20
SELECT produto, COUNT(*) AS total_vendas
FROM vendas
GROUP BY produto
ORDER BY total_vendas DESC
LIMIT 1;