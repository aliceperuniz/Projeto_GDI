-- SELECT REF
-- SELECT DEREF
-- CONSULTA À VARRAY
-- CONSULTA À NESTED TABLE  
-- Mostrar que as funções criadas funcionam! 
--  -- TO DO: FUNCTIONS
        --  MEMBER FUNCTION getIdentificador RETURN VARCHAR2,
        --  MEMBER FUNCTION getTipo RETURN VARCHAR2 (PARA O FORNECEDOR, SUPERMERCADOS E RESTAURANTES)
        --  MAP MEMBER FUNCTION transformaPorcentagem RETURN DECIMAL
        --  ORDER MEMBER FUNCTION mesmoDdd (t tp_telefone) RETURN INTEGER


DECLARE
    entregador tp_entregador;
    idade NUMBER;
BEGIN
    entregador := tp_entregador('12345678901', TO_DATE('2004-01-30', 'YYYY-MM-DD'), 'Maria');
    idade := entregador.getIdade();
    DBMS_OUTPUT.PUT_LINE('Idade: ' || idade);
END;
/

DECLARE
    consumidor tp_consumidor;
BEGIN
    consumidor := tp_consumidor('12345678901', TO_DATE('2004-01-30', 'YYYY-MM-DD'), 'Maria', '12345678', 'Rua A', 123, 'Cidade A', 'Complemento A');
    consumidor.detalhesConsumidor();
END;
/


DECLARE 
    p tp_produto;
BEGIN
    p := tp_produto(1, 'Arroz');
    DBMS_OUTPUT.PUT_LINE(p.Nome);
END;
/
