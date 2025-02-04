REM   Script: Entrega 3
REM   AV3 GDI

CREATE TABLE Entregador ( 
    CPF CHAR(11) PRIMARY KEY, 
    DataDeNascimento DATE NOT NULL, 
    Nome VARCHAR(100) NOT NULL 
);

INSERT INTO Entregador (CPF, DataDeNascimento, Nome)  
VALUES ('34567890123', TO_DATE('1995-09-30', 'YYYY-MM-DD'), 'Carlos Lima');

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

INSERT INTO Consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) 
VALUES ('76543210987', TO_DATE('1995-09-30', 'YYYY-MM-DD'), 'Julia Almeida', '52000000', 'Rua 3', 789, 'Recife', 'Apto 3');

CREATE TABLE Fornecedor ( 
    CNPJ CHAR(14) PRIMARY KEY, 
    Nome VARCHAR(100) NOT NULL, 
    CEP CHAR(8), 
    Rua VARCHAR(100), 
    Numero INT, 
    Cidade VARCHAR(50), 
    Complemento VARCHAR(50) 
);

INSERT INTO Fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) 
VALUES ('34567890000122', 'Padaria Pão Quente', '52000000', 'Rua C', 30, 'Recife', '');

INSERT INTO Fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) 
VALUES ('23456789000111', 'Padaria Pão Quente', '52000000', 'Rua C', 30, 'Recife', '');

CREATE TABLE Supermercado ( 
    CNPJ_Forn CHAR(14), 
    FOREIGN KEY (CNPJ_Forn) REFERENCES Fornecedor(CNPJ) 
);

INSERT INTO Supermercado (CNPJ_Forn) 
VALUES ('34567890000122');

CREATE TABLE Restaurante ( 
    CNPJ_Forn CHAR(14), 
    Categoria VARCHAR(50), 
    FOREIGN KEY (CNPJ_Forn) REFERENCES Fornecedor(CNPJ) 
);

INSERT INTO Restaurante (CNPJ_Forn, Categoria) 
VALUES ('23456789000111', 'Comida Brasileira');

CREATE TABLE Produto ( 
    IdProduto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    Nome VARCHAR(100) NOT NULL 
);

INSERT INTO Produto (Nome) VALUES ('Pizza Margherita');

INSERT INTO Produto (Nome) VALUES ('Pizza Calabresa');

CREATE TABLE ProdutoOfertado ( 
    IdProduto INT, 
    CNPJ_Forn CHAR(14), 
    Preco DECIMAL(10, 2), 
    PRIMARY KEY (IdProduto, CNPJ_Forn), 
    FOREIGN KEY (IdProduto) REFERENCES Produto(IdProduto), 
    FOREIGN KEY (CNPJ_Forn) REFERENCES Fornecedor(CNPJ) 
);

INSERT INTO ProdutoOfertado (IdProduto, CNPJ_Forn, Preco) VALUES (1, '23456789000111', 25.00);

CREATE TABLE Desconto ( 
    CNPJ_Desconto CHAR(14), 
    Data DATE, 
    Porcentagem DECIMAL(5, 2), 
    PRIMARY KEY (CNPJ_Desconto, Data), 
    FOREIGN KEY (CNPJ_Desconto) REFERENCES Fornecedor(CNPJ) 
);

INSERT INTO Desconto (CNPJ_Desconto, Data, Porcentagem) 
VALUES ('23456789000111', TO_DATE('2025-02-02', 'YYYY-MM-DD'), 15.00);

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

INSERT INTO Pedido (ValorTotal, Data, HoraDaEntrega, CPF_Entregador, CPF, CNPJ) 
VALUES (75.00, TO_DATE('2025-02-01', 'YYYY-MM-DD'),  
    TO_TIMESTAMP('2025-02-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34567890123',  
    '76543210987',  
    '23456789000111' 
);

CREATE TABLE Contem ( 
    IdPedido INT, 
    IdProduto INT, 
    IdFornecedor CHAR(14), 
    PRIMARY KEY (IdPedido, IdProduto, IdFornecedor), 
    FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido), 
    FOREIGN KEY (IdProduto, IdFornecedor)  
        REFERENCES ProdutoOfertado(IdProduto, CNPJ_Forn) 
);

INSERT INTO Contem (IdPedido, IdProduto, IdFornecedor) 
VALUES (1, 1, '34567890000122');  -- Pedido 2, Pizza Margherita 
 
;

INSERT INTO Contem (IdPedido, IdProduto, IdFornecedor) VALUES (1, 1, '34567890000122');

SELECT *  
FROM pedido;

INSERT INTO Contem (IdPedido, IdProduto, IdFornecedor) VALUES (1, 2, '34567890000122');

SELECT *  
FROM produto;

INSERT INTO Contem (IdPedido, IdProduto, IdFornecedor) VALUES (1, 2, '34567890000122');

SELECT *  
FROM fornecedor;

INSERT INTO Contem (IdPedido, IdProduto, IdFornecedor) VALUES (1, 2, '34567890000122');

CREATE TABLE Entregador ( 
    CPF CHAR(11) PRIMARY KEY, 
    DataDeNascimento DATE NOT NULL, 
    Nome VARCHAR(100) NOT NULL 
);

INSERT INTO Entregador (CPF, DataDeNascimento, Nome)  
VALUES ('34567890123', TO_DATE('1995-09-30', 'YYYY-MM-DD'), 'Carlos Lima');

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

INSERT INTO Consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) 
VALUES ('76543210987', TO_DATE('1995-09-30', 'YYYY-MM-DD'), 'Julia Almeida', '52000000', 'Rua 3', 789, 'Recife', 'Apto 3');

CREATE TABLE Fornecedor ( 
    CNPJ CHAR(14) PRIMARY KEY, 
    Nome VARCHAR(100) NOT NULL, 
    CEP CHAR(8), 
    Rua VARCHAR(100), 
    Numero INT, 
    Cidade VARCHAR(50), 
    Complemento VARCHAR(50) 
);

INSERT INTO Fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) 
VALUES ('34567890000122', 'Padaria Pão Quente', '52000000', 'Rua C', 30, 'Recife', '');

INSERT INTO Fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) 
VALUES ('23456789000111', 'Padaria Pão Quente', '52000000', 'Rua C', 30, 'Recife', '');

CREATE TABLE Supermercado ( 
    CNPJ_Forn CHAR(14), 
    FOREIGN KEY (CNPJ_Forn) REFERENCES Fornecedor(CNPJ) 
);

INSERT INTO Supermercado (CNPJ_Forn) 
VALUES ('34567890000122');

CREATE TABLE Restaurante ( 
    CNPJ_Forn CHAR(14), 
    Categoria VARCHAR(50), 
    FOREIGN KEY (CNPJ_Forn) REFERENCES Fornecedor(CNPJ) 
);

INSERT INTO Restaurante (CNPJ_Forn, Categoria) 
VALUES ('23456789000111', 'Comida Brasileira');

CREATE TABLE Produto ( 
    IdProduto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    Nome VARCHAR(100) NOT NULL 
);

INSERT INTO Produto (Nome) VALUES ('Pizza Margherita');

INSERT INTO Produto (Nome) VALUES ('Pizza Calabresa');

CREATE TABLE ProdutoOfertado ( 
    IdProduto INT, 
    CNPJ_Forn CHAR(14), 
    Preco DECIMAL(10, 2), 
    PRIMARY KEY (IdProduto, CNPJ_Forn), 
    FOREIGN KEY (IdProduto) REFERENCES Produto(IdProduto), 
    FOREIGN KEY (CNPJ_Forn) REFERENCES Fornecedor(CNPJ) 
);

INSERT INTO ProdutoOfertado (IdProduto, CNPJ_Forn, Preco) VALUES (1, '23456789000111', 25.00);

CREATE TABLE Desconto ( 
    CNPJ_Desconto CHAR(14), 
    Data DATE, 
    Porcentagem DECIMAL(5, 2), 
    PRIMARY KEY (CNPJ_Desconto, Data), 
    FOREIGN KEY (CNPJ_Desconto) REFERENCES Fornecedor(CNPJ) 
);

INSERT INTO Desconto (CNPJ_Desconto, Data, Porcentagem) 
VALUES ('23456789000111', TO_DATE('2025-02-02', 'YYYY-MM-DD'), 15.00);

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

INSERT INTO Pedido (ValorTotal, Data, HoraDaEntrega, CPF_Entregador, CPF, CNPJ) 
VALUES (75.00, TO_DATE('2025-02-01', 'YYYY-MM-DD'),  
    TO_TIMESTAMP('2025-02-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), '34567890123',  
    '76543210987',  
    '23456789000111' 
);

CREATE TABLE Contem ( 
    IdPedido INT, 
    IdProduto INT, 
    IdFornecedor CHAR(14), 
    PRIMARY KEY (IdPedido, IdProduto, IdFornecedor), 
    FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido), 
    FOREIGN KEY (IdProduto, IdFornecedor)  
        REFERENCES ProdutoOfertado(IdProduto, CNPJ_Forn) 
);

SELECT *  
FROM fornecedor 
-- Povoamento da tabela Contém 
INSERT INTO Contem (IdPedido, IdProduto, IdFornecedor) VALUES (1, 2, '23456789000111');

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

INSERT INTO Contem (IdPedido, IdProduto, IdFornecedor) VALUES (1, 2, '23456789000111');

SELECT *  
FROM fornecedor;

SELECT *  
FROM pedido;

SELECT *  
FROM contem;

SELECT * FROM ProdutoOfertado WHERE IdProduto = 2 AND CNPJ_Forn = '23456789000111';

SELECT * FROM ProdutoOfertado;

INSERT INTO ProdutoOfertado (IdProduto, CNPJ_Forn, Preco)  
VALUES (2, '23456789000111', 30.00);

INSERT INTO Contem (IdPedido, IdProduto, IdFornecedor) VALUES (1, 2, '23456789000111');

INSERT INTO TelefoneFornecedor (Telefone_Fornecedor, Fornecedor_CNPJ) VALUES ('8133330003', '34567890000122');

INSERT INTO Componente (CodigoComponente, CodigoComposto) 
VALUES (1, 2);  -- Pão Francês faz parte de Refrigerante (exemplo de combinação) 
;

INSERT INTO Componente (CodigoComponente, CodigoComposto) VALUES (1, 2);

INSERT INTO TelefoneEntregador (Telefone_Entregador, Entregador_CPF) VALUES ('81999990003', '34567890123');

INSERT INTO TelefoneConsumidor (Telefone_Consumidor, Consumidor_CPF) VALUES ('81988880003', '76543210987');

INSERT INTO TelefoneFornecedor (Telefone_Fornecedor, Fornecedor_CNPJ) VALUES ('8133330003', '34567890000122');

INSERT INTO TelefoneFornecedor (Telefone_Fornecedor, Fornecedor_CNPJ) VALUES ('8133330003', '34567890000122');

INSERT INTO TelefoneFornecedor (Telefone_Fornecedor, Fornecedor_CNPJ) VALUES ('81988880004', '34567890000122');

