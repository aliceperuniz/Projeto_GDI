---------------------------------------------------------------------
-- Tipo para Telefone (com CONSTRUCTOR FUNCTION)
---------------------------------------------------------------------
CREATE OR REPLACE TYPE Telefone_t AS OBJECT (
    ddd    CHAR(2),
    numero CHAR(9),
    CONSTRUCTOR FUNCTION Telefone_t(ddd CHAR, numero CHAR) RETURN SELF AS RESULT
);
/

---------------------------------------------------------------------
-- VARRAY para armazenar um conjunto fixo de telefones (ex.: Entregador)
---------------------------------------------------------------------
CREATE OR REPLACE TYPE TelefoneVar AS VARRAY(3) OF Telefone_t;
/

---------------------------------------------------------------------
-- Nested Table para armazenar telefones (ex.: Fornecedor)
---------------------------------------------------------------------
CREATE OR REPLACE TYPE Telefone_NT AS TABLE OF Telefone_t;
/

---------------------------------------------------------------------
-- Tipo abstrato para Pessoa (NOT INSTANTIABLE)
---------------------------------------------------------------------
CREATE OR REPLACE TYPE Pessoa_t AS OBJECT (
    cpf      CHAR(11),
    nome     VARCHAR2(100),
    dataNasc DATE,
    MEMBER PROCEDURE displayInfo,
    MEMBER FUNCTION getInfo RETURN VARCHAR2,
    ORDER MEMBER FUNCTION compare(other IN Pessoa_t) RETURN INTEGER,
    MAP MEMBER FUNCTION toNumber RETURN NUMBER
) NOT INSTANTIABLE;
/

---------------------------------------------------------------------
-- Tipo Entregador, herdando de Pessoa_t e com OVERRIDING de getInfo
---------------------------------------------------------------------
CREATE OR REPLACE TYPE Entregador_t UNDER Pessoa_t (
    telefones TelefoneVar,
    OVERRIDING MEMBER FUNCTION getInfo RETURN VARCHAR2
);
/

---------------------------------------------------------------------
-- Tipo Consumidor, herdando de Pessoa_t e acrescentando atributos de endereço
---------------------------------------------------------------------
CREATE OR REPLACE TYPE Consumidor_t UNDER Pessoa_t (
    cep         CHAR(8),
    rua         VARCHAR2(100),
    numero      INT,
    cidade      VARCHAR2(50),
    complemento VARCHAR2(50)
);
/

---------------------------------------------------------------------
-- Tipo Fornecedor, com CONSTRUCTOR FUNCTION e Nested Table para telefones
---------------------------------------------------------------------
CREATE OR REPLACE TYPE Fornecedor_t AS OBJECT (
    cnpj        CHAR(14),
    nome        VARCHAR2(100),
    cep         CHAR(8),
    rua         VARCHAR2(100),
    numero      INT,
    cidade      VARCHAR2(50),
    complemento VARCHAR2(50),
    telefones   Telefone_NT,
    MEMBER PROCEDURE displayInfo,
    CONSTRUCTOR FUNCTION Fornecedor_t(
      cnpj        CHAR,
      nome        VARCHAR2,
      cep         CHAR,
      rua         VARCHAR2,
      numero      INT,
      cidade      VARCHAR2,
      complemento VARCHAR2
    ) RETURN SELF AS RESULT
);
/

---------------------------------------------------------------------
-- Tipo Produto, com ORDER e MAP MEMBER FUNCTIONS
---------------------------------------------------------------------
CREATE OR REPLACE TYPE Produto_t AS OBJECT (
    idProduto INT,
    nome      VARCHAR2(100),
    MEMBER FUNCTION getNome RETURN VARCHAR2,
    ORDER MEMBER FUNCTION compare(other IN Produto_t) RETURN INTEGER,
    MAP MEMBER FUNCTION toNumber RETURN NUMBER
);
/

---------------------------------------------------------------------
-- Tipo ProdutoOfertado, com REF para Fornecedor_t
---------------------------------------------------------------------
CREATE OR REPLACE TYPE ProdutoOfertado_t AS OBJECT (
    produto    Produto_t,
    preco      DECIMAL(10,2),
    fornecedor REF Fornecedor_t,
    MEMBER FUNCTION getPrecoComDesconto(desc DECIMAL) RETURN DECIMAL
);
/

---------------------------------------------------------------------
-- Tipo Pedido, que utiliza REF para Entregador, Consumidor e Fornecedor
---------------------------------------------------------------------
CREATE OR REPLACE TYPE Pedido_t AS OBJECT (
    idPedido    INT,
    data        DATE,
    horaEntrega TIMESTAMP,
    entregador  REF Entregador_t,
    consumidor  REF Consumidor_t,
    fornecedor  REF Fornecedor_t,
    MEMBER FUNCTION getResumo RETURN VARCHAR2
);
/
