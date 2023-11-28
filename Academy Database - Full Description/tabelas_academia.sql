-- CRIAR BANCO DE DADOS
Create database academia_saude_on;

-- SELECIONAR O BANCO DESEJADO
Use academia_saude_on;

-- CRIAR TABELAS
-- PRIMEIRA TABELA: CLIENTES
Create table clientes(
	id INT PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	sobrenome VARCHAR(20) NOT NULL,
	cpf VARCHAR(12) NOT NULL,
	whatsapp VARCHAR(13) NOT NULL,	
	data_matricula DATE NOT NULL,
	cod_matricula VARCHAR(10) UNIQUE NOT NULL,
	profissional_responsavel INT NOT NULL,
	id_saude INT NOT NULL,
	turno_treino VARCHAR(10) NOT NULL,
	plano_assinatura INT NOT NULL DEFAULT 1,
	foreign key(id_saude) references status_saude(id)
);

-- SEGUNDA TABELA: FUNCIONÁRIOS
create table funcionarios(
	id INT PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	sobrenome VARCHAR(20) NOT NULL,
	cpf VARCHAR(12) UNIQUE NOT NULL,
	matricula INT NOT NULL,
	data_contratacao DATE NOT NULL,
	cargo VARCHAR(20) NOT NULL
);

-- TERCEIRA TABELA: PLANOS DA ACADEMIA
create table planos(
	id INT PRIMARY KEY,
	nome_plano VARCHAR(20) NOT NULL,
	valor DECIMAL(5,2) NOT NULL,
	descricao TEXT 
);

-- QUARTA TABELA: PRODUTOS
create table produtos(
	id INT PRIMARY KEY,
	nome_produto VARCHAR(50) NOT NULL,
	codigo VARCHAR(10) UNIQUE NOT NULL,
	tipo VARCHAR(20) NOT NULL,
	valor DECIMAL(5,2)
);

-- QUINTA TABELA: SERVIÇOS
create table servicos(
	id INT PRIMARY KEY,
	nome_servico VARCHAR(50) NOT NULL,
	codigo VARCHAR(10) UNIQUE NOT NULL,
	valor DECIMAL(5,2)
);


-- SEXTA TABELA: Pagamentos das matrículas
create table pagamentos(
    id INT PRIMARY KEY,
    data_pagamento date NOT NULL,
    qtd INT NOT NULL,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    id_servico INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id),
    FOREIGN KEY (id_servico) REFERENCES servicos(id)
);

-- SÉTIMA TABELA: STATUS DE SAÚDE (TABELA QUE IRÁ ASSOCIAR OS PROBLEMAS DE SAÚDES DOS CLIENTES)
create table status_saude(
	id INT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	tipo_doenca VARCHAR(20) NOT NULL,
	codigo_doenca VARCHAR(10) UNIQUE NOT NULL,
	saude INT NOT NULL,
	profissional_responsavel INT NOT NULL
);