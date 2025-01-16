-- INIT database
CREATE TABLE Abrigo (
    CNPJ INT PRIMARY KEY NOT NULL,
    Nome_Abrigo VARCHAR(45) NOT NULL,
    Endereco_Abrigo VARCHAR(45) NOT NULL,
    CPF_Gerente CHAR(11) NOT NULL,
    Email_Abrigo VARCHAR(45) NOT NULL
);

CREATE TABLE Adocao (
    ID_Adocao INT PRIMARY KEY NOT NULL,
    Data_Adocao DATE NOT NULL,
    CNPJ_Abrigo INT NOT NULL, -- FK para Abrigo
    CPF_Adotante CHAR(11) NOT NULL, -- FK para Adotante
    ID_Animal INT NOT NULL -- FK para Animal
);

CREATE TABLE Adotante (
    CPF CHAR(11) PRIMARY KEY NOT NULL,
    Nome_Adotante VARCHAR(45) NOT NULL,
    Email_Adotante VARCHAR(45) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Endereco_Adotante VARCHAR(45) NOT NULL
);

CREATE TABLE Animal (
    ID_Animal INT PRIMARY KEY NOT NULL,
    Nome_Animal VARCHAR(45) NOT NULL,
    Vacinas VARCHAR(45) NOT NULL,
    Descricao VARCHAR(200) NOT NULL,
    Sexo VARCHAR(45) NOT NULL,
    Idade INT NOT NULL,
    Raca VARCHAR(25) NOT NULL,
    CNPJ_Abrigo INT NOT NULL, -- FK para Abrigo
    Cod_Especie INT NOT NULL -- FK para Especie
);

CREATE TABLE Especie (
    Cod_Especie INT PRIMARY KEY NOT NULL,
    Cuidados VARCHAR(1000) NOT NULL
);

CREATE TABLE Telefone_Abrigo (
    Telefone_Abrigo VARCHAR(45) NOT NULL,
    CNPJ_Abrigo INT NOT NULL -- FK para Abrigo
);

CREATE TABLE Telefone_Adotante (
    Telefone_Adotante VARCHAR(45) NOT NULL,
    CPF_Adotante CHAR(11) NOT NULL -- FK para Adotante
);

CREATE TABLE Fotos (
    ID_Foto INT PRIMARY KEY AUTO_INCREMENT,
    URL_Fotos_Animal VARCHAR(200) NOT NULL,
    ID_Animal INT NOT NULL -- FK para Animal
);

-- Adicionar as chaves estrangeiras
ALTER TABLE Adocao ADD CONSTRAINT FK_Adocao_Abrigo
    FOREIGN KEY (CNPJ_Abrigo) REFERENCES Abrigo (CNPJ);

ALTER TABLE Adocao ADD CONSTRAINT FK_Adocao_Adotante
    FOREIGN KEY (CPF_Adotante) REFERENCES Adotante (CPF);


ALTER TABLE Adocao ADD CONSTRAINT FK_Adocao_Animal
    FOREIGN KEY (ID_Animal) REFERENCES Animal (ID_Animal);


ALTER TABLE Animal ADD CONSTRAINT FK_Animal_Abrigo
    FOREIGN KEY (CNPJ_Abrigo) REFERENCES Abrigo (CNPJ);

ALTER TABLE Animal ADD CONSTRAINT FK_Animal_Especie
	FOREIGN KEY (Cod_Especie) REFERENCES Especie (Cod_Especie);


ALTER TABLE Telefone_Abrigo ADD CONSTRAINT FK_Telefone_Abrigo
    FOREIGN KEY (CNPJ_Abrigo) REFERENCES Abrigo (CNPJ);


ALTER TABLE Telefone_Adotante ADD CONSTRAINT FK_Telefone_Adotante
    FOREIGN KEY (CPF_Adotante) REFERENCES Adotante (CPF);


ALTER TABLE Fotos ADD CONSTRAINT FK_Foto_Animal
    FOREIGN KEY (ID_Animal) REFERENCES Animal (ID_Animal);
    

INSERT INTO Especie (Cod_Especie, Cuidados) VALUES
(1, 'Cachorro - Ração Golden, espaço amplo, brincadeiras, socialização, banhos frequentes, passeios frequentes.'),
(2, 'Gato - Ambiente calmo, Ração whiskas, ambiente verticalizado, brinquedos, dormir muito, pentear os pêlos.');

INSERT INTO Abrigo (CNPJ, Nome_Abrigo, Endereco_Abrigo, CPF_Gerente, Email_Abrigo) VALUES
(1001, 'Abrigo Anjos de Patas', 'Rua das Flores, 123', '11122233344', 'anjospatas@abrigo.com'),
(1002, 'Skibidi Shelter', 'Av. Brainrot, 456', '55566677788', 'skibidirizz@abrigo.com'),
(1003, 'Quatro Patas', 'Rua Zero Bolas, 69', '99988877766', '4patas@abrigo.com'),
(1004, 'Bicho Loko', 'Rua Brasil, 321', '12345678901', 'lokobicho@abrigo.com'),
(1005, 'Eyes Wide Shelter', 'Av. Kubrick, 654', '22334455667', 'kubrick@abrigo.com'),
(1006, 'Abrigo Jailson Mendes', 'Rua Paulo Guina, 987', '33445566778', 'jailsonmendes@abrigo.com'),
(1007, 'Abrigo Magrelinho', 'Av. Saudades, 111', '44556677889', 'magrelinho@abrigo.com'),
(1008, 'Pawlo Freire', 'Rua Pedagogia, 222', '55667788990', 'pawlofreire@abrigo.com'),
(1009, 'Cãopanheiros', 'Rua dos Bobos, 0', '66778899001', 'caopanheiros@abrigo.com'),
(1010, 'Aubrigo', 'Av. Trocadilho Ruim, 444', '77889900112', 'aubrigo@abrigo.com');


INSERT INTO Adotante (CPF, Nome_Adotante, Email_Adotante, Data_Nascimento, Endereco_Adotante) VALUES
('11111111111', 'Yuji Itadori', 'itadoti@gmail.com', '2003-03-20', 'Rua Jujustsu, 12'),
('22222222222', 'Paul Atreides', 'atreides@gmail.com', '1985-02-02', 'Rua Duna, 45'),
('33333333333', 'Saul Goodman', 'betercall@gmail.com', '1960-11-12', 'Rua Walter Blanco, 78'),
('44444444444', 'Johnny Silverhand', 'silver@gmail.com', '1988-11-16', 'Rua Arasaka, 10'),
('55555555555', 'Rodion Românovitch Raskólnikov', 'Rodion@gmail.com', '1865-05-05', 'Rua Dostoiévski, 20'),
('66666666666', 'Guilerme Faria', 'gulherme@gmail.com', '1991-06-06', 'Rua F, 30'),
('77777777777', 'Ana Flávia', 'ana@gmail.com', '1987-07-07', 'Rua G, 40'),
('88888888888', 'João Pedro', 'joao@gmail.com', '1993-08-08', 'Rua H, 50'),
('99999999999', 'Pedro Cruz', 'pedro@gmail.com', '1989-09-09', 'Rua I, 60'),
('00000000000', 'Victor Lara', 'victor@gmail.com', '1994-10-10', 'Rua J, 70');


INSERT INTO Animal (ID_Animal, Nome_Animal, Vacinas, Descricao, Sexo, Idade, Raca, CNPJ_Abrigo, Cod_Especie) VALUES
(1, 'Krypto', 'Raiva, V8', 'Cachorro amigável e enérgico.', 'Macho', 2, 'Kryptoniano', 1001, 1),
(2, 'muhammad sumbul', 'Nenhuma', 'Gato preparado para as cruzadas.', 'Macho', 1, 'Persa', 1002, 2),
(3, 'Rufus', 'Todas', 'Cachorro ativo, ótimo com crianças, muito carinhoso.', 'Macho', 4, 'Husky', 1009, 1),
(4, 'Stray', 'Tríplice Felina', 'Gata carinhosa e sociável.', 'Fêmea', 3, 'Sem raça definida', 1004, 2),
(5, 'Magrelinho', 'Raiva', 'Adora brincar ao ar livre e fingir de morto.', 'Macho', 5, 'Pinscher', 1005, 1),
(6, 'Bills', 'Todas', 'Muito destrutivo, complexo de Deus.', 'Macho', 6,'Sphynx', 1006, 2),
(7, 'Scooby', 'Todas', 'Adora biscoitos scooby e se aventurar com sua turma, um pouco medroso.', 'Macho', 2,'Dog Alemão',1007, 1),
(8, 'Batatinha', 'Todas', 'Ótima companhia para idosos.', 'Fêmea', 1,'Siamês', 1008, 2),
(9, 'Felipe Kauan', 'V10', 'Adora jogar bolinha e dormir.', 'Macho', 3,'Golden Retriver', 1003, 1),
(10, 'Vovó Turbo', 'Todas', 'Adora brincar com bolinhas e pegar passarinhos.', 'Fêmea', 4,'Vira-Lata', 1010, 2);


INSERT INTO Adocao (ID_Adocao, Data_Adocao, CNPJ_Abrigo, CPF_Adotante, ID_Animal) VALUES
(1, '2025-01-01', 1001, '11111111111', 1),
(2, '2025-01-02', 1002, '22222222222', 2),
(3, '2025-01-03', 1003, '33333333333', 3),
(4, '2077-01-04', 1004, '44444444444', 4),
(5, '2025-01-05', 1005, '55555555555', 5),
(6, '2001-09-11', 1006, '66666666666', 6),
(7, '2025-01-07', 1007, '77777777777', 7),
(8, '2025-01-08', 1008, '88888888888', 8),
(9, '2025-01-09', 1009, '99999999999', 9),
(10, '2025-01-10', 1010, '00000000000', 10);


INSERT INTO Telefone_Abrigo (Telefone_Abrigo, CNPJ_Abrigo) VALUES
('1111-1111', 1001),
('2222-2222', 1002),
('3333-3333', 1003),
('4444-4444', 1004),
('5555-5555', 1005),
('6666-6666', 1006),
('7777-7777', 1007),
('8888-8888', 1008),
('9999-9999', 1009),
('0000-0000', 1010);


INSERT INTO Telefone_Adotante (Telefone_Adotante, CPF_Adotante) VALUES
('99999-1111', '11111111111'),
('99999-2222', '22222222222'),
('99999-3333', '33333333333'),
('99999-4444', '44444444444'),
('99999-5555', '55555555555'),
('99999-6666', '66666666666'),
('99999-7777', '77777777777'),
('99999-8888', '88888888888'),
('99999-9999', '99999999999'),
('99999-0000', '00000000000');

INSERT INTO Fotos (URL_Fotos_Animal, ID_Animal) VALUES
('https://imgur.com/gallery/krypto-NlRtnWR', 1),
('https://imgur.com/gallery/muhammad-sumbul-9t9dVoJ', 2),
('https://imgur.com/gallery/moment-when-he-figured-out-we-were-going-to-vet-not-dog-park-DZqeyOO', 3),
('https://imgur.com/gallery/gavin-takes-old-man-nap-sun-Fxv7e9E', 4),
('https://imgur.com/gallery/upvote-rescue-galgo-CAxakid', 5),
('https://imgur.com/gallery/elf-sphynx-kittens-first-time-being-outside-while-seeing-birds-sound-on-M3wrYiZ', 6),
('https://imgur.com/gallery/great-dane-is-turning-8-october-hes-most-majestic-dog-i-know-MJs2reO', 7),
('https://imgur.com/gallery/we-are-siamese-if-you-please-xlTRA', 8),
('https://imgur.com/gallery/ha-ha-ha-ha-6Xvoq71', 10),
('https://imgur.com/gallery/pound-r2hX0Kx', 8),
('https://imgur.com/gallery/im-18-624-points-from-glorious-so-heres-picture-of-dog-with-two-his-mouth-XgbZdeA', 9),
('https://imgur.com/gallery/golden-snoot-to-brighten-day-ZscgV5Y', 9),
('https://imgur.com/gallery/10-husky-photos-3U1Uo', 3);

-- QUERY database

SELECT 
  Animal.Nome_Animal, 
  Animal.Descricao, 
  Animal.Sexo, 
  Animal.Idade, 
  Especie.Cuidados, 
  Abrigo.Nome_Abrigo,
  Fotos.URL_Fotos_Animal
FROM Animal 
JOIN Fotos ON Animal.ID_Animal = Fotos.ID_Animal
JOIN Especie ON Animal.Cod_Especie = Especie.Cod_Especie
JOIN Abrigo ON Animal.CNPJ_Abrigo = Abrigo.CNPJ;