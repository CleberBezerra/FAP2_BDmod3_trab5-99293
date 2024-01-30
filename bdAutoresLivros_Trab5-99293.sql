#0 - Criando as tabelas 'Autores' e 'Livros':
CREATE TABLE Autores 
( 
 autorID INT(10) AUTO_INCREMENT PRIMARY KEY,  
 nome VARCHAR(7) NOT NULL,  
 nacionalidade VARCHAR(7) NOT NULL
); 

CREATE TABLE Livros 
( 
 livroID INT(10) AUTO_INCREMENT PRIMARY KEY,  
 titulo VARCHAR(30) NOT NULL,  
 anoPublicacao INT(4) NOT NULL,  
 autorID INT
);
#00 - Alterando a tabela 'Livros':
ALTER TABLE Livros ADD FOREIGN KEY(autorID) REFERENCES Autores (autorID);

#1 - Inserção de dados:
INSERT INTO Autores(nome, nacionalidade) VALUES ('Chico Cesar', 'AF');
INSERT INTO Autores(nome, nacionalidade) VALUES ('Raul Seixas', 'US');
INSERT INTO Autores(nome, nacionalidade) VALUES ('Caetano Velozo', 'BR');
INSERT INTO Livros(titulo, anoPublicacao, autorID) VALUES ('MPB', '2022', 1);
INSERT INTO Livros(titulo, anoPublicacao, autorID) VALUES ('MsQL', '2011', 1);
INSERT INTO Livros(titulo, anoPublicacao, autorID) VALUES ('Rock', '1990', 2);
INSERT INTO Livros(titulo, anoPublicacao, autorID) VALUES ('Java', '1998', 3);
INSERT INTO Livros(titulo, anoPublicacao, autorID) VALUES ('Musical', '2023', 1);

#2 - Consulta simples:
SELECT * FROM Autores;
SELECT * FROM Livros;

#3 - Consulta com junção 'INNER JOIN':
SELECT Livros.livroID, Livros.titulo, Livros.anoPublicacao, Autores.nome FROM Livros
INNER JOIN Autores ON Livros.autorID = Autores.autorID;

#4 - Consulta com junção 'LEFT JOIN':
SELECT Autores.autorID, Autores.nome, Livros.livroID, Livros.titulo, Livros.anoPublicacao FROM Autores
LEFT JOIN Livros ON Autores.autorID = Livros.autorID;

#5 - Consulta com filtro por nacionalidade:
SELECT Autores.autorID, Autores.nome, Livros.livroID, Livros.titulo FROM Autores
LEFT JOIN Livros ON Autores.autorID = Livros.autorID
WHERE Autores.nacionalidade = 'BR';

#6 - Consulta agregada:
SELECT Autores.autorID, Autores.nome, COUNT(Livros.livroID) AS Quantidade FROM Autores
LEFT JOIN Livros ON Autores.autorID = Livros.autorID
GROUP BY Autores.autorID, Autores.nome;