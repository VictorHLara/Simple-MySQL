CREATE DATABASE 8107_8116_8123_8748_8772;


CREATE TABLE Abrigo (
	CNPJ INT PRIMARY KEY NOT NULL,
	Nome_Abrigo VARCHAR(45) NOT NULL,
	Endereco_Abrigo VARCHAR(45) NOT NULL,
	CPF_Gerente CHAR(11) NOT NULL,
	Email_Abrigo VARCHAR(45) NOT NULL,
);

CREATE TABLE Adocao (
	ID_Adocao INT PRIMARY KEY NOT NULL,
	Data_Adocao DATE NOT NULL,
);

CREATE TABLE Adotante (
	CPF CHAR(11) PRIMARY KEY NOT NULL,
	Nome_Adotante VARCHAR(45) NOT NULL,
	Email_Adotante VARCHAR(45) NOT NULL,
	Data_Nascimento DATE NOT NULL,
	Endereco_Adotante VARCHAR(45) NOT NULL,
);

CREATE TABLE Animal (
	ID_Animal INT PRIMARY KEY NOT NULL,
	Nome_Animal VARCHAR(45) NOT NULL,
	Vacinas VARCHAR(45) NOT NULL,
	Descricao VARCHAR(200) NOT NULL,
	Sexo VARCHAR(45) NOT NULL,
	Idade INT NOT NULL,
);

CREATE TABLE Especie (
	Cod_Especie INT PRIMARY KEY NOT NULL,
	Cuidados VARCHAR(1000),
	Raca VARCHAR(25),
);

CREATE TABLE Telefone_Abrigo (
	Telefone_Abrigo VARCHAR(45) NOT NULL,
);

CREATE TABLE Telefone_Adotante (
	Telefone_Adotante VARCHAR(45) NOT NULL,
);

CREATE TABLE Fotos (
	Fotos_Animal MEDIUMBLOB NOT NULL
);

-- chave estrangeira entre Adocao e Abrigo
ALTER TABLE Adocao ADD CONSTRAINT FK_Adocao_Abrigo
    FOREIGN KEY (CNPJ_Abrigo)
    REFERENCES Abrigo (CNPJ);

-- chave estrangeira entre Adocao e Adotante
ALTER TABLE Adocao ADD CONSTRAINT FK_Adocao_Adotante
    FOREIGN KEY (CPF_Adotante)
    REFERENCES Adotante (CPF);

-- chave estrangeira entre Adocao e Animal
ALTER TABLE Adocao ADD CONSTRAINT FK_Adocao_Animal
    FOREIGN KEY (ID_Animal)
    REFERENCES Animal (ID_Animal);

-- chave estrangeira entre Animal e Abrigo
ALTER TABLE Animal ADD CONSTRAINT FK_Animal_Abrigo
    FOREIGN KEY (CNPJ_Abrigo)
    REFERENCES Abrigo (CNPJ);

-- chave estrangeira entre Telefone_Abrigo e Abrigo
ALTER TABLE Telefone_Abrigo ADD CONSTRAINT FK_Telefone_Abrigo
    FOREIGN KEY (CNPJ_Abrigo)
    REFERENCES Abrigo (CNPJ);

-- chave estrangeira entre Telefone_Adotante e Adotante
ALTER TABLE Telefone_Adotante ADD CONSTRAINT FK_Telefone_Adotante
    FOREIGN KEY (CPF_Adotante)
    REFERENCES Adotante (CPF);

-- chave estrangeira entre Fotos e Animal
ALTER TABLE Fotos ADD CONSTRAINT FK_Foto_Animal
    FOREIGN KEY (ID_Animal)
    REFERENCES Animal (ID_Animal);





















