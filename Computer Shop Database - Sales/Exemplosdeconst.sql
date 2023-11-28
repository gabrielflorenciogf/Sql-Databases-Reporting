	-- Primary Key (Chave Primária)
	CREATE TABLE Clientes (
		IDCliente INT PRIMARY KEY,
		Nome VARCHAR(50)
	);

	-- Foreign Key (Chave Estrangeira)
	CREATE TABLE Pedidos (
		IDPedido INT PRIMARY KEY,
		IDCliente INT,
		Produto VARCHAR(50),
		FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente)
	);

	-- Unique Constraint - Unicidade
	-- Not Null - Não Nulo
	CREATE TABLE Produtos (
		IDProduto INT PRIMARY KEY,
		Nome VARCHAR(50)NOT NULL,
		Cpf Varchar(11) UNIQUE,
		CodigoProduto VARCHAR(10) UNIQUE
	);

	-- Not Null Constraint - Não Nulo
	CREATE TABLE Funcionarios (
		IDFuncionario INT PRIMARY KEY,
		Nome VARCHAR(50) NOT NULL,
		Cargo VARCHAR(50) NOT NULL
	);

	-- Default Constraint - Padrão 
	CREATE TABLE Produtos (
		IDProduto INT PRIMARY KEY,
		Nome VARCHAR(50),
		Quantidade INT DEFAULT 0
	);
	
	