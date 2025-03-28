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
-- dados do consumidor, do entregador, data e hora de entrega do pedido 1
SELECT 
    DEREF(p.CPF_Consumidor).Nome AS Nome_Consumidor,
    DEREF(p.CPF_Entregador).Nome AS Nome_Entregador,
    p.DataEntrega,
    p.HoraDaEntrega
FROM tb_pedido p
WHERE p.IdPedido = 1;
/

-- cnpj do fornecedor, nome do produto ofertado e preço do produto ofertado pelo fornecedor I
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

-- testando map function transformaporcentagem + CONSULTA À VARRAY + CONSULTA À NESTED TABLE  
-- nome dos produtos ofertados, preço, desconto transformado pela função e telefones de cada fornecedor
SELECT 
  DEREF(p.IdProduto).Nome AS Produto,
  p.Preco,
  d.transformaPorcentagem() AS Desconto,
  t.Ddd || t.Numero AS TelefoneFornecedor
FROM tb_produtoOfertado p,
     tb_supermercado s,
     TABLE(s.Descontos) d,
     TABLE(s.Telefones) t
WHERE DEREF(p.CNPJ_Forn).CNPJ = s.CNPJ;
/

-- nome do restaurante e nome dos seus produtos ofertados e preço, que sejam componentes de algum produto composto
SELECT
  r.Nome AS Restaurante,
  DEREF(p.IdProduto).Nome AS Produto_Ofertado,
  p.Preco AS Preco_Produto,
  DEREF(comp.CodigoComposto).Nome AS Produto_Composto,
FROM tb_restaurante r,
     tb_produtoOfertado p,
     tb_componente comp
WHERE DEREF(comp.CodigoComponente).IdProduto = DEREF(p.idProduto).idProduto;
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

-- testando função getIdentificador e getTipo para fornecedor, supermercado e restaurante
SELECT f.getTipo(),f.getIdentificador() FROM tb_fornecedor f WHERE f.rua = 'Av Forn X';
SELECT f.getTipo(),f.getIdentificador() FROM tb_restaurante f;
SELECT f.getTipo(),f.getIdentificador() FROM tb_supermercado f;

-- testando order function mesmoddd
DECLARE
    entregador tp_entregador;
    resultado INTEGER;
BEGIN
    -- Busca o objeto do entregador de cpf 11111111111
    SELECT value(e) 
    INTO entregador 
    FROM tb_entregador e 
    WHERE e.cpf = '11111111111';

    -- Comparando o primeiro e o segundo número de telefone do varray
    resultado := entregador.telefones(1).mesmoDdd(entregador.telefones(2));
    DBMS_OUTPUT.PUT_LINE('Resultado da comparação do DDD do primeiro e segundo telefone: ' || resultado);

    -- Comparando o segundo e o terceiro número de telefone do varray
    resultado := entregador.telefones(2).mesmoDdd(entregador.telefones(3));
    DBMS_OUTPUT.PUT_LINE('Resultado da comparação do DDD do segundo e terceiro telefone: ' || resultado);
END;
/

-- testando order function mesmoddd diretamente com os telefones
DECLARE
    telefone1 tp_telefoneEntregador := tp_telefoneEntregador('81', '987654321');
    telefone2 tp_telefoneEntregador := tp_telefoneEntregador('81', '987123456');
    telefone3 tp_telefoneEntregador := tp_telefoneEntregador('82', '987654321');
    resultado INTEGER;
BEGIN
    -- Comparando telefone1 e telefone2 (mesmo DDD)
    resultado := telefone1.mesmoDdd(telefone2);
    DBMS_OUTPUT.PUT_LINE('Resultado para telefone1 e telefone2 (mesmo DDD): ' || resultado);

    -- Comparando telefone1 e telefone3 (DDD diferente)
    resultado := telefone1.mesmoDdd(telefone3);
    DBMS_OUTPUT.PUT_LINE('Resultado para telefone1 e telefone3 (DDD diferente): ' || resultado);
END;
/

-- aprimorando a consulta dos descontos e mostrando o preço com desconto
-- DEREF + CONSULTA A NESTED TABLE + teste tranformaporcentagem
SELECT 
    DEREF(po.idProduto).Nome AS Nome_Produto,
    po.Preco AS Preco_Produto,
    d.transformaPorcentagem() AS Desconto,
    po.Preco * (1 - d.transformaPorcentagem() / 100) AS Preco_Com_Desconto,
    s.Nome AS Supermercado,
    t.Ddd || t.Numero AS TelefoneSupermercado
FROM 
    tb_produtoOfertado po,
    tb_supermercado s,
    TABLE(s.Descontos) d,
    TABLE(s.Telefones) t
WHERE 
    DEREF(po.CNPJ_Forn).CNPJ = s.CNPJ;


-- produtos ofertados com desconto em janeiro de 2025
-- DEREF + CONSULTA A NESTED TABLE + teste tranformaporcentagem
SELECT 
    DEREF(po.idProduto).Nome AS Produto,
    po.Preco,
    d.transformaPorcentagem() AS Desconto_Porcentagem
FROM tb_produtoOfertado po,
     tb_supermercado s,
     TABLE(s.Descontos) d
WHERE DEREF(po.CNPJ_Forn).CNPJ = s.CNPJ
  AND d.Data BETWEEN TO_DATE('2025-01-01', 'YYYY-MM-DD') 
                 AND TO_DATE('2025-01-31', 'YYYY-MM-DD');


-- detalhes de todos os consumidores que fizeram pedidos acima de 10 reais
-- REF + DEREF + teste detalhesConsumidor()
BEGIN
  FOR cons_rec IN (
    SELECT VALUE(c) AS consumidor_obj
    FROM tb_consumidor c
    WHERE EXISTS (
      SELECT 1
      FROM tb_pedido p
      JOIN tb_contem co ON p.IdPedido = DEREF(co.IdPedido).IdPedido
      JOIN tb_produtoOfertado po ON co.IdProduto = REF(po)
      WHERE p.CPF_Consumidor = REF(c)
      AND po.Preco > 10
    )
  ) LOOP
    cons_rec.consumidor_obj.detalhesConsumidor();
  END LOOP;
END;
/

-- selecionando os entregadores existentes, bem como a quantidade de telefones que eles possuem
-- VARRAY + DEREF
SELECT 
    e.Nome,
    e.CPF,
    (SELECT COUNT(*) FROM TABLE(e.Telefones)) AS Qtd_Telefones
FROM tb_entregador e
WHERE EXISTS (
    SELECT 1 FROM tb_pedido p 
    WHERE DEREF(p.CPF_Entregador).CPF = e.CPF
);

-- selecionando restaurantes de recife
-- (funções getTipo e getIdentificador)
SELECT 
    f.getTipo() AS Tipo,
    f.getIdentificador() AS Identificador,
    f.Nome AS Nome,
    f.CNPJ AS CNPJ,
    f.Cidade AS Cidade
FROM tb_restaurante f
WHERE f.Cidade = 'Recife'
;
/

-- todos os pedidos feitos, bem como os produtos vendidos, consumidores, fornecedores e entregadores.
SELECT 
    p.IdPedido,
    DEREF(p.CPF_Consumidor).Nome AS Nome_Consumidor,
    DEREF(p.CPF_Entregador).Nome AS Nome_Entregador,
    f.Nome AS Nome_Fornecedor,
    DEREF(po.IdProduto).Nome AS Nome_Produto,
    po.Preco
FROM tb_pedido p
JOIN tb_contem c 
  ON DEREF(c.IdPedido).IdPedido = p.IdPedido
JOIN tb_produtoOfertado po 
  ON c.IdProduto = REF(po)
JOIN tb_fornecedor f 
  ON DEREF(po.CNPJ_Forn).CNPJ = f.CNPJ;

-- selecionando os produtos ofertados que juntos formam um componente (tb_componente)
SELECT 
    p.IdPedido,
    DEREF(po.IdProduto).Nome AS Produto_Ofertado,
    DEREF(comp.CodigoComposto).Nome AS Produto_Composto
FROM tb_pedido p
JOIN tb_contem c ON DEREF(c.IdPedido).IdPedido = p.IdPedido
JOIN tb_produtoOfertado po ON c.IdProduto = REF(po)
JOIN tb_componente comp ON DEREF(comp.CodigoComponente).IdProduto = DEREF(po.IdProduto).IdProduto
ORDER BY p.IdPedido;

-- selecionando os consumidores pela quantidade de pedidos feitos
SELECT 
    DEREF(p.CPF_Consumidor).CPF AS CPF_Consumidor,
    DEREF(p.CPF_Consumidor).Nome AS Nome_Consumidor,
    COUNT(p.IdPedido) AS Qtd_Pedidos
FROM tb_pedido p
GROUP BY DEREF(p.CPF_Consumidor).CPF, DEREF(p.CPF_Consumidor).Nome
ORDER BY Nome_Consumidor;
