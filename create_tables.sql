REM   Script: create table
REM   av3

DROP TABLE Contem;
DROP TABLE Componente;
DROP TABLE TelefoneEntregador;
DROP TABLE TelefoneConsumidor;
DROP TABLE TelefoneFornecedor;
DROP TABLE Pedido;
DROP TABLE Desconto;
DROP TABLE ProdutoOfertado;
DROP TABLE Produto;
DROP TABLE Restaurante;
DROP TABLE Supermercado;
DROP TABLE Fornecedor;
DROP TABLE Consumidor;
DROP TABLE Entregador;
DROP SEQUENCE seq_pedido;

CREATE TABLE Entregador (  
    CPF CHAR(11),  
    DataDeNascimento DATE NOT NULL,  
    Nome VARCHAR(100) NOT NULL, 
    CONSTRAINT PK_Entregador PRIMARY KEY (CPF) 
);

CREATE TABLE Consumidor (  
    CPF CHAR(11),  
    DataDeNascimento DATE NOT NULL,  
    Nome VARCHAR(100) NOT NULL,  
    CEP CHAR(8),  
    Rua VARCHAR(100),  
    Numero INT,  
    Cidade VARCHAR(50),  
    Complemento VARCHAR(50), 
    CONSTRAINT PK_Consumidor PRIMARY KEY (CPF) 
);

CREATE TABLE Fornecedor (  
    CNPJ CHAR(14),  
    Nome VARCHAR(100) NOT NULL,  
    CEP CHAR(8),  
    Rua VARCHAR(100),  
    Numero INT,  
    Cidade VARCHAR(50),  
    Complemento VARCHAR(50), 
    CONSTRAINT PK_Fornecedor PRIMARY KEY (CNPJ) 
);

CREATE TABLE Supermercado (  
    CNPJ_Forn CHAR(14), 
    CONSTRAINT PK_Supermercado PRIMARY KEY (CNPJ_Forn),
    CONSTRAINT FK_Supermercado_Fornecedor FOREIGN KEY (CNPJ_Forn) REFERENCES Fornecedor(CNPJ) 
);

CREATE TABLE Restaurante (  
    CNPJ_Forn CHAR(14),  
    Categoria VARCHAR(50), 
    CONSTRAINT PK_Restaurante PRIMARY KEY (CNPJ_Forn),
    CONSTRAINT FK_Restaurante_Fornecedor FOREIGN KEY (CNPJ_Forn) REFERENCES Fornecedor(CNPJ) 
);

CREATE TABLE Produto (  
    IdProduto INT GENERATED ALWAYS AS IDENTITY, 
    Nome VARCHAR(100) NOT NULL, 
    CONSTRAINT PK_Produto PRIMARY KEY (IdProduto) 
);

CREATE TABLE ProdutoOfertado (  
    IdProduto INT,  
    CNPJ_Forn CHAR(14),  
    Preco DECIMAL(10, 2) CHECK (Preco >= 0),  
    CONSTRAINT PK_ProdutoOfertado PRIMARY KEY (IdProduto, CNPJ_Forn), 
    CONSTRAINT FK_ProdutoOfertado_Produto FOREIGN KEY (IdProduto) REFERENCES Produto(IdProduto), 
    CONSTRAINT FK_ProdutoOfertado_Fornecedor FOREIGN KEY (CNPJ_Forn) REFERENCES Fornecedor(CNPJ) 
);

CREATE TABLE Desconto (  
    CNPJ_Desconto CHAR(14),  
    Data DATE,  
    Porcentagem DECIMAL(5, 2), 
    CONSTRAINT PK_Desconto PRIMARY KEY (CNPJ_Desconto, Data), 
    CONSTRAINT FK_Desconto_Fornecedor FOREIGN KEY (CNPJ_Desconto) REFERENCES Fornecedor(CNPJ) 
);

CREATE SEQUENCE seq_pedido START WITH 1 INCREMENT BY 1;

CREATE TABLE Pedido (  
    IdPedido INT, 
    Data DATE NOT NULL,  
    HoraDaEntrega TIMESTAMP,  
    CPF_Entregador CHAR(11),  
    CPF CHAR(11),  
    CNPJ CHAR(14), 
    CONSTRAINT PK_Pedido PRIMARY KEY (IdPedido), 
    CONSTRAINT FK_Pedido_Entregador FOREIGN KEY (CPF_Entregador) REFERENCES Entregador(CPF), 
    CONSTRAINT FK_Pedido_Consumidor FOREIGN KEY (CPF) REFERENCES Consumidor(CPF), 
    CONSTRAINT FK_Pedido_Fornecedor FOREIGN KEY (CNPJ) REFERENCES Fornecedor(CNPJ) 
);

CREATE TABLE Contem (  
    IdPedido INT NOT NULL,  
    IdProduto INT NOT NULL, 
    IdFornecedor CHAR(14) NOT NULL, 
    CONSTRAINT PK_Contem PRIMARY KEY (IdPedido, IdProduto, IdFornecedor), 
    CONSTRAINT FK_Contem_Pedido FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido), 
    CONSTRAINT FK_Contem_ProdutoOfertado FOREIGN KEY (IdProduto, IdFornecedor)   
        REFERENCES ProdutoOfertado(IdProduto, CNPJ_Forn) 
);

CREATE TABLE Componente (  
    CodigoComponente INT,  
    CodigoComposto INT, 
    CONSTRAINT PK_Componente PRIMARY KEY (CodigoComponente, CodigoComposto), 
    CONSTRAINT FK_Componente_ProdutoComponente FOREIGN KEY (CodigoComponente) REFERENCES Produto(IdProduto), 
    CONSTRAINT FK_Componente_ProdutoComposto FOREIGN KEY (CodigoComposto) REFERENCES Produto(IdProduto) 
);

CREATE TABLE TelefoneEntregador (  
    Telefone_Entregador CHAR(15),  
    Entregador_CPF CHAR(11), 
    CONSTRAINT PK_TelefoneEntregador PRIMARY KEY (Telefone_Entregador, Entregador_CPF), 
    CONSTRAINT FK_TelefoneEntregador_Entregador FOREIGN KEY (Entregador_CPF) REFERENCES Entregador(CPF) 
);

CREATE TABLE TelefoneConsumidor (  
    Telefone_Consumidor CHAR(15),  
    Consumidor_CPF CHAR(11), 
    CONSTRAINT PK_TelefoneConsumidor PRIMARY KEY (Telefone_Consumidor, Consumidor_CPF), 
    CONSTRAINT FK_TelefoneConsumidor_Consumidor FOREIGN KEY (Consumidor_CPF) REFERENCES Consumidor(CPF) 
);

CREATE TABLE TelefoneFornecedor (  
    Telefone_Fornecedor CHAR(15),  
    Fornecedor_CNPJ CHAR(14), 
    CONSTRAINT PK_TelefoneFornecedor PRIMARY KEY (Telefone_Fornecedor, Fornecedor_CNPJ), 
    CONSTRAINT FK_TelefoneFornecedor_Fornecedor FOREIGN KEY (Fornecedor_CNPJ) REFERENCES Fornecedor(CNPJ) 
);
