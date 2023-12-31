DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE IF NOT EXISTS biblioteca;
use biblioteca;

CREATE TABLE IF NOT EXISTS Livros (
    livro_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    editora VARCHAR(255),
    ano_publicacao INT,
    isbn VARCHAR(20)
);

INSERT INTO Livros (titulo, autor, editora, ano_publicacao, isbn)VALUES 
('A Culpa é das Estrelas', 'John Green', 'Intrínseca', 2012, '978-85-8057-346-6'),
( 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Rocco', 1997, '9788532511010'),
( 'O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 'Martins Fontes', 1954, '9788533603149'),
('The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '9780316769488'),
( '1984', 'George Orwell', 'Companhia Editora Nacional', 1949, '978-85-221-0616-9'),
( 'Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 2005, '9788598078355');

CREATE TABLE IF NOT EXISTS Autores (
	autor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Editoras (
	editora_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(255)
);


ALTER TABLE livros
DROP COLUMN autor, 
DROP COLUMN editora;


ALTER TABLE livros
ADD COLUMN autor_id INT,
ADD COLUMN editora_id INT,
ADD FOREIGN KEY (autor_id) REFERENCES Autores(autor_id),
ADD FOREIGN KEY (editora_id) REFERENCES Editoras(editora_id);

INSERT INTO Autores (nome_autor) VALUES 
('John Green'), ('J.K. Rowling'), ('J.R.R. Tolkien'), ('J.D. Salinger'), ('George Orwell'), ('Rick Riordan') ;

INSERT INTO Editoras (nome_editora) VALUES 
('Intrínseca'), ('Rocco'), ('Martins Fontes'), ('Little, Brown and Company'), ('Companhia Editora Nacional'),  ('Intrínseca');

UPDATE Livros SET autor_id = 1 WHERE livro_id = 1;
UPDATE Livros SET autor_id = 2 WHERE livro_id = 2;
UPDATE Livros SET autor_id = 3 WHERE livro_id = 3;
UPDATE Livros SET autor_id = 4 WHERE livro_id = 4;
UPDATE Livros SET autor_id = 5 WHERE livro_id = 5;
UPDATE Livros SET autor_id = 6 WHERE livro_id = 6;

UPDATE Livros SET editora_id = 1 WHERE livro_id = 1;
UPDATE Livros SET editora_id = 2 WHERE livro_id = 2;
UPDATE Livros SET editora_id = 3 WHERE livro_id = 3;
UPDATE Livros SET editora_id = 4 WHERE livro_id = 4;
UPDATE Livros SET editora_id = 5 WHERE livro_id = 5;
UPDATE Livros SET editora_id = 6 WHERE livro_id = 6;

INSERT INTO Livros (titulo,  ano_publicacao, isbn, autor_id, editora_id) VALUES 
( 'Grande Sertão: Veredas', 1956, '978-85-209-2325-1', 1, 1),
('Memórias Póstumas de Brás Cubas', 1881, '9788535910663', 2, 2),
('Vidas Secas',  1938, '9788572326972', 3, 3),
( 'O Alienista', 1882, '9788572327429', 2, 4),
('O Cortiço',  1890, '9788579027048', 4, 5),
( 'Dom Casmurro',  1899, '9788583862093', 2, 5),
('Macunaíma', 1928, '9788503012302', 6, 3);
