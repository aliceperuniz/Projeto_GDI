---------------------------------------------------------------------
-- Implementação do type body de Telefone_t
---------------------------------------------------------------------
CREATE OR REPLACE TYPE BODY Telefone_t IS
  CONSTRUCTOR FUNCTION Telefone_t(ddd CHAR, numero CHAR) RETURN SELF AS RESULT IS
  BEGIN
    SELF.ddd := ddd;
    SELF.numero := numero;
    RETURN;
  END;
END;
/

---------------------------------------------------------------------
-- Implementação do type body de Pessoa_t
---------------------------------------------------------------------
CREATE OR REPLACE TYPE BODY Pessoa_t IS
  MEMBER PROCEDURE displayInfo IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('CPF: ' || cpf || ' - Nome: ' || nome);
  END;
  
  MEMBER FUNCTION getInfo RETURN VARCHAR2 IS
  BEGIN
    RETURN 'Pessoa: ' || nome;
  END;
  
  ORDER MEMBER FUNCTION compare(other IN Pessoa_t) RETURN INTEGER IS
  BEGIN
    IF nome < other.nome THEN
      RETURN -1;
    ELSIF nome > other.nome THEN
      RETURN 1;
    ELSE
      RETURN 0;
    END IF;
  END;
  
  MAP MEMBER FUNCTION toNumber RETURN NUMBER IS
  BEGIN
    -- Exemplo: converte os 5 primeiros dígitos do CPF para número
    RETURN TO_NUMBER(SUBSTR(cpf, 1, 5));
  END;
END;
/

---------------------------------------------------------------------
-- Implementação do type body de Entregador_t (OVERRIDING do getInfo)
---------------------------------------------------------------------
CREATE OR REPLACE TYPE BODY Entregador_t IS
  OVERRIDING MEMBER FUNCTION getInfo RETURN VARCHAR2 IS
  BEGIN
    RETURN 'Entregador: ' || nome;
  END;
END;
/

---------------------------------------------------------------------
-- Implementação do type body de Fornecedor_t
---------------------------------------------------------------------
CREATE OR REPLACE TYPE BODY Fornecedor_t IS
  MEMBER PROCEDURE displayInfo IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('CNPJ: ' || cnpj || ' - Nome: ' || nome);
  END;
  
  CONSTRUCTOR FUNCTION Fornecedor_t(
      cnpj        CHAR,
      nome        VARCHAR2,
      cep         CHAR,
      rua         VARCHAR2,
      numero      INT,
      cidade      VARCHAR2,
      complemento VARCHAR2
  ) RETURN SELF AS RESULT IS
  BEGIN
    SELF.cnpj        := cnpj;
    SELF.nome        := nome;
    SELF.cep         := cep;
    SELF.rua         := rua;
    SELF.numero      := numero;
    SELF.cidade      := cidade;
    SELF.complemento := complemento;
    SELF.telefones   := Telefone_NT(); -- Inicializa a nested table de telefones
    RETURN;
  END;
END;
/

---------------------------------------------------------------------
-- Implementação do type body de Produto_t
---------------------------------------------------------------------
CREATE OR REPLACE TYPE BODY Produto_t IS
  MEMBER FUNCTION getNome RETURN VARCHAR2 IS
  BEGIN
    RETURN nome;
  END;
  
  ORDER MEMBER FUNCTION compare(other IN Produto_t) RETURN INTEGER IS
  BEGIN
    IF nome < other.nome THEN
      RETURN -1;
    ELSIF nome > other.nome THEN
      RETURN 1;
    ELSE
      RETURN 0;
    END IF;
  END;
  
  MAP MEMBER FUNCTION toNumber RETURN NUMBER IS
  BEGIN
    RETURN idProduto;
  END;
END;
/

---------------------------------------------------------------------
-- Implementação do type body de ProdutoOfertado_t
---------------------------------------------------------------------
CREATE OR REPLACE TYPE BODY ProdutoOfertado_t IS
  MEMBER FUNCTION getPrecoComDesconto(desc DECIMAL) RETURN DECIMAL IS
  BEGIN
    RETURN preco - (preco * desc/100);
  END;
END;
/

---------------------------------------------------------------------
-- Implementação do type body de Pedido_t
---------------------------------------------------------------------
CREATE OR REPLACE TYPE BODY Pedido_t IS
  MEMBER FUNCTION getResumo RETURN VARCHAR2 IS
  BEGIN
    RETURN 'Pedido ' || idPedido || ' realizado em ' || TO_CHAR(data, 'DD/MM/YYYY');
  END;
END;
/
