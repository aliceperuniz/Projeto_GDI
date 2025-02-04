REM   Script: Entrega 3
REM   AV3 GDI

DROP TABLE Entregador;
DROP TABLE Consumidor;
DROP TABLE Fornecedor;
DROP TABLE Supermercado;
DROP TABLE Restaurante;
DROP TABLE Produto;
DROP TABLE ProdutoOfertado;
DROP TABLE Desconto;
DROP TABLE Pedido;
DROP TABLE Contem;
DROP TABLE Componente;
DROP TABLE TelefoneEntregador;
DROP TABLE TelefoneConsumidor;
DROP TABLE TelefoneFornecedor;

CREATE TABLE Entregador ( 
    CPF CHAR(11) PRIMARY KEY, 
    DataDeNascimento DATE NOT NULL, 
    Nome VARCHAR(100) NOT NULL 
);

CREATE TABLE Consumidor ( 
    CPF CHAR(11) PRIMARY KEY, 
    DataDeNascimento DATE NOT NULL, 
    Nome VARCHAR(100) NOT NULL, 
    CEP CHAR(8), 
    Rua VARCHAR(100), 
    Numero INT, 
    Cidade VARCHAR(50), 
    Complemento VARCHAR(50) 
);

CREATE TABLE Fornecedor ( 
    CNPJ CHAR(14) PRIMARY KEY, 
    Nome VARCHAR(100) NOT NULL, 
    CEP CHAR(8), 
    Rua VARCHAR(100), 
    Numero INT, 
    Cidade VARCHAR(50), 
    Complemento VARCHAR(50) 
);

CREATE TABLE Supermercado ( 
    CNPJ_Forn CHAR(14), 
    FOREIGN KEY (CNPJ_Forn) REFERENCES Fornecedor(CNPJ) 
);

CREATE TABLE Restaurante ( 
    CNPJ_Forn CHAR(14), 
    Categoria VARCHAR(50), 
    FOREIGN KEY (CNPJ_Forn) REFERENCES Fornecedor(CNPJ) 
);

CREATE TABLE Produto ( 
    IdProduto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    Nome VARCHAR(100) NOT NULL 
);

CREATE TABLE ProdutoOfertado ( 
    IdProduto INT, 
    CNPJ_Forn CHAR(14), 
    Preco DECIMAL(10, 2), 
    PRIMARY KEY (IdProduto, CNPJ_Forn), 
    FOREIGN KEY (IdProduto) REFERENCES Produto(IdProduto), 
    FOREIGN KEY (CNPJ_Forn) REFERENCES Fornecedor(CNPJ) 
);

CREATE TABLE Desconto ( 
    CNPJ_Desconto CHAR(14), 
    Data DATE, 
    Porcentagem DECIMAL(5, 2), 
    PRIMARY KEY (CNPJ_Desconto, Data), 
    FOREIGN KEY (CNPJ_Desconto) REFERENCES Fornecedor(CNPJ) 
);

CREATE TABLE Pedido ( 
    IdPedido INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    ValorTotal DECIMAL(10, 2) NOT NULL, 
    Data DATE NOT NULL, 
    HoraDaEntrega TIMESTAMP, 
    CPF_Entregador CHAR(11), 
    CPF CHAR(11), 
    CNPJ CHAR(14), 
    FOREIGN KEY (CPF_Entregador) REFERENCES Entregador(CPF), 
    FOREIGN KEY (CPF) REFERENCES Consumidor(CPF), 
    FOREIGN KEY (CNPJ) REFERENCES Fornecedor(CNPJ) 
);

CREATE TABLE Contem ( 
    IdPedido INT NOT NULL, 
    IdProduto INT NOT NULL, 
    IdFornecedor CHAR(14) NOT NULL, 
    PRIMARY KEY (IdPedido, IdProduto, IdFornecedor), 
    FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido), 
    CONSTRAINT FK_ProdutoOfertado FOREIGN KEY (IdProduto, IdFornecedor)  
        REFERENCES ProdutoOfertado(IdProduto, CNPJ_Forn) 
);

CREATE TABLE Componente ( 
    CodigoComponente INT, 
    CodigoComposto INT, 
    PRIMARY KEY (CodigoComponente, CodigoComposto), 
    FOREIGN KEY (CodigoComponente) REFERENCES Produto(IdProduto), 
    FOREIGN KEY (CodigoComposto) REFERENCES Produto(IdProduto) 
);

CREATE TABLE TelefoneEntregador ( 
    Telefone_Entregador CHAR(15), 
    Entregador_CPF CHAR(11), 
    PRIMARY KEY (Telefone_Entregador), 
    FOREIGN KEY (Entregador_CPF) REFERENCES Entregador(CPF) 
);

CREATE TABLE TelefoneConsumidor ( 
    Telefone_Consumidor CHAR(15), 
    Consumidor_CPF CHAR(11), 
    PRIMARY KEY (Telefone_Consumidor), 
    FOREIGN KEY (Consumidor_CPF) REFERENCES Consumidor(CPF) 
);

CREATE TABLE TelefoneFornecedor ( 
    Telefone_Fornecedor CHAR(15), 
    Fornecedor_CNPJ CHAR(14), 
    PRIMARY KEY (Telefone_Fornecedor), 
    FOREIGN KEY (Fornecedor_CNPJ) REFERENCES Fornecedor(CNPJ) 
);

