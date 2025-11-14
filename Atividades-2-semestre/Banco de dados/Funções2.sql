-- BANCO DE DADOS - Vendas Online
DROP DATABASE VendasOnline
CREATE DATABASE VendasOnline2;
GO
USE VendasOnline2;
GO

CREATE TABLE StatusPedido (
    StatusId INT IDENTITY(1,1) PRIMARY KEY,
    Nome     VARCHAR(40) NOT NULL
);
GO

CREATE TABLE Categoria (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    Nome        VARCHAR(60) NOT NULL
);

GO

CREATE TABLE Cliente (
    ClienteID    INT IDENTITY(1,1) PRIMARY KEY,
    Nome         VARCHAR(50) NOT NULL,
    Sobrenome    VARCHAR(50) NOT NULL,
    Email        VARCHAR(100) UNIQUE,
    Telefone     VARCHAR(20),
    DataCadastro DATE NOT NULL DEFAULT DATEADD(HOUR, -3, SYSUTCDATETIME())
);

GO

CREATE TABLE Produto (
    ProdutoID          INT IDENTITY(1,1) PRIMARY KEY,
    CategoriaID        INT NOT NULL,
    Nome               VARCHAR(120) NOT NULL,
    Preco              DECIMAL(10,2) NOT NULL CHECK (Preco >= 0),
    QuantidadeEstoque  INT NOT NULL CHECK (QuantidadeEstoque >= 0),
    CONSTRAINT FK_Produto_Categoria FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

GO

CREATE TABLE Pedido (
    PedidoID    INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID   INT NOT NULL,
    DataPedido  DATE NOT NULL DEFAULT DATEADD(HOUR, -3, SYSUTCDATETIME()),
    ValorTotal  DECIMAL(10,2) NOT NULL DEFAULT 0,
    StatusID    INT NOT NULL,
    CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    CONSTRAINT FK_Pedido_Status  FOREIGN KEY (StatusID)  REFERENCES StatusPedido(StatusId)
);

GO

CREATE TABLE DetalhesPedido (
    DetalheID     INT IDENTITY(1,1) PRIMARY KEY,
    PedidoID      INT NOT NULL,
    ProdutoID     INT NOT NULL,
    Quantidade    INT NOT NULL CHECK (Quantidade > 0),
    PrecoUnitario DECIMAL(10,2) NOT NULL CHECK (PrecoUnitario >= 0),
    CONSTRAINT FK_Detalhes_Pedido  FOREIGN KEY (PedidoID)  REFERENCES Pedido(PedidoID),
    CONSTRAINT FK_Detalhes_Produto FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);

GO

-- INSERINDO DADOS

INSERT INTO StatusPedido (Nome) VALUES 
('Novo'), 
('Enviado'), 
('Cancelado');

GO

INSERT INTO Categoria (Nome) VALUES 
('Informática'), 
('Acessórios');

GO

INSERT INTO Cliente (Nome, Sobrenome, Email, Telefone, DataCadastro) VALUES
('João', 'Silva', 'joao@email.com', '11999999999', '2025-04-09');
GO

INSERT INTO Produto (CategoriaID, Nome, Preco, QuantidadeEstoque) VALUES
(1, 'Notebook X', 4500.00, 10),
(2, 'Mouse Óptico', 50.00, 100);
GO
bdVendasOnline.sql
Exibindo bdVendasOnline.sql…


-- Procedure 1: Inserir Cliente
CREATE PROCEDURE InserirCliente
    @Nome VARCHAR(50),
    @Sobrenome VARCHAR(50),
    @Email VARCHAR(100),
    @Telefone VARCHAR(20),
    @DataCadastro DATE
AS
BEGIN
    SET NOCOUNT ON -- Não mostra informação de linha afetadas
    INSERT INTO Cliente(Nome, Sobrenome, Email, Telefone, DataCadastro)
    VALUES (@Nome, @Sobrenome, @Email, @Telefone, @DataCadastro)
END
GO

-- Testando
EXEC InserirCliente 'Ana', 'Souza', 'ana@email.com', '11999999999', '2025-10-13'
GO

SELECT * FROM Cliente



-- inserir pedido 
CREATE PROCEDURE InseririrPedido
@ClienteId INT
@DataPedido DATE
@ValorTotal DECIMAL(10, 2)
@StatusId INT

AS
BEGIN 
    SET NOCOUNT ON 
    INSERT INTO Pedido (ClienteId, DaraPedido, ValorTotal, StatusId)
    VALUE (@ClienteId, @DataPedido, @ValorTotal, @StatusId)
END


IF DB_ID('Vendas') IS NOT NULL
    DROP DATABASE Vendas;
GO

-- BANCO DE DADOS - Vendas
CREATE DATABASE Vendas;
GO

USE Vendas;
GO

CREATE TABLE StatusPedido (
    StatusId INT IDENTITY(1,1) PRIMARY KEY,
    Nome     VARCHAR(40) NOT NULL
);
GO

CREATE TABLE Categoria (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    Nome        VARCHAR(60) NOT NULL
);
GO

CREATE TABLE Cliente (
    ClienteID    INT IDENTITY(1,1) PRIMARY KEY,
    Nome         VARCHAR(50) NOT NULL,
    Sobrenome    VARCHAR(50) NOT NULL,
    Email        VARCHAR(100) UNIQUE,
    Telefone     VARCHAR(20),
    DataCadastro DATE NOT NULL DEFAULT DATEADD(HOUR, -3, SYSUTCDATETIME())
);
GO

CREATE TABLE Produto (
    ProdutoID          INT IDENTITY(1,1) PRIMARY KEY,
    CategoriaID        INT NOT NULL,
    Nome               VARCHAR(120) NOT NULL,
    Preco              DECIMAL(10,2) NOT NULL CHECK (Preco >= 0),
    QuantidadeEstoque  INT NOT NULL CHECK (QuantidadeEstoque >= 0),
    CONSTRAINT FK_Produto_Categoria FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);
GO

CREATE TABLE Pedido (
    PedidoID   INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID  INT NOT NULL,
    DataPedido DATE NOT NULL DEFAULT DATEADD(HOUR, -3, SYSUTCDATETIME()),
    ValorTotal DECIMAL(10,2) NOT NULL DEFAULT 0,
    StatusID   INT NOT NULL,
    CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    CONSTRAINT FK_Pedido_Status  FOREIGN KEY (StatusID)  REFERENCES StatusPedido(StatusId)
);
GO

CREATE TABLE DetalhesPedido (
    DetalheID     INT IDENTITY(1,1) PRIMARY KEY,
    PedidoID      INT NOT NULL,
    ProdutoID     INT NOT NULL,
    Quantidade    INT NOT NULL CHECK (Quantidade > 0),
    PrecoUnitario DECIMAL(10,2) NOT NULL CHECK (PrecoUnitario >= 0),
    CONSTRAINT FK_Detalhes_Pedido  FOREIGN KEY (PedidoID)  REFERENCES Pedido(PedidoID),
    CONSTRAINT FK_Detalhes_Produto FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);
GO

-- INSERINDO DADOS

INSERT INTO StatusPedido (Nome) VALUES 
('Novo'), 
('Enviado'), 
('Cancelado');
GO

INSERT INTO Categoria (Nome) VALUES 
('Informática'), 
('Acessórios');
GO

INSERT INTO Cliente (Nome, Sobrenome, Email, Telefone, DataCadastro) VALUES
('João', 'Silva', 'joao@email.com', '11999999999', '2025-04-09');
GO

INSERT INTO Produto (CategoriaID, Nome, Preco, QuantidadeEstoque) VALUES
(1, 'Notebook X', 4500.00, 10),
(2, 'Mouse Óptico', 50.00, 100);
GO

----------------
-- PROCEDURES --
----------------

-- Procedure 1: Inserir Cliente
CREATE PROCEDURE InserirCliente
    @Nome VARCHAR(50),
    @Sobrenome VARCHAR(50),
    @Email VARCHAR(100),
    @Telefone VARCHAR(20),
    @DataCadastro DATE
AS
BEGIN
    SET NOCOUNT ON; -- Não mostra informação de linha afetadas
    INSERT INTO Cliente(Nome, Sobrenome, Email, Telefone, DataCadastro)
    VALUES (@Nome, @Sobrenome, @Email, @Telefone, @DataCadastro);
END
GO

-- Testando Procedure 1
EXEC InserirCliente 'Ana', 'Souza', 'ana@email.com', '11999999999', '2025-10-13';
GO

SELECT * FROM Cliente;
GO

-- Procedure 2: Inserir Pedido
CREATE PROCEDURE InserirPedido
    @ClienteId INT,
    @DataPedido DATE,
    @ValorTotal DECIMAL(10,2),
    @StatusId INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Pedido (ClienteID, DataPedido, ValorTotal, StatusID)
    VALUES (@ClienteId, @DataPedido, @ValorTotal, @StatusId);
END
GO

-- Testando Procedure 2
EXEC InserirPedido 2, '2025-10-13', 250.00, 1;
GO

SELECT * FROM Pedido;
GO

-- Procedure 3: Atualizar preço de produto
CREATE PROCEDURE AtualizarPrecoProduto
    @ProdutoId INT,
    @PercentualAumento DECIMAL(5,2)
AS
BEGIN
    SET NOCOUNT ON
    UPDATE Produto
        SET Preco = Preco * (1 + @PercentualAumento / 100.00)
    WHERE ProdutoID = @ProdutoId
END
GO

-- Testando Procedure 3
SELECT * FROM Produto -- Antes: Mouse = 50
GO

EXEC AtualizarPrecoProduto 2, 10
GO

SELECT * FROM Produto -- Depois: Mouse = 55
GO

-- Procedure 4: Total de vendas por cliente (saída)
USE Vendas
GO

CREATE PROCEDURE ObterTotalVendas
    @ClienteId INT,
    @TotalVendas DECIMAL(10,2) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    SELECT @TotalVendas = COALESCE(SUM(ValorTotal), 0)
    -- Substitui valores nulos por zero
    FROM Pedido
    WHERE ClienteId = @ClienteId
END
GO

-- Testando Procedure 4
DECLARE @Total DECIMAL(10,2)
EXEC ObterTotalVendas 1, @Total OUTPUT
SELECT @Total AS TotalDeVendas
GO

-- Procedure 5: Relatório de Vendas por Cliente
CREATE PROCEDURE VendasPorCliente
    @DataLimite DATE
AS
BEGIN
    SET NOCOUNT ON
        
    SELECT C.ClienteId, C.Nome,
           SUM(D.Quantidade * D.PrecoUnitario) AS TotalGasto
    FROM Cliente C
    JOIN Pedido P ON P.ClienteID = C.ClienteID
    JOIN DetalhesPedido D ON D.PedidoID = P.PedidoID
    WHERE P.DataPedido < @DataLimite
    GROUP BY C.ClienteID, C.Nome
END
GO

-- Testando Procedure 5
INSERT INTO DetalhesPedido(PedidoID, ProdutoID, Quantidade, PrecoUnitario) VALUES
(1, 1, 1, 4500.00)
GO

SELECT * FROM Pedido -- Antes
GO

EXEC VendasPorCliente '2025-10-14'
GO

IF DB_ID('Vendas') IS NOT NULL
    DROP DATABASE Vendas;
GO

-- BANCO DE DADOS - Vendas
CREATE DATABASE Vendas;
GO

USE Vendas;
GO

CREATE TABLE StatusPedido (
    StatusId INT IDENTITY(1,1) PRIMARY KEY,
    Nome     VARCHAR(40) NOT NULL
);
GO

CREATE TABLE Categoria (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    Nome        VARCHAR(60) NOT NULL
);
GO

CREATE TABLE Cliente (
    ClienteID    INT IDENTITY(1,1) PRIMARY KEY,
    Nome         VARCHAR(50) NOT NULL,
    Sobrenome    VARCHAR(50) NOT NULL,
    Email        VARCHAR(100) UNIQUE,
    Telefone     VARCHAR(20),
    DataCadastro DATE NOT NULL DEFAULT DATEADD(HOUR, -3, SYSUTCDATETIME())
);
GO

CREATE TABLE Produto (
    ProdutoID          INT IDENTITY(1,1) PRIMARY KEY,
    CategoriaID        INT NOT NULL,
    Nome               VARCHAR(120) NOT NULL,
    Preco              DECIMAL(10,2) NOT NULL CHECK (Preco >= 0),
    QuantidadeEstoque  INT NOT NULL CHECK (QuantidadeEstoque >= 0),
    CONSTRAINT FK_Produto_Categoria FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);
GO

CREATE TABLE Pedido (
    PedidoID   INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID  INT NOT NULL,
    DataPedido DATE NOT NULL DEFAULT DATEADD(HOUR, -3, SYSUTCDATETIME()),
    ValorTotal DECIMAL(10,2) NOT NULL DEFAULT 0,
    StatusID   INT NOT NULL,
    CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    CONSTRAINT FK_Pedido_Status  FOREIGN KEY (StatusID)  REFERENCES StatusPedido(StatusId)
);
GO

CREATE TABLE DetalhesPedido (
    DetalheID     INT IDENTITY(1,1) PRIMARY KEY,
    PedidoID      INT NOT NULL,
    ProdutoID     INT NOT NULL,
    Quantidade    INT NOT NULL CHECK (Quantidade > 0),
    PrecoUnitario DECIMAL(10,2) NOT NULL CHECK (PrecoUnitario >= 0),
    CONSTRAINT FK_Detalhes_Pedido  FOREIGN KEY (PedidoID)  REFERENCES Pedido(PedidoID),
    CONSTRAINT FK_Detalhes_Produto FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);
GO

-- INSERINDO DADOS

INSERT INTO StatusPedido (Nome) VALUES 
('Novo'), 
('Enviado'), 
('Cancelado');
GO

INSERT INTO Categoria (Nome) VALUES 
('Informática'), 
('Acessórios');
GO

INSERT INTO Cliente (Nome, Sobrenome, Email, Telefone, DataCadastro) VALUES
('João', 'Silva', 'joao@email.com', '11999999999', '2025-04-09');
GO

INSERT INTO Produto (CategoriaID, Nome, Preco, QuantidadeEstoque) VALUES
(1, 'Notebook X', 4500.00, 10),
(2, 'Mouse Óptico', 50.00, 100);
GO

----------------
-- PROCEDURES --
----------------

-- Procedure 1: Inserir Cliente
CREATE PROCEDURE InserirCliente
    @Nome VARCHAR(50),
    @Sobrenome VARCHAR(50),
    @Email VARCHAR(100),
    @Telefone VARCHAR(20),
    @DataCadastro DATE
AS
BEGIN
    SET NOCOUNT ON; -- Não mostra informação de linha afetadas
    INSERT INTO Cliente(Nome, Sobrenome, Email, Telefone, DataCadastro)
    VALUES (@Nome, @Sobrenome, @Email, @Telefone, @DataCadastro);
END
GO

-- Testando Procedure 1
EXEC InserirCliente 'Ana', 'Souza', 'ana@email.com', '11999999999', '2025-10-13';
GO

SELECT * FROM Cliente;
GO

-- Procedure 2: Inserir Pedido
CREATE PROCEDURE InserirPedido
    @ClienteId INT,
    @DataPedido DATE,
    @ValorTotal DECIMAL(10,2),
    @StatusId INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Pedido (ClienteID, DataPedido, ValorTotal, StatusID)
    VALUES (@ClienteId, @DataPedido, @ValorTotal, @StatusId);
END
GO

-- Testando Procedure 2
EXEC InserirPedido 2, '2025-10-13', 250.00, 1;
GO

SELECT * FROM Pedido;
GO

-- Procedure 3: Atualizar preço de produto
CREATE PROCEDURE AtualizarPrecoProduto
    @ProdutoId INT,
    @PercentualAumento DECIMAL(5,2)
AS
BEGIN
    SET NOCOUNT ON
    UPDATE Produto
        SET Preco = Preco * (1 + @PercentualAumento / 100.00)
    WHERE ProdutoID = @ProdutoId
END
GO

-- Testando Procedure 3
SELECT * FROM Produto -- Antes: Mouse = 50
GO

EXEC AtualizarPrecoProduto 2, 10
GO

SELECT * FROM Produto -- Depois: Mouse = 55
GO

-- Procedure 4: Total de vendas por cliente (saída)
USE Vendas
GO

CREATE PROCEDURE ObterTotalVendas
    @ClienteId INT,
    @TotalVendas DECIMAL(10,2) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    SELECT @TotalVendas = COALESCE(SUM(ValorTotal), 0)
    -- Substitui valores nulos por zero
    FROM Pedido
    WHERE ClienteId = @ClienteId
END
GO

-- Testando Procedure 4
DECLARE @Total DECIMAL(10,2)
EXEC ObterTotalVendas 1, @Total OUTPUT
SELECT @Total AS TotalDeVendas
GO

-- Procedure 5: Relatório de Vendas por Cliente
CREATE PROCEDURE VendasPorCliente
    @DataLimite DATE
AS
BEGIN
    SET NOCOUNT ON
        
    SELECT C.ClienteId, C.Nome,
           SUM(D.Quantidade * D.PrecoUnitario) AS TotalGasto
    FROM Cliente C
    JOIN Pedido P ON P.ClienteID = C.ClienteID
    JOIN DetalhesPedido D ON D.PedidoID = P.PedidoID
    WHERE P.DataPedido < @DataLimite
    GROUP BY C.ClienteID, C.Nome
END
GO

-- Testando Procedure 5
INSERT INTO DetalhesPedido(PedidoID, ProdutoID, Quantidade, PrecoUnitario) VALUES
(1, 1, 1, 4500.00)
GO

SELECT * FROM Pedido -- Antes
GO

EXEC VendasPorCliente '2025-10-14'
GO

-- Procedure 6: Histórico de preço com tabela própria
CREATE TABLE HistoricoPrecos (
    HistoricoId INT IDENTITY PRIMARY KEY,
    ProdutoId INT FOREIGN KEY REFERENCES Produto(ProdutoId),
    PrecoAntigo DECIMAL(10,2),
    PrecoNovo DECIMAL(10,2),
    DataModificacao DATE
)
GO

CREATE PROCEDURE AtualizarPrecoProdutoComHistorico
    @ProdutoId INT,
    @NovoPreco DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @PrecoAntigo DECIMAL(10,2)

    SELECT @PrecoAntigo = Preco
    FROM Produto
    WHERE ProdutoId = @ProdutoId

    UPDATE Produto SET Preco = @NovoPreco
    WHERE ProdutoId = @ProdutoId

    INSERT INTO HistoricoPrecos (ProdutoId, PrecoAntigo, PrecoNovo, DataModificacao) VALUES
    (@ProdutoId, @PrecoAntigo, @NovoPreco, DATEADD(HOUR, -3, SYSUTCDATETIME()))
END
GO

-- Testando Procedure 6

