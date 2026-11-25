CREATE DATABASE ESCOLA;
USE ESCOLA;
CREATE TABLE ALUNOS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    dt_nascimento DATE NOT NULL
);
CREATE TABLE DISCIPLINAS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);
CREATE TABLE PROFESSOR (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    dt_nascimento DATE NOT NULL
);

CREATE TABLE MINISTRA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    professor_id INT NOT NULL,
    disciplinas_id INT NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES PROFESSOR(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (disciplinas_id) REFERENCES DISCIPLINAS(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO DISCIPLINAS (nome, carga_horaria) VALUES 
('Português', 80),
('Matemática', 80),
('Física', 60),
('Ed.Física', 30),
('Química', 60),
('Biologia', 30);
INSERT INTO PROFESSOR (nome, cpf, dt_nascimento) VALUES 
('Ana Silva', '11111111111', '1985-04-12'),
('Bruno Costa', '11111176356', '1990-08-23'),
('Carlos Pereira', '68597328913', '1978-11-05'),
('Daniela Souza', '37958155702', '1988-02-19'),
('Eduardo Almeida', '02101611711', '1982-07-30'),
('Fernanda Lima', '22222222245', '1992-09-14'),
('Gabriel Santos', '78425967802', '1980-12-01');
INSERT INTO MINISTRA (professor_id, disciplinas_id) VALUES
(1, 1),
(2, 6),
(3, 3),
(4, 4),
(5, 1),
(6, 2),
(7, 5);
INSERT INTO ALUNOS (nome, cpf, dt_nascimento) VALUES 
('Lucas Oliveira', '45218963201', '2008-03-15'),
('Mariana Santos', '78945612309', '2007-11-22'),
('Pedro Henrique Lima', '32165498700', '2009-01-10'),
('Juliana Costa', '96385274104', '2008-07-04'),
('Rafael Almeida', '15975348602', '2007-05-29');
CREATE TABLE MATRICULAS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    disciplina_id INT NOT NULL,
    data_matricula DATE NOT NULL,
    nota DECIMAL(4,2),
    FOREIGN KEY (aluno_id) REFERENCES ALUNOS(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (disciplina_id) REFERENCES DISCIPLINAS(id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (aluno_id, disciplina_id)
);
INSERT INTO MATRICULAS (aluno_id, disciplina_id, data_matricula, nota) VALUES
(1, 1, '2026-02-01', 8.50),
(1, 2, '2026-02-01', 9.00),
(2, 1, '2026-02-02', 7.75),
(2, 6, '2026-02-02', NULL),
(3, 3, '2026-02-03', 6.50),
(4, 4, '2026-02-03', 10.00),
(5, 5, '2026-02-04', 8.00);