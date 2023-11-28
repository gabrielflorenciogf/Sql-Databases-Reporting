-- Criar banco de dados RH
Create database rh_company;

-- Ativar o banco - Caso o banco não seja padrão
Use rh_company;

-- Criar as tabelas desejadas
-- Tabela de funcionários,benefícios, folha de pagamento, recrutamento, rotatividade e avaliação de desempenho

Create table Filiais(
	FilialId INT PRIMARY KEY,
	NomeFilial VARCHAR(30),
	Estado VARCHAR(35),
	UF CHAR(2),
	Endereco VARCHAR(150)
);

-- Criar tabelas 
Create table Setores(
	SetoresId INT PRIMARY KEY,
	NomeSetor VARCHAR(30)
);

-- Criar tabela de benefícios
CREATE TABLE Beneficios (
    BeneficioID INT PRIMARY KEY,
    NomeBeneficio VARCHAR(50),
    Valor DECIMAL(10, 2),
    Desconto Varchar(4)
);

-- Criar tabela de funcionários
CREATE TABLE Funcionarios (
    FuncionarioID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Sobrenome VARCHAR(100),
    Cargo VARCHAR(50),
    Matricula VARCHAR(20),
    DataAdmissao DATE,
    DataNascimento DATE,
    IdFilial INT,
    FuncionarioAtivo BOOLEAN,
    Beneficio1 INT DEFAULT 1,
    Beneficio2 INT DEFAULT 1,
    Beneficio3 INT DEFAULT 1,
    FOREIGN KEY (Beneficio1) REFERENCES Beneficios(BeneficioID),
    FOREIGN KEY (Beneficio2) REFERENCES Beneficios(BeneficioID),
    FOREIGN KEY (Beneficio3) REFERENCES Beneficios(BeneficioID)
);

-- Criar tabela de Folha de pagamento
CREATE TABLE FolhaPagamento (
    FolhaPagamentoID INT PRIMARY KEY,
    MesAnoReferencia DATE,
    FuncionarioID INT,
    Salario DECIMAL(10,2),
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionarios(FuncionarioID)
);

-- Criar tabela de Recrutamentos
CREATE TABLE Admissoes(
    AdmissoesId INT PRIMARY KEY,
    DataRecrutamento DATE,
	StatusSelecao BOOLEAN,
    Nome VARCHAR(100),
    Sobrenome VARCHAR(100),
    Cargo VARCHAR(50),
    Matricula VARCHAR(20),
    DataAdmissao DATE,
    DataNascimento DATE,
    IdFilial INT,
    FuncionarioAtivo BOOLEAN,
    Beneficio1 INT DEFAULT 1,
    Beneficio2 INT DEFAULT 1,
    Beneficio3 INT DEFAULT 1,
    FOREIGN KEY (Beneficio1) REFERENCES Beneficios(BeneficioID),
    FOREIGN KEY (Beneficio2) REFERENCES Beneficios(BeneficioID),
    FOREIGN KEY (Beneficio3) REFERENCES Beneficios(BeneficioID)
);

-- Criar tabela de Rotatividade
CREATE TABLE Demissoes(
    DemissoesID INT PRIMARY KEY,
    FuncionarioID INT,
    MotivoDemissao VARCHAR(50),
    DataDemissao DATE,
    FOREIGN KEY(FuncionarioID) REFERENCES Funcionarios(FuncionarioID)
);

-- Criar tabela de Avaliação de Desempenho
CREATE TABLE AvaliacaoDesempenho(
	DesempenhoID INT PRIMARY KEY,
	IdFuncionario INT NOT NULL,
	NotaAv DECIMAL(10,2),
	Observacao TEXT,
	FOREIGN KEY (IdFuncionario) REFERENCES Funcionarios (FuncionarioID)
);