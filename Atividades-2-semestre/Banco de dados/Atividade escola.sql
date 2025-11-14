-- 2) Escola
-- 
-- Cadastro de professores, disciplinas e matrículas.
-- 
-- 1 _ Professor: id_prof (PK), nome (NOT NULL)
-- 2 _ Disciplina: id_disc (PK), nome (UNIQUE, NOT NULL), id_prof (FK)
-- 3 _ Aluno: id_aluno (PK), nome (NOT NULL), ra (UNIQUE)
-- 4 _ Matrícula: id_matricula (PK), id_aluno (FK), id_disc (FK), data (NOT NULL)

DROP DATABASE Escola134
CREATE DATABASE Escola134; 

USE Escola134;

CREATE TABLE Professor (
    ID_prof INT PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE
)
GO

INSERT INTO Professor (ID_prof, Nome, CPF) VALUES
(1, 'Ana Paula Souza', '123.456.789-01'),
(2, 'Carlos Alberto Lima', '234.567.890-12'),
(3, 'Fernanda Martins', '345.678.901-23'),
(4, 'João Henrique Alves', '456.789.012-34'),
(5, 'Mariana Rocha', '567.890.123-45'),
(6, 'R(jo icardo Oliveira', '678.901.234-56'),
(7, 'Patrícia Mendes', '789.012.345-67'),
(8, 'Gustavo Ferreira', '890.123.456-78'),
(9, 'Beatriz Campos', '901.234.567-89'),
(10, 'Thiago Ribeiro', '012.345.678-90');
GO

CREATE TABLE Disciplina (
    ID_Disci INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    ID_prof INT NOT NULL,
    FOREIGN KEY (ID_prof) REFERENCES Professor (ID_prof)
)
GO

INSERT INTO Disciplina (ID_Disci, Nome, ID_prof) VALUES
(1, 'Matematica', 1), 
(2, 'Português', 2),
(3, 'História', 3), 
(4, 'Geografia', 4),
(5, 'Física', 5), 
(6, 'Química', 6),
(7, 'Biologia', 7), 
(8, 'Inglês', 8),
(9, 'Educação Física', 9), 
(10, 'Artes', 10);
GO

CREATE TABLE Aluno (
    ID_aluno INT PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    RA VARCHAR(14) UNIQUE
)
GO

INSERT INTO Aluno (ID_aluno, Nome, RA) VALUES
(1,  'Lucas Almeida',       'RA20250001'),
(2,  'Mariana Santos',      'RA20250002'),
(3,  'João Pedro Silva',    'RA20250003'),
(4,  'Ana Clara Souza',     'RA20250004'),
(5,  'Gabriel Oliveira',    'RA20250005'),
(6,  'Beatriz Costa',       'RA20250006'),
(7,  'Mateus Fernandes',    'RA20250007'),
(8,  'Isabela Martins',     'RA20250008'),
(9,  'Rafael Gonçalves',    'RA20250009'),
(10, 'Larissa Rocha',       'RA20250010'),
(11, 'Thiago Ribeiro',      'RA20250011'),
(12, 'Camila Barbosa',      'RA20250012'),
(13, 'Pedro Henrique Lima', 'RA20250013'),
(14, 'Juliana Azevedo',     'RA20250014'),
(15, 'Felipe Teixeira',     'RA20250015'),
(16, 'Carolina Mendes',     'RA20250016'),
(17, 'André Nogueira',      'RA20250017'),
(18, 'Sofia Cardoso',       'RA20250018'),
(19, 'Vinícius Moura',      'RA20250019'),
(20, 'Fernanda Pires',      'RA20250020');


CREATE TABLE Matricula(
    ID_matri INT PRIMARY KEY,
    ID_aluno INT NOT NULL,
    ID_Disci INT NOT NULL,
    Data DATE NOT NULL,
    FOREIGN KEY (ID_aluno) REFERENCES Aluno (ID_aluno), 
    FOREIGN KEY (ID_Disci) REFERENCES Disciplina (ID_Disci)
);
GO

INSERT INTO Matricula (ID_matri, ID_aluno, ID_Disci, Data) VALUES
(1,  1, 1, '2025-02-10'), 
(2,  2, 2, '2025-02-10'),
(3,  3, 3, '2025-02-11'),
(4,  4, 4, '2025-02-11'),
(5,  5, 5, '2025-02-12'),
(6,  6, 6, '2025-02-12'),
(7,  7, 7, '2025-02-13'),
(8,  8, 8, '2025-02-13'),
(9,  9, 9, '2025-02-14'),
(10, 10, 10, '2025-02-14'),
(11, 11, 1, '2025-02-15'),
(12, 12, 2, '2025-02-15'),
(13, 13, 3, '2025-02-16'),
(14, 14, 4, '2025-02-16'),
(15, 15, 5, '2025-02-17'),
(16, 16, 6, '2025-02-17'),
(17, 17, 7, '2025-02-18'),
(18, 18, 8, '2025-02-18'),
(19, 19, 9, '2025-02-19'),
(20, 20, 10, '2025-02-19');
GO


SELECT * FROM Professor;
SELECT * FROM Disciplina;
SELECT * FROM Aluno;
SELECT * FROM Matricula;



-- Atualizar CPF de um professor
UPDATE Professor SET CPF = '111.222.333-44'
WHERE ID_prof = 1;

-- Alterar nome de uma disciplina
UPDATE Disciplina SET Nome = 'Matemática Avançada'
WHERE ID_Disci = 1;

-- Alterar RA de aluno
UPDATE Aluno SET RA = 'RA20259999'
WHERE ID_aluno = 2;

-- Alterar a data de matrícula
UPDATE Matricula SET Data = '2025-03-01'
WHERE ID_matri = 2;

-- Renomear tabela Professor para Docente
EXEC sp_rename 'Professor', 'Docente';

-- Renomear a coluna ID_prof para ID_docente
EXEC sp_rename 'Docente.ID_prof', 'ID_docente', 'COLUMN';
SELECT * FROM Docente;

-- Alterar tamanho do nome de aluno
ALTER TABLE Aluno
ALTER COLUMN Nome NVARCHAR(150) NOT NULL;

-- Ver estrutura de tabela
EXEC sp_help 'Aluno';

-- Apagar a PK da tabela Disciplina
ALTER TABLE Disciplina
DROP CONSTRAINT PK__Disciplina__ID_Disci;  -- nome pode variar, ajuste no seu SQL

-- Recriar a PK
ALTER TABLE Disciplina
ADD CONSTRAINT PK_Disciplina PRIMARY KEY (ID_Disci);

-- Apagar a FK de matrícula
ALTER TABLE Matricula
DROP CONSTRAINT FK__Matricula__ID_al__;    -- nome pode variar, ajuste no seu SQL

-- Recriar a FK com ON DELETE CASCADE
ALTER TABLE Matricula
ADD CONSTRAINT FK_Matricula_Aluno_Cascade
FOREIGN KEY (ID_aluno) REFERENCES Aluno(ID_aluno)
ON DELETE CASCADE;

-- Deletar aluno (vai apagar matrícula junto)
DELETE Aluno WHERE ID_aluno = 5;

-- Adicionar nova coluna em Docente
ALTER TABLE Docente
ADD Cargo VARCHAR(50);

SELECT * FROM Docente;