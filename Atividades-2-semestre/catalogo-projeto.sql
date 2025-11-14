
DROP DATABASE CatalogoFilmes;
CREATE DATABASE CatalogoFilmes;
GO
USE CatalogoFilmes;
GO


DROP TABLE Genero;
CREATE TABLE Genero (
    idGenero INT IDENTITY PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);
GO

INSERT INTO Genero (nome) VALUES
('Ação'),
('Comédia'),
('Drama'),
('Romance'),
('Terror'),
('Suspense'),
('Fantasia'),
('Ficção Científica'),
('Aventura'),
('Documentário');
GO

DROP TABLE Filme;
CREATE TABLE Filme (
    idFilme INT IDENTITY PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano INT,
    sinopse TEXT,
    duracao INT, 
    classificacao VARCHAR(10),
    idGenero INT,
    FOREIGN KEY (idGenero) REFERENCES Genero(idGenero)
);
GO
SELECT * FROM Filme

INSERT INTO Filme (titulo, ano, sinopse, duracao, classificacao, idGenero)
VALUES
('Velozes e Furiosos', 2001, 'Corridas ilegais e ação intensa nas ruas de Los Angeles.', 106, '14', 1),
('As Branquelas', 2004, 'Dois agentes do FBI disfarçados tentam resolver um sequestro.', 109, '12', 2),
('O Poderoso Chefão', 1972, 'A história da família Corleone e seu império mafioso.', 175, '18', 3),
('Titanic', 1997, 'Um romance trágico a bordo do famoso navio Titanic.', 195, '12', 4),
('Invocação do Mal', 2013, 'Investigadores paranormais enfrentam forças malignas.', 112, '16', 5),
('Ilha do Medo', 2010, 'Um detetive investiga o desaparecimento de uma paciente em um hospital psiquiátrico.', 138, '16', 6),
('Harry Potter e a Pedra Filosofal', 2001, 'Um jovem descobre ser um bruxo e entra em uma escola de magia.', 152, '10', 7),
('Matrix', 1999, 'Um hacker descobre que vive em uma realidade simulada.', 136, '14', 8),
('Piratas do Caribe: A Maldição do Pérola Negra', 2003, 'Um capitão excêntrico e uma tripulação em busca de um tesouro.', 143, '12', 9),
('O Dilema das Redes', 2020, 'Documentário sobre o impacto das redes sociais na sociedade.', 94, '10', 10);
GO


CREATE TABLE GeneroFilme
(
   id_GeneroFilme INT IDENTITY PRIMARY KEY,
   id_filmes INT
   FOREIGN KEY(id_filmes) REFERENCES Filme(idFilme),
    titulo_ref VARCHAR(150) NOT NULL
    FOREIGN KEY(titulo_ref) REFERENCES Filme(titulo),
   id_genero INT
   FOREIGN KEY(id_genero) REFERENCES Genero(idGenero)
);

SELECT * FROM GeneroFilme
GO

SELECT*FROM Filme;