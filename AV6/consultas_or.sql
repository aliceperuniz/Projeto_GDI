-- SELECT REF E DEREF
-- CONSULTA À VARRAY
-- CONSULTA À NESTED TABLE  
-- Mostrar que as funções criadas funcionam! 
--  -- TO DO: FUNCTIONS
        --  MEMBER FUNCTION getIdentificador RETURN VARCHAR2,
        --  MEMBER FUNCTION getTipo RETURN VARCHAR2 (PARA O FORNECEDOR, SUPERMERCADOS E RESTAURANTES)
        --  MAP MEMBER FUNCTION transformaPorcentagem RETURN DECIMAL
        --  ORDER MEMBER FUNCTION mesmoDdd (t tp_telefone) RETURN INTEGER
-- OBS: TENTAR USAR TODAS AS TABELAS E FAZER O MAXIMO DE CONSULTAS POSSIVEIS E MAIS COMPLEXAS

-- SELECT DEREF
SELECT 
    DEREF(p.CPF_Consumidor).Nome AS Nome_Consumidor,
    DEREF(p.CPF_Entregador).Nome AS Nome_Entregador,
    p.DataEntrega,
    p.HoraDaEntrega
FROM tb_pedido p
WHERE p.IdPedido = 1;
/

SELECT 
    DEREF(po.CNPJ_Forn).CNPJ AS CNPJ_Fornecedor,
    DEREF(po.idProduto).Nome AS Nome_Produto,
    po.Preco
FROM tb_produtoOfertado po
JOIN tb_fornecedor f
    ON DEREF(po.CNPJ_Forn).CNPJ = f.CNPJ
JOIN tb_produto p
    ON DEREF(po.idProduto).IdProduto = p.IdProduto
WHERE f.Nome = 'Fornecedor I';
/

-- testando funcao getIdade
DECLARE
    entregador tp_entregador;
    idade NUMBER;
BEGIN
    entregador := tp_entregador('14141414141', TO_DATE('1979-03-17','YYYY-MM-DD'), 'Fernando Dias',
            varray_telefoneEntregador(tp_telefoneEntregador('81', '999999997'), tp_telefoneEntregador('81', '999999996'),tp_telefoneEntregador('81', '999999995')));
    idade := entregador.getIdade();
    DBMS_OUTPUT.PUT_LINE('Idade: ' || idade);
END;
/

-- testando procedure detalhesConsumidor
DECLARE
    consumidor tp_consumidor;
BEGIN
    consumidor := tp_consumidor('16161616161', TO_DATE('1985-04-12','YYYY-MM-DD'), 'Roberto Silva', '12345678', 'Rua A', 100, 'São Paulo', 'Apto 101',
    varray_telefoneConsumidor(tp_telefoneConsumidor('11', '999999999'), tp_telefoneConsumidor('11', '987872188')));
    consumidor.detalhesConsumidor();
END;
/

 -- testando construtor tp_produto
DECLARE 
    p tp_produto;
BEGIN
    p := tp_produto(1, 'Arroz');
    DBMS_OUTPUT.PUT_LINE(p.Nome);
END;
/
