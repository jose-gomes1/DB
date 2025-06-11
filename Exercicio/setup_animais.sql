-- Criação da base de dados
CREATE DATABASE IF NOT EXISTS RegistoAnimais;
USE RegistoAnimais;

-- Tabela de espécies
CREATE TABLE IF NOT EXISTS Especies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela de animais
CREATE TABLE IF NOT EXISTS Animais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    especie_id INT,
    FOREIGN KEY (especie_id) REFERENCES Especies(id)
);

-- Inserção de dados iniciais
INSERT INTO Especies (nome) VALUES 
('Cão'),
('Gato'),
('Papagaio');

INSERT INTO Animais (nome, idade, especie_id) VALUES
('Rex', 5, 1),
('Mimi', 3, 2),
('Louro', 2, 3);
