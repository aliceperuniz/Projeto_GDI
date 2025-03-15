CREATE OR REPLACE TYPE tp_entregador AS OBJECT (
    CPF CHAR(11),
    DataDeNascimento DATE,
    Nome VARCHAR(100)
    );
/
ALTER TYPE tp_entregador ADD ATTRIBUTE Idade NUMBER CASCADE;
/
-- desfazendo mudança

ALTER TYPE tp_entregador DROP ATTRIBUTE Idade CASCADE;
/

CREATE TABLE tb_entregador OF tp_entregador (
    CPF PRIMARY KEY,
    DataDeNascimento NOT NULL,
    Nome NOT NULL
);
/
CREATE OR REPLACE TYPE tp_consumidor AS OBJECT (
    CPF CHAR(11),
    DataDeNascimento DATE,
    Nome VARCHAR(100),
    CEP CHAR(8),
    Rua VARCHAR(100),
    Numero INT,
    Cidade VARCHAR(50),
    Complemento VARCHAR(50)
);
/
CREATE TABLE tb_consumidor OF tp_consumidor (
    CPF PRIMARY KEY,
    DataDeNascimento NOT NULL,
    Nome NOT NULL
);
/
CREATE OR REPLACE TYPE tp_fornecedor AS OBJECT (
    CNPJ CHAR(14),
    Nome VARCHAR(100),
    CEP CHAR(8),
    Rua VARCHAR(100),
    Numero INT,
    Cidade VARCHAR(50),
    Complemento VARCHAR(50)
) NOT FINAL ;
/
CREATE TABLE tb_fornecedor OF tp_fornecedor (
    CNPJ PRIMARY KEY,
    Nome NOT NULL
);
/
CREATE OR REPLACE TYPE tp_supermercado UNDER tp_fornecedor();
/
CREATE TABLE tb_supermercado OF tp_supermercado (
    CNPJ PRIMARY KEY
);
/
CREATE OR REPLACE TYPE tp_restaurante UNDER tp_fornecedor (
    Categoria VARCHAR(50)
);
/
CREATE TABLE tb_restaurante OF tp_restaurante (
    CNPJ PRIMARY KEY
);
/
CREATE OR REPLACE TYPE tp_produto AS OBJECT (
    IdProduto INT,
    Nome VARCHAR(100)
);
/
CREATE TABLE tb_produto OF tp_produto (
    IdProduto PRIMARY KEY,
    Nome NOT NULL
);
/
CREATE OR REPLACE TYPE tp_produtoOfertado AS OBJECT (
    IdProduto REF tp_produto,
    CNPJ_Forn REF tp_fornecedor,
    Preco DECIMAL(10, 2)
);
/
CREATE TABLE tb_produtoOfertado OF tp_produtoOfertado(
   --  CONSTRAINT PK_ProdutoOfertado PRIMARY KEY (IdProduto, CNPJ_Forn),
    idProduto WITH ROWID REFERENCES tb_produto,
    CNPJ_Forn WITH ROWID REFERENCES tb_fornecedor,
    Preco CHECK (Preco >= 0)
);
/
CREATE OR REPLACE TYPE tp_pedido AS OBJECT (
    IdPedido INT,
    DataEntrega DATE,
    HoraDaEntrega TIMESTAMP,
    CPF_Entregador REF tp_entregador,
    CPF_Consumidor REF tp_consumidor,
    CNPJ_Fornecedor REF tp_fornecedor
);
/
CREATE TABLE tb_pedido OF tp_pedido (
    IdPedido PRIMARY KEY,
    DataEntrega NOT NULL,
    CPF_Entregador WITH ROWID REFERENCES tb_entregador,
    CPF_Consumidor WITH ROWID REFERENCES tb_consumidor,
    CNPJ_Fornecedor WITH ROWID REFERENCES tb_fornecedor
);
/
CREATE OR REPLACE TYPE tp_contem AS OBJECT (
    IdPedido REF tp_pedido,
    IdProduto REF tp_produto,
    IdFornecedor REF tp_fornecedor
);
/
CREATE TABLE tb_contem OF tp_contem(
   -- CONSTRAINT PK_Contem PRIMARY KEY (IdPedido, IdProduto, IdFornecedor),
    IdPedido WITH ROWID REFERENCES tb_pedido NOT NULL,
    IdProduto WITH ROWID REFERENCES tb_produto NOT NULL,
    IdFornecedor WITH ROWID REFERENCES tb_fornecedor NOT NULL
);
/
    
CREATE OR REPLACE TYPE tp_telefoneEntregador AS OBJECT (
    Ddd CHAR(2),
    Numero CHAR(9),
    CPF REF tp_entregador
);
/
CREATE TABLE tb_telefoneEntregador OF tp_telefoneEntregador (
    CONSTRAINT PK_TelefoneEntregador PRIMARY KEY (Numero, Ddd),
    CPF SCOPE IS tb_entregador
);
/
CREATE OR REPLACE TYPE tp_telefoneConsumidor AS OBJECT (
    Ddd CHAR(2),
    Numero CHAR(9),
    CPF REF tp_consumidor
);
/
CREATE TABLE tb_telefoneConsumidor OF tp_telefoneConsumidor (
    CONSTRAINT PK_TelefoneConsumidor PRIMARY KEY (Numero, Ddd),
    CPF SCOPE IS tb_consumidor
);
/
CREATE OR REPLACE TYPE tp_telefoneFornecedor AS OBJECT (
    Ddd CHAR(2),
    Numero CHAR(9),
    CNPJ REF tp_fornecedor
);
/
CREATE TABLE tb_telefoneFornecedor OF tp_telefoneFornecedor (
    CONSTRAINT PK_TelefoneFornecedor PRIMARY KEY (Numero, Ddd),
    CNPJ SCOPE IS tb_fornecedor
);
/
CREATE OR REPLACE TYPE tp_desconto AS OBJECT (
    CNPJ REF tp_fornecedor,
    Data DATE,
    Porcentagem DECIMAL(5, 2)
);
/
CREATE TABLE tb_desconto OF tp_desconto (
    CONSTRAINT PK_Desconto PRIMARY KEY (Data),
    CNPJ WITH ROWID REFERENCES tb_fornecedor
);
/
CREATE OR REPLACE TYPE tp_componente AS OBJECT (
    CodigoComponente REF tp_produto,
    CodigoComposto REF tp_produto
);
/
CREATE TABLE tb_componente OF tp_componente (
  --  CONSTRAINT PK_Componente PRIMARY KEY (CodigoComponente, CodigoComposto),
    CodigoComponente WITH ROWID REFERENCES tb_produto NOT NULL,
    CodigoComposto WITH ROWID REFERENCES tb_produto NOT NULL
);
/
-- DUVIDA: REF NÃO ENTRA NA PK?
