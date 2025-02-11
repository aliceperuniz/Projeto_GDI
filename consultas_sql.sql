-- Alterando o nome da coluna "Preco" em ProdutoOfertado e depois desfazendo
SELECT * FROM ProdutoOfertado;

ALTER TABLE ProdutoOfertado
RENAME COLUMN Preco TO Price;

SELECT * FROM ProdutoOfertado;

ALTER TABLE ProdutoOfertado
RENAME COLUMN Price TO Preco;


-- Cria um índice para a coluna "Nome" da tabela "Fornecedor"
CREATE INDEX idx_nome_fornecedor
ON Fornecedor (Nome);

-- Verificando a existência do índice
SELECT index_name
FROM all_ind_columns
WHERE table_name = 'FORNECEDOR';

DROP INDEX idx_nome_fornecedor;

-- Inserindo um novo entregador
INSERT INTO Entregador (CPF, DataDeNascimento, Nome) VALUES ('91221101312', TO_DATE('1989-12-13', 'YYYY-MM-DD'), 'Taylor Silva');

SELECT * FROM Entregador;

-- Alterando o nome do novo entregador
UPDATE Entregador SET Nome = 'Taylor Silve' WHERE CPF = '91221101312';

SELECT * FROM Entregador;

-- Removendo o novo entregador
DELETE FROM Entregador WHERE CPF = '91221101312';

SELECT * FROM Entregador;

-- Selecionando todos pedidos que tiveram descontos
-- INNER JOIN + NOT NULL
SELECT P.IdPedido, P.Data, D.Porcentagem, C.Nome
FROM Pedido P
INNER JOIN Desconto D ON P.CNPJ = D.CNPJ_Desconto
INNER JOIN Consumidor C ON P.CPF = C.CPF
WHERE D.Porcentagem IS NOT NULL
ORDER BY P.Data DESC;

-- Selecionando o produto ofertado com maior preço de cada fornecedor
-- INNER JOIN + MAX + ORDER BY
SELECT F.Nome, PR.Nome, PO.Preco
FROM ProdutoOfertado PO
INNER JOIN Produto PR ON PO.IdProduto = PR.IdProduto
INNER JOIN Fornecedor F ON PO.CNPJ_Forn = F.CNPJ
WHERE PO.Preco = (
    SELECT MIN(PO2.Preco)
    FROM ProdutoOfertado PO2
    WHERE PO2.CNPJ_Forn = PO.CNPJ_Forn
)
ORDER BY F.Nome;

-- Selecionando o produto ofertado com menor preço de cada fornecedor
-- INNER JOIN + MIN + ORDER BY
SELECT F.Nome, PR.Nome, PO.Preco
FROM ProdutoOfertado PO
INNER JOIN Produto PR ON PO.IdProduto = PR.IdProduto
INNER JOIN Fornecedor F ON PO.CNPJ_Forn = F.CNPJ
WHERE PO.Preco = (
    SELECT MIN(PO2.Preco)
    FROM ProdutoOfertado PO2
    WHERE PO2.CNPJ_Forn = PO.CNPJ_Forn
)
ORDER BY F.Nome;

-- Selecionando todos os pedidos feitos entre 3 e 14 de fevereiro, bem como seus descontos e as pessoas que fizeram esse pedido
-- LEFT JOIN + BETWEEN + ORDER BY + IN
SELECT P.IdPedido, P.Data, D.Porcentagem, C.Nome
FROM Pedido P
LEFT JOIN Desconto D ON P.CNPJ = D.CNPJ_Desconto
LEFT JOIN Consumidor C ON P.CPF = C.CPF
WHERE P.CPF IN ('76543210987', '12312312300', '86586586599', '98765432112') AND
P.Data BETWEEN TO_DATE('2025-02-03', 'YYYY-MM-DD') 
AND TO_DATE('2025-02-14', 'YYYY-MM-DD')
ORDER BY P.Data DESC;

-- Selecionando todos os nomes de fornecedores que oferecem produtos acima da média dos preços dos produtos ofertados
-- subconsulta com operador relacional + AVG
SELECT F.Nome, PR.Nome, P.Preco
FROM Fornecedor F
JOIN ProdutoOfertado P ON F.CNPJ = P.CNPJ_Forn
JOIN Produto PR ON P.IdProduto = PR.IdProduto
WHERE P.Preco > (
    SELECT AVG(Preco) 
    FROM ProdutoOfertado
);

-- Seleciona todos os produtos ofertados com preço maior que 60
-- subconsulta com ALL
SELECT PR.Nome, P.Preco, F.Nome
FROM ProdutoOfertado P
JOIN Produto PR ON P.IdProduto = PR.IdProduto
JOIN Fornecedor F ON P.CNPJ_Forn = F.CNPJ
WHERE P.Preco > ALL (
    SELECT PO.Preco 
    FROM ProdutoOfertado PO
    WHERE PO.Preco <= 60
);


-- Seleciona todos os pedidos feitos depois do dia 9 de fevereiro
-- subconsulta com ANY
SELECT P.IdPedido, P.Data, C.Nome, F.Nome
FROM Pedido P
JOIN Consumidor C ON P.CPF = C.CPF
JOIN Fornecedor F ON P.CNPJ = F.CNPJ
WHERE P.Data > ANY (
    SELECT Data
    FROM Pedido
    WHERE Data > TO_DATE('2025-02-09', 'YYYY-MM-DD')
);


-- Selecionando os fornecedores localizados na Rua do Hambúrguer, Av Norte ou Rua 17 de Agsoto
-- subconsulta com IN 
SELECT F.Nome, F.Rua
FROM Fornecedor F
WHERE F.Rua IN (
    SELECT Rua
    FROM Fornecedor
    WHERE Rua IN ('Rua do Hambúrguer', 'Av. Norte', 'Rua 17 de Agosto')
)
ORDER BY F.Nome ASC;

-- Selecionando e Agrupando as Ruas que iniciam com "Rua" ou "Av" e suas quantidades de fornecedores que já tiveram pedidos
-- having + group by + COUNT + LIKE
SELECT F.Rua, COUNT(*)
FROM Fornecedor F
JOIN Pedido P ON F.CNPJ = P.CNPJ
WHERE (F.Rua LIKE 'Rua%' OR F.Rua LIKE 'Av%')
GROUP BY F.Rua
HAVING COUNT(P.IdPedido) > 0;

-- Usando create view para visualizar produtos ofertados e seus fornecedores
-- create view
CREATE VIEW View_Produtos_Fornecedor AS
SELECT P.IdProduto, PR.Nome AS NomeProduto, F.Nome AS NomeFornecedor, P.Preco
FROM ProdutoOfertado P
JOIN Produto PR ON P.IdProduto = PR.IdProduto
JOIN Fornecedor F ON P.CNPJ_Forn = F.CNPJ;
SELECT * FROM View_Produtos_Fornecedor;


-- Buscando consumidores que realizaram pedidos e estão na mesma cidade de um supermercado, via intersect:
-- intersect + IN
SELECT c.Nome
FROM Consumidor c
WHERE c.Cidade IN (
    SELECT f.Cidade 
    FROM Supermercado s
    JOIN Fornecedor f ON s.CNPJ_Forn = f.CNPJ
)
INTERSECT
SELECT c.Nome
FROM Pedido p
JOIN Consumidor c ON p.CPF = c.CPF;
