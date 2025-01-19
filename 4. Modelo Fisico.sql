CREATE DATABASE 8107_8116_8123_8748_8772;

-- Tabelas:

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
    URL_Fotos_Animal VARCHAR(60) NOT NULL,
    ID_Animal INT NOT NULL -- FK para Animal
);

-- Definição das chaves

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

