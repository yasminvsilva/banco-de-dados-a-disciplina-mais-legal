USE BibliotecaPessoal;

-- 1
DELIMITER //
CREATE PROCEDURE sp_ListarAutores()
BEGIN
	SELECT Nome, Sobrenome
    FROM Autor;
END;
//
DELIMITER ;

CALL sp_ListarAutores();

-- 2
DELIMITER //
CREATE PROCEDURE sp_LivrosPorCategoria(IN nm_categoria VARCHAR(50))
BEGIN
	SELECT l.Titulo, c.Nome AS Categoria
    FROM Livro l
    INNER JOIN Categoria c ON l.Categoria_ID = c.Categoria_ID
    WHERE c.Nome = nm_categoria;
END;
//
DELIMITER ;

CALL sp_LivrosPorCategoria('Autoajuda');
