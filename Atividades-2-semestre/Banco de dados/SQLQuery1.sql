
CREATE DATABASE Clinica2;
USE Clinica2;

-- TABELA DE PACIENTES
CREATE TABLE Paciente (
    idPaciente INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf CHAR(11),
    telefone VARCHAR(15),
    numeroPlano VARCHAR(20)
);

-- TABELA DE MÉDICOS
CREATE TABLE Medico (
    idMedico INT PRIMARY KEY,
    nome VARCHAR(100),
    crm VARCHAR(10),
    especialidade VARCHAR(50)
);

-- TABELA DE CONSULTAS
CREATE TABLE Consulta (
    idConsulta INT PRIMARY KEY,
    dataConsulta DATE,
    horario TIME,
    idPaciente INT,
    idMedico INT
);


-- 1. INSERIR PACIENTES
INSERT INTO Paciente VALUES
(1, 'Ana Silva', '12345678901', '11988887777', 'PL123'),
(2, 'Carlos Souza', '23456789012', '11999996666', 'PL456'),
(3, 'Mariana Lima', '34567890123', '21988889999', 'PL789'),
(4, 'João Pereira', '45678901234', '11977778888', 'PL321'),
(5, 'Fernanda Costa', '56789012345', '11966667777', 'PL654'),
(6, 'Ricardo Alves', '67890123456', '11955556666', 'PL987');

-- 2. INSERIR MÉDICOS
INSERT INTO Medico VALUES
(1, 'Dr. Paulo Mendes', 'CRM001', 'Cardiologia'),
(2, 'Dra. Julia Torres', 'CRM002', 'Dermatologia'),
(3, 'Dr. Roberto Nunes', 'CRM003', 'Ortopedia'),
(4, 'Dra. Beatriz Ramos', 'CRM004', 'Pediatria'),
(5, 'Dr. Felipe Rocha', 'CRM005', 'Neurologia');


-- 3. INSERIR CONSULTAS
INSERT INTO Consulta VALUES
(1, '2025-10-01', '09:00:00', 1, 1),
(2, '2025-10-02', '10:30:00', 2, 2),
(3, '2025-10-03', '14:00:00', 3, 3);


-- 4. LISTAR PACIENTES
SELECT * FROM Paciente;


-- 6. LISTAR CONSULTAS
SELECT * FROM Consulta;


-- 7. CONSULTAS DE UM PACIENTE ESPECÍFICO (exemplo pelo idPaciente = 1)
SELECT * FROM Consulta WHERE idPaciente = 1;


-- 8. CONSULTAS DE UM MÉDICO ESPECÍFICO (exemplo pelo idMedico = 1)
SELECT * FROM Consulta WHERE idMedico = 1;


-- 9. ATUALIZAR PLANO DE PACIENTE
UPDATE Paciente SET numeroPlano = 'PL999' WHERE idPaciente = 1;


-- 10. DELETAR PACIENTES
DELETE FROM Paciente WHERE idPaciente = 5;
DELETE FROM Paciente WHERE idPaciente = 6;


-- 11. INSERIR MAIS MÉDICOS E PACIENTES
INSERT INTO Medico VALUES
(6, 'Dr. André Silva', 'CRM006', 'Endocrinologia'),
(7, 'Dra. Camila Prado', 'CRM007', 'Ginecologia'),
(8, 'Dr. Gustavo Vieira', 'CRM008', 'Psiquiatria');

INSERT INTO Paciente VALUES
(7, 'Lucas Martins', '78901234567', '11944445555', 'PL741'),
(8, 'Patricia Oliveira', '89012345678', '11933334444', 'PL852');


-- 12. ATUALIZAR ESPECIALIDADE DE MÉDICO
UPDATE Medico SET especialidade = 'Clínico Geral' WHERE idMedico = 1;
UPDATE Medico SET especialidade = 'Oncologia' WHERE idMedico = 2;