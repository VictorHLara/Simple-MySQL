
-- Um possível adotante entra no sistema e resolve verificar as princiapais informações de todos os animais que estão disponíveis para a adoção .

	SELECT 
	    Animal.Nome_Animal, 
	    Animal.Descricao, 
	    Animal.Sexo, 
	    Animal.Idade, 
	    Especie.Cuidados, 
	    Abrigo.Nome_Abrigo 
	FROM Animal
	INNER JOIN Especie ON Animal.Cod_Especie = Especie.Cod_Especie
	INNER JOIN Abrigo ON Animal.CNPJ_Abrigo = Abrigo.CNPJ;

-- O gerenciador do sistema resolve verificar as informações dos abrigos cadastrados no sistema.
	
	SELECT * 
	FROM Abrigo;

-- Um adotante resolve ver o animal que irá adotar pessoalmente, por isso ele precisa ir até o abrigo que possui o animal de Id 4, ele precisa saber o endereço do abrigo e o nome.

	SELECT 
	    Abrigo.Nome_Abrigo, 
	    Abrigo.Endereco_Abrigo 
	FROM Abrigo
	INNER JOIN Animal ON Abrigo.CNPJ = Animal.CNPJ_Abrigo
	WHERE Animal.ID_Animal = 4;

-- Um abrigo afirma que consegue levar o animal adotado pelo adotante 3 em sua casa, por isso o abrigo verifica no sistema o seu endereço e confere seu nome.

	SELECT 
	    Adotante.Nome_Adotante, 
	    Adotante.Endereco_Adotante 
	FROM Adotante
	JOIN Adocao ON Adotante.CPF = Adocao.CPF_Adotante
	WHERE Adocao.ID_Adocao = 3;

-- Um adotante possui alergia a gatos, por isso gostaria de consultar apenas os animais da espécie cachorro que estão disponíveis e seus abrigos.

	SELECT 
	    Animal.Nome_Animal, 
	    Animal.Descricao, 
	    Animal.raca, 
	    Abrigo.Nome_Abrigo 
	FROM Animal
	JOIN Especie ON Animal.Cod_Especie = Especie.Cod_Especie
	JOIN Abrigo ON Animal.CNPJ_Abrigo = Abrigo.CNPJ
	WHERE Especie.Cod_Especie = 1;

-- Um adotante está procurando por um animal, ele não se importa muito com espécie, contanto que o animal seja carinhoso.

	SELECT 
	    Animal.Nome_Animal, 
	    Animal.Descricao, 
		Animal.raca,
		Abrigo.Nome_Abrigo 
	FROM Animal
	JOIN Abrigo ON Animal.CNPJ_Abrigo = Abrigo.CNPJ
	WHERE Animal.Descricao LIKE '%carinhos%';

-- O gerente do sitema resolve verificar quantas adoções foram concluídas até o momento.
	
	SELECT COUNT(*) 
	FROM Adocao;


-- Um adotante quer adotar um gato e por isso se pergunta quais são os cuidados específicos que esta espécie possui, então ele consulta o sistema.

	SELECT Cuidados 
	FROM Especie
	WHERE Cod_Especie = 2;
	
-- Um adotante resolve conferir se há algum animal disponível para adoção que seja da raça Border Collie
	
	SELECT 
    Animal.Nome_Animal, 
    Animal.Descricao,
    Animal.raca,
    Abrigo.Nome_Abrigo 
	FROM Animal
	JOIN Abrigo ON Animal.CNPJ_Abrigo = Abrigo.CNPJ
	WHERE Animal.Raca = 'Border Collie';
	
-- O gerente do sistema resolve verificar se há algum adotante cadastrado que não possui número de telefone, para procurar possíveis falhas.

	SELECT 
	    Adotante.Nome_Adotante, 
	    Adotante.CPF,
	    Telefone_Adotante.Telefone_Adotante 
	FROM Adotante
	JOIN Telefone_Adotante ON Adotante.CPF = Telefone_Adotante.CPF_Adotante
	WHERE Telefone_Adotante.Telefone_Adotante IS NULL;
	
-- No meio da adoção de Id 5 ocorreu um problema, então o abrigo resolve ligar para o adotante ou mandar um e-mail para que possam tratar do assunto, então ele consulta o sistema.

	SELECT 
    	Adotante.Nome_Adotante, 
    	Adotante.Email_Adotante, 
    	Telefone_Adotante.Telefone_Adotante 
	FROM Adotante
	JOIN Adocao ON Adotante.CPF = Adocao.CPF_Adotante
	JOIN Telefone_Adotante ON Adotante.CPF = Telefone_Adotante.CPF_Adotante
	WHERE Adocao.ID_Adocao = 5;
	
-- A adoção de Id 8 não foi muito pacífica, o adotante envolvido nela resolve denunciar o abrigo, para isso ele precisa do nome, CNPJ  e do CPF do gerente.
	
	SELECT 
    	Abrigo.Nome_Abrigo, 
    	Abrigo.CNPJ, 
    	Abrigo.CPF_Gerente 
	FROM Abrigo
	JOIN Adocao ON Abrigo.CNPJ = Adocao.CNPJ_Abrigo
	WHERE Adocao.ID_Adocao = 8;
	
-- O gerente do sistema percebe que a adoção de Id 7 foi afetada por uma falha de segurança, então ele resolve ligar ou mandar um e-mail para as entidades envolvidas na adoção para avisá-los.
	
	SELECT  
	    Adotante.Nome_Adotante, 
	    Adotante.Email_Adotante,
	    Abrigo.Nome_Abrigo,
	    Abrigo.Email_Abrigo,
	    Animal.Nome_Animal 
	FROM Adocao
	JOIN Adotante ON Adocao.CPF_Adotante = Adotante.CPF
	JOIN Abrigo ON Adocao.CNPJ_Abrigo = Abrigo.CNPJ
	JOIN Animal ON Adocao.ID_Animal = Animal.ID_Animal
	WHERE Adocao.ID_Adocao = 7;
	
-- Um adotante gostou da descrição do cachorro de id 3, por isso ele resolve ver suas fotos
	
	SELECT 
	    Fotos.URL_Fotos_Animal
	FROM 
	    Fotos
	WHERE 
	    Fotos.ID_Animal = 3;

	
	
	
	
	
	
	
	
	
