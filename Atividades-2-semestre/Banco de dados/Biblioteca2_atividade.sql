-- Atividades 
DROP DATABASE Biblioteca3
CREATE DATABASE Biblioteca3;
USE Biblioteca3;
GO



SELECT COUNT(*) AS QuantidadeLivros
FROM Livro;


SELECT AVG(ano) AS AnoMedioPublicacao
FROM Livro;


SELECT l.nome AS Leitor,
       COUNT(e.id_Emprestimo) AS QtdEmprestimos
FROM Emprestimo e
JOIN Leitor l ON e.id_Leitor = l.id_Leitor
GROUP BY l.nome
ORDER BY QtdEmprestimos DESC;




SELECT nome AS Autor,
       LEFT(nome, 3) AS TresPrimeirosCaracteres
FROM Autor;

SELECT LOWER(titulo) AS TituloMinusculo
FROM Livro;


SELECT nome, email
FROM Leitor
WHERE email LIKE '%.com';


SELECT a.nome AS Autor,
       REPLACE(l.titulo, 'estrela', 'sol') AS TituloAtualizado
FROM Livro l
JOIN Autor a ON a.id_Autor = l.id_Autor
WHERE a.nome = 'Clarice Lispector';




SELECT id_Emprestimo, id_Livro, id_Leitor,
       data_emprestimo,
       MONTH(data_emprestimo) AS NumeroMes
FROM Emprestimo
WHERE MONTH(data_emprestimo) = 8
  AND YEAR(data_emprestimo) = 2025;


SELECT DATEDIFF(DAY, MIN(data_emprestimo), GETDATE()) AS DiasDesdePrimeiroEmprestimo
FROM Emprestimo;


SET LANGUAGE Portuguese;
SELECT data_emprestimo AS DataEmprestimo,
       DATENAME(WEEKDAY, data_emprestimo) AS DiaDaSemana
FROM Emprestimo;




SELECT l.titulo, l.ano, a.nome AS Autor
FROM Livro l
JOIN Autor a ON a.id_Autor = l.id_Autor
WHERE l.ano BETWEEN 1950 AND 2005
  AND a.nome <> 'J. K. Rowling';


SELECT *
FROM Leitor
WHERE nome LIKE 'C%';


SELECT e.id_Emprestimo, e.id_Livro, e.id_Leitor, e.data_emprestimo
FROM Emprestimo e
WHERE YEAR(data_emprestimo) = 2025
  AND data_devolucao IS NULL;


SELECT a.nome AS AutorSemLivro
FROM Autor a
LEFT JOIN Livro l ON a.id_Autor = l.id_Autor
WHERE l.id_Livro IS NULL;