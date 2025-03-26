-- CONSULTA À VARRAY
-- CONSULTA À NESTED TABLE  
-- Mostrar que as funções criadas funcionam! 
--  -- TO DO: FUNCTIONS
        --  MEMBER FUNCTION getIdentificador RETURN VARCHAR2,
        --  MEMBER FUNCTION getTipo RETURN VARCHAR2 (PARA O FORNECEDOR, SUPERMERCADOS E RESTAURANTES)
        --  MAP MEMBER FUNCTION transformaPorcentagem RETURN DECIMAL
        --  ORDER MEMBER FUNCTION mesmoDdd (t tp_telefone) RETURN INTEGER
-- OBS: TENTAR USAR TODAS AS TABELAS E FAZER O MAXIMO DE CONSULTAS POSSIVEIS E MAIS COMPLEXAS


-- SELECT REF (Usado em inserts)

INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 4),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '11111111111111'),
  12.75
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 8),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 9)
);
INSERT INTO tb_pedido VALUES (
  114,
  TO_DATE('2025-03-24','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-24 17:05:20','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '88888888888'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '20202020202'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '77777777777777')
);

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

SELECT 
  s.getIdentificador() AS Fornecedor,
  DEREF(p.IdProduto).Nome AS Produto,
  p.Preco,
  d.transformaPorcentagem() AS Desconto,
  t.Ddd || t.Numero AS TelefoneFornecedor
FROM tb_produtoOfertado p,
     tb_supermercado s,
     TABLE(s.Descontos) d,
     TABLE(s.Telefones) t
WHERE p.CNPJ_Forn = REF(s);
/

SELECT 
  r.Nome AS Restaurante,
  DEREF(p.IdProduto).Nome AS Produto_Ofertado,
  p.Preco AS Preco_Produto,
  DEREF(comp.CodigoComposto).Nome AS Produto_Composto,
  c.IdPedido AS Pedido_Referencia
FROM tb_restaurante r,
     tb_produto_ofertado p,
     tb_contem c,
     tb_componente comp
WHERE p.CNPJ_Forn = REF(r)
  AND c.IdProduto = REF(p)
  AND comp.CodigoComponente = p.IdProduto;
/

SELECT 
    p.IdPedido,
    c.CPF AS CPF_Consumidor,
    c.Nome AS Nome_Consumidor,
    c.Telefones(1).Ddd || c.Telefones(1).Numero AS Telefone_Consumidor,
    e.CPF AS CPF_Entregador,
    e.Nome AS Nome_Entregador,
    e.Telefones(1).Ddd || e.Telefones(1).Numero AS Telefone_Entregador,
    prodComp.Nome AS Nome_Componente,
    prodComposto.Nome AS Nome_Composto
FROM tb_pedido p,
     tb_consumidor c,
     tb_entregador e,
     tb_componente comp,
     tb_produto prodComp,
     tb_produto prodComposto
WHERE p.CPF_Consumidor = REF(c)
  AND p.CPF_Entregador = REF(e)
  AND comp.CodigoComponente = REF(prodComp)
  AND comp.CodigoComposto = REF(prodComposto)
  AND e.Telefones(1).mesmoDdd(c.Telefones(1)) = 1
  AND prodComp.IdProduto < prodComposto.IdProduto;
/

SELECT 
    p.IdPedido,
    TO_CHAR(p.DataEntrega, 'DD/MM/YYYY') AS DataEntrega,
    c.Nome AS NomeConsumidor,
    c.Telefones(1).Ddd || c.Telefones(1).Numero AS TelefoneConsumidor,
    e.Nome AS NomeEntregador,
    e.Telefones(1).Ddd || e.Telefones(1).Numero AS TelefoneEntregador,
    DEREF(po.IdProduto).Nome AS NomeProduto,
    po.Preco AS PrecoProduto,
    f.Nome AS NomeFornecedor,
    f.getTipo() AS TipoFornecedor,
    DEREF(comp.CodigoComposto).Nome AS ProdutoComposto
FROM tb_pedido p,
     tb_consumidor c,
     tb_entregador e,
     tb_produtoOfertado po,
     tb_fornecedor f,
     tb_componente comp
WHERE p.CPF_Consumidor = REF(c)
  AND p.CPF_Entregador = REF(e)
  AND p.CNPJ_Fornecedor = REF(f)
  AND po.CNPJ_Forn = REF(f)
  AND po.IdProduto = comp.CodigoComponente
  AND p.DataEntrega BETWEEN SYSDATE - 60 AND SYSDATE
  AND c.Telefones(1).mesmoDdd(e.Telefones(1)) = 1;
/

SELECT 
    p.IdPedido,
    DEREF(po.IdProduto).Nome AS NomeProduto,
    po.Preco AS Preco,
    DEREF(comp.CodigoComposto).Nome AS NomeProdutoComposto,
    c.Nome AS NomeConsumidor,
    c.Telefones(2).Ddd || c.Telefones(2).Numero AS TelefoneConsumidor2,
    e.Nome AS NomeEntregador,
    e.Telefones(2).Ddd || e.Telefones(2).Numero AS TelefoneEntregador2,
    CASE 
        WHEN c.Telefones(2).mesmoDdd(e.Telefones(2)) = 1 THEN 'Mesmo DDD' 
        ELSE 'Diferente DDD' 
    END AS ComparacaoDDD
FROM tb_pedido p,
     tb_consumidor c,
     tb_entregador e,
     tb_produtoOfertado po,
     tb_componente comp
WHERE p.CPF_Consumidor = REF(c)
  AND p.CPF_Entregador = REF(e)
  AND p.IdPedido IN (
      SELECT ct.IdPedido 
      FROM tb_contem ct 
      WHERE ct.IdProduto = REF(po)
  )
  AND po.IdProduto = comp.CodigoComponente
  AND po.Preco > 10;
/

-- faz uma consulta que mostra qual foi o estabelecimento (supermercado ou restaurante), que mais vendeu produtos
-- em cada mes de 2024, e retorna tambem os descontos (se existentes), desses estabelecimentos que mais venderam
-- em cada mes.
WITH Sales AS (
  -- Calcula o total de itens vendidos por estabelecimento, agrupando por mês
  SELECT 
    TO_CHAR(p.DataEntrega, 'YYYY-MM') AS sale_month,
    DEREF(c.IdFornecedor).CNPJ AS CNPJ,
    DEREF(c.IdFornecedor) AS estab,
    COUNT(*) AS total_sales
  FROM tb_contem c, tb_pedido p
  WHERE c.IdPedido = REF(p)
    AND TO_CHAR(p.DataEntrega, 'YYYY') = '2024'
  GROUP BY TO_CHAR(p.DataEntrega, 'YYYY-MM'), DEREF(c.IdFornecedor).CNPJ, DEREF(c.IdFornecedor)
),
RankedSales AS (
  SELECT s.*,
         RANK() OVER (PARTITION BY sale_month ORDER BY total_sales DESC) AS rnk
  FROM Sales s
)
SELECT 
  rs.sale_month,
  rs.estab.getTipo() AS estabelecimento_tipo,
  rs.estab.Nome AS estabelecimento_nome,
  rs.total_sales,
  (SELECT LISTAGG(DEREF(d).transformaPorcentagem(), ', ')
          WITHIN GROUP (ORDER BY DEREF(d).Data)
   FROM TABLE(rs.estab.Descontos) d
  ) AS descontos
FROM RankedSales rs
WHERE rs.rnk = 1;
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
