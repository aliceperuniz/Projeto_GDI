CREATE OR REPLACE TYPE tp_entregador AS OBJECT (
    CPF CHAR(11),
    DataDeNascimento DATE,
    Nome VARCHAR(100),
    MEMBER FUNCTION getIdade RETURN NUMBER
    );
/

CREATE OR REPLACE TYPE BODY tp_entregador AS
    MEMBER FUNCTION getIdade RETURN NUMBER IS
    BEGIN
       RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, SELF.DataDeNascimento)/12);
    END;
END;
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
    Complemento VARCHAR(50),
    MEMBER PROCEDURE detalhesConsumidor
);
/

CREATE OR REPLACE TYPE BODY tp_consumidor AS
    MEMBER PROCEDURE detalhesConsumidor IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('CPF: ' || SELF.CPF);
        DBMS_OUTPUT.PUT_LINE('Nome: ' || SELF.Nome);
        DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || TO_CHAR(SELF.DataDeNascimento, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('Endereço: ' || SELF.Rua || ', ' || SELF.Numero || ', ' || SELF.Cidade || ', ' || SELF.CEP);
        DBMS_OUTPUT.PUT_LINE('Complemento: ' || SELF.Complemento);
    END;
END;
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
    Complemento VARCHAR(50),
    MEMBER FUNCTION getIdentificador RETURN VARCHAR2,
    MEMBER FUNCTION getTipo RETURN VARCHAR2
) NOT FINAL ;
/

CREATE OR REPLACE TYPE BODY tp_fornecedor AS
    MEMBER FUNCTION getIdentificador RETURN VARCHAR2 FINAL IS
    BEGIN
         RETURN 'Fornecedor: ' || SELF.CNPJ;
    END;
    
    MEMBER FUNCTION getTipo RETURN VARCHAR2 IS
    BEGIN
         RETURN 'Fornecedor';
    END;
END;
/

CREATE TABLE tb_fornecedor OF tp_fornecedor (
    CNPJ PRIMARY KEY,
    Nome NOT NULL
);
/

CREATE OR REPLACE TYPE tp_supermercado UNDER tp_fornecedor(
    OVERRIDING MEMBER FUNCTION getTipo RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY tp_supermercado AS
    OVERRIDING MEMBER FUNCTION getTipo RETURN VARCHAR2 IS
    BEGIN
         RETURN 'Supermercado';
    END;
END;
/

CREATE TABLE tb_supermercado OF tp_supermercado (
    CNPJ PRIMARY KEY
);
/

CREATE OR REPLACE TYPE tp_restaurante UNDER tp_fornecedor (
    Categoria VARCHAR(50),
    OVERRIDING MEMBER FUNCTION getTipo RETURN VARCHAR2
    ) NOT FINAL;
/

CREATE OR REPLACE TYPE BODY tp_restaurante AS
    OVERRIDING MEMBER FUNCTION getTipo RETURN VARCHAR2 IS
    BEGIN
         RETURN 'Restaurante - ' || SELF.Categoria;
    END;
END;
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
CREATE OR REPLACE TYPE BODY tp_produto AS
    CONSTRUCTOR FUNCTION tp_produto(IdProduto INT, Nome VARCHAR) RETURN SELF AS RESULT IS
    BEGIN
         SELF.IdProduto := IdProduto;
         SELF.Nome := Nome;
         RETURN;
    END;
END;
/


CREATE TABLE tb_produto OF tp_produto (
    IdProduto PRIMARY KEY,
    Nome NOT NULL
);
/

CREATE OR REPLACE TYPE tp_produtoOfertado AS OBJECT (
    IdProduto REF tp_produto,
    CNPJ_Forn REF tp_fornecedor,
    Preco DECIMAL(10, 2));
/

CREATE TABLE tb_produtoOfertado OF tp_produtoOfertado(
   --  CONSTRAINT PK_ProdutoOfertado PRIMARY KEY (IdProduto, CNPJ_Forn),
    idProduto SCOPE IS tb_produto NOT NULL,
    CNPJ_Forn SCOPE IS tb_fornecedor NOT NULL,
    Preco CHECK (Preco >= 0)
 --   CONSTRAINT UQ_Produto_CNPJ UNIQUE (IdProduto, CNPJ_Forn) -> ORA-02329: column of datatype REF cannot be unique or a primary key 
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
    IdProduto REF tp_produtoOfertado,
    IdFornecedor REF tp_fornecedor
    );
/

CREATE TABLE tb_contem OF tp_contem(
   -- CONSTRAINT PK_Contem PRIMARY KEY (IdPedido, IdProduto, IdFornecedor),
    IdPedido WITH ROWID REFERENCES tb_pedido NOT NULL,
    IdProduto WITH ROWID REFERENCES tb_produtoOfertado NOT NULL,
    IdFornecedor WITH ROWID REFERENCES tb_fornecedor NOT NULL
);
/

CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    Ddd CHAR(2),
    Numero CHAR(9),
    ORDER MEMBER FUNCTION mesmoDdd (t tp_telefone) RETURN INTEGER
) NOT INSTANTIABLE NOT FINAL;
/

CREATE OR REPLACE TYPE BODY tp_telefone AS
    ORDER MEMBER FUNCTION mesmoDdd (t tp_telefone) RETURN INTEGER IS
    BEGIN
        IF SELF.Ddd = t.Ddd THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END;
END;
/

CREATE OR REPLACE TYPE tp_telefoneEntregador UNDER tp_telefone (
    CPF REF tp_entregador
);
/

CREATE OR REPLACE TYPE BODY tp_telefoneEntregador AS
    OVERRIDING ORDER MEMBER FUNCTION mesmoDdd (t tp_telefone) RETURN INTEGER IS
    BEGIN
        RETURN SELF.tp_telefone.mesmoDdd(t);
    END;
END;
/

CREATE TABLE tb_telefoneEntregador OF tp_telefoneEntregador (
    CONSTRAINT PK_TelefoneEntregador PRIMARY KEY (Numero, Ddd),
    CPF SCOPE IS tb_entregador NOT NULL
);
/

CREATE OR REPLACE TYPE tp_telefoneConsumidor UNDER tp_telefone (
    CPF REF tp_consumidor
);
/

CREATE OR REPLACE TYPE BODY tp_telefoneConsumidor AS
    OVERRIDING ORDER MEMBER FUNCTION mesmoDdd (t tp_telefone) RETURN INTEGER IS
    BEGIN
        RETURN SELF.tp_telefone.mesmoDdd(t);
    END;
END;
/

CREATE TABLE tb_telefoneConsumidor OF tp_telefoneConsumidor (
    CONSTRAINT PK_TelefoneConsumidor PRIMARY KEY (Numero, Ddd),
    CPF SCOPE IS tb_consumidor NOT NULL
);
/

CREATE OR REPLACE TYPE tp_telefoneFornecedor UNDER tp_telefone (
    CNPJ REF tp_fornecedor
);
/

CREATE OR REPLACE TYPE BODY tp_telefoneFornecedor AS
    OVERRIDING ORDER MEMBER FUNCTION mesmoDdd (t tp_telefone) RETURN INTEGER IS
    BEGIN
        RETURN SELF.tp_telefone.mesmoDdd(t);
    END;
END;
/

CREATE TABLE tb_telefoneFornecedor OF tp_telefoneFornecedor (
    CONSTRAINT PK_TelefoneFornecedor PRIMARY KEY (Numero, Ddd),
    CNPJ SCOPE IS tb_fornecedor NOT NULL
);
/

CREATE OR REPLACE TYPE tp_desconto AS OBJECT (
    CNPJ REF tp_fornecedor,
    Data DATE,
    Porcentagem DECIMAL(4, 3),
    MAP MEMBER FUNCTION transformaPorcentagem RETURN DECIMAL
);
/

CREATE OR REPLACE TYPE BODY tp_desconto AS
    MAP MEMBER FUNCTION transformaPorcentagem RETURN DECIMAL IS
    BEGIN
        RETURN Porcentagem * 100; 
    END;
END;
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

CREATE OR REPLACE TYPE tp_prato AS OBJECT (
    Nome  VARCHAR2(100),
    Preco DECIMAL(10,2)
);
/

CREATE OR REPLACE TYPE varray_pratos AS VARRAY(20) OF tp_prato;
/

ALTER TYPE tp_restaurante ADD ATTRIBUTE Pratos varray_pratos CASCADE;
/

CREATE OR REPLACE TYPE tp_historicoCardapio AS OBJECT (
    DataAtualizacao DATE,
    Menu varray_pratos
);
/

CREATE OR REPLACE TYPE nt_historicoCardapios AS TABLE OF tp_historicoCardapio;
/

CREATE OR REPLACE TYPE tp_restauranteComHistorico UNDER tp_restaurante (
    HistoricoMenus nt_historicoCardapios
);
/

CREATE TABLE tb_restauranteComHistorico OF tp_restauranteComHistorico (
    CNPJ PRIMARY KEY
) NESTED TABLE HistoricoMenus STORE AS nt_historicoMenus_tab;
/
