-----------------------------------------------------
--- RECORD + BLOCO ANÔNIMO + SELECT INTO + %TYPE
-----------------------------------------------------

-- Armazenando uma linha inteira da tabela Entregador e atualizando o nome do entregador
DECLARE
    -- Declarando um tipo novo a partir de um RECORD (Variáveis compostas que armazenam mais de um tipo de variável)
    TYPE EntregadorTipo IS RECORD (
        CPF Entregador.CPF%TYPE,
        Nome Entregador.Nome%TYPE,
        DataDeNascimento Entregador.DataDeNascimento%TYPE
    );

    Entregador_Temp EntregadorTipo;
BEGIN
    -- Selecionando o entregador de CPF '11122233344'
    SELECT CPF, Nome, DataDeNascimento INTO Entregador_Temp
    FROM Entregador
    WHERE TRIM(CPF) = '11122233344'; -- TRIM remove os espaços extras do CPF

    -- Exibir os dados do entregador
    DBMS_OUTPUT.PUT_LINE('CPF: ' || Entregador_Temp.CPF);
    DBMS_OUTPUT.PUT_LINE('Nome: ' || Entregador_Temp.Nome);
    DBMS_OUTPUT.PUT_LINE('Nascimento: ' || TO_CHAR(Entregador_Temp.DataDeNascimento, 'DD/MM/YYYY'));

	-- Trocando o nome da pessoa (vai que ele casou)
	Entregador_Temp.Nome := 'Diego Fernandes de Souza';

    -- Aplicando a atualização no banco
    UPDATE Entregador
    SET Nome = Entregador_Temp.Nome
    WHERE CPF = Entregador_Temp.CPF;

	COMMIT;
    DBMS_OUTPUT.PUT_LINE('BD atualizado');
END;
/
-- Verificando e desfazendo alterações do BD
SELECT * FROM Entregador WHERE CPF = '11122233344';

UPDATE ENTREGADOR SET NOME = 'Diego Fernandes' WHERE CPF = '11122233344';

SELECT * FROM Entregador WHERE CPF = '11122233344';


-----------------------------------------------------
--- IF ELSIF ELSE + FOR IN LOOP + SELECT INTO
-----------------------------------------------------


SELECT PRECO FROM ProdutoOfertado
    WHERE IdProduto = 1;

DECLARE
    CURSOR c_produto IS
        SELECT Preco, IdProduto, CNPJ_Forn 
        FROM ProdutoOfertado
        WHERE IdProduto = 1; 

    v_preco_atual ProdutoOfertado.Preco%TYPE;
    v_id_produto ProdutoOfertado.IdProduto%TYPE;
    v_cnpj_fornecedor ProdutoOfertado.CNPJ_Forn%TYPE;
BEGIN
    -- Abrindo o cursor
    FOR r_produto IN c_produto LOOP
        v_preco_atual := r_produto.Preco;
        v_id_produto := r_produto.IdProduto;
        v_cnpj_fornecedor := r_produto.CNPJ_Forn;

        -- Verificando o preço do produto e realizando a operação
        IF v_preco_atual < 5.00 THEN
            -- Se o preço for menor que 5.00, aumenta o preço em 10%
            UPDATE ProdutoOfertado
            SET Preco = Preco * 1.10
            WHERE IdProduto = v_id_produto AND CNPJ_Forn = v_cnpj_fornecedor;
            DBMS_OUTPUT.PUT_LINE('Preço aumentado em 10% para o fornecedor ' || v_cnpj_fornecedor);

        ELSIF v_preco_atual >= 5.00 AND v_preco_atual <= 10.00 THEN
            -- Se o preço estiver entre 5.00 e 10.00, aumenta o preço em 5%
            UPDATE ProdutoOfertado
            SET Preco = Preco * 1.05
            WHERE IdProduto = v_id_produto AND CNPJ_Forn = v_cnpj_fornecedor;
            DBMS_OUTPUT.PUT_LINE('Preço aumentado em 5% para o fornecedor ' || v_cnpj_fornecedor);

        ELSE
            -- Se o preço for maior que 10.00, diminui o preço em 5%
            UPDATE ProdutoOfertado
            SET Preco = Preco * 0.95
            WHERE IdProduto = v_id_produto AND CNPJ_Forn = v_cnpj_fornecedor;
            DBMS_OUTPUT.PUT_LINE('Preço diminuído em 5% para o fornecedor ' || v_cnpj_fornecedor);
        END IF;
        
        -- Exibir o novo preço
        SELECT Preco INTO v_preco_atual
        FROM ProdutoOfertado
        WHERE IdProduto = v_id_produto AND CNPJ_Forn = v_cnpj_fornecedor;
        
        DBMS_OUTPUT.PUT_LINE('Novo preço do produto para o fornecedor ' || v_cnpj_fornecedor || ': ' || v_preco_atual);
    END LOOP;
END;
/

-----------------------------------------------------
--- CREATE OR REPLACE TRIGGER (COMANDO) 
-----------------------------------------------------

CREATE OR REPLACE TRIGGER trg_disjoint_fornecedor
    BEFORE INSERT OR UPDATE ON Supermercado
    FOR EACH ROW
DECLARE
    v_count INT;
BEGIN
    -- Verifica se o fornecedor já está cadastrado como restaurante
    SELECT COUNT(*) INTO v_count
    FROM Restaurante
    WHERE CNPJ_Forn = :NEW.CNPJ_Forn;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Este fornecedor já está cadastrado como restaurante e não pode ser cadastrado como supermercado.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_disjoint_restaurante
    BEFORE INSERT OR UPDATE ON Restaurante
    FOR EACH ROW
DECLARE
    v_count INT;
BEGIN
    -- Verifica se o fornecedor já está cadastrado como supermercado
    SELECT COUNT(*) INTO v_count
    FROM Supermercado
    WHERE CNPJ_Forn = :NEW.CNPJ_Forn;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Este fornecedor já está cadastrado como supermercado e não pode ser cadastrado como restaurante.');
    END IF;
END;
/
-- Testando aplicação
INSERT INTO Fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('28560090123122', 'Restaurante Show de Massa', '52000120', 'Rua B', 300, 'Recife', '');
INSERT INTO Supermercado (CNPJ_Forn) VALUES ('28560090123122');
INSERT INTO Restaurante (CNPJ_Forn, Categoria) VALUES ('28560090123122', 'Comida Italiana');

-----------------------------------------------------
--- CREATE OR REPLACE TRIGGER (LINHA) 
-----------------------------------------------------

CREATE OR REPLACE TRIGGER verificar_desconto_ofertado
BEFORE INSERT OR UPDATE ON Desconto
FOR EACH ROW
WHEN (NEW.Porcentagem <= 0)
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Erro: O Desconto oferecido deve ser maior que zero.');
END;
/
-- Testando aplicação
INSERT INTO Desconto (CNPJ_Desconto, Data, Porcentagem) VALUES ('76543210000177', TO_DATE('2025-02-13', 'YYYY-MM-DD'), -6.00);

-----------------------------------------------------
--- CREATE PROCEDURE
-----------------------------------------------------
CREATE OR REPLACE PROCEDURE ConsultarProdutosPorFornecedor (p_CNPJ_Forn CHAR) IS
    CURSOR c_produtos IS
        SELECT p.Nome AS Nome_Produto,
               po.Preco AS Preco_Produto
        FROM Produto p
        JOIN ProdutoOfertado po ON p.IdProduto = po.IdProduto
        WHERE po.CNPJ_Forn = p_CNPJ_Forn;
        
    v_nome_produto VARCHAR(100);
    v_preco_produto DECIMAL(10, 2);
    v_nome_fornecedor VARCHAR(100);
BEGIN
    -- Consulta o nome do fornecedor
    SELECT f.Nome
    INTO v_nome_fornecedor
    FROM Fornecedor f
    WHERE f.CNPJ = p_CNPJ_Forn;
    
    -- Imprime o nome do fornecedor
    DBMS_OUTPUT.PUT_LINE('Fornecedor: ' || v_nome_fornecedor);
    
    -- Consultar os produtos e preços
    OPEN c_produtos;
    
    LOOP
        FETCH c_produtos INTO v_nome_produto, v_preco_produto;
        
        EXIT WHEN c_produtos%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Produto: ' || v_nome_produto || ' - Preço: R$ ' || TO_CHAR(v_preco_produto, '999,999.99'));
    END LOOP;
    
    CLOSE c_produtos;
END;
/

-- executando o procedimento
BEGIN
    ConsultarProdutosPorFornecedor('34567890000122');
	ConsultarProdutosPorFornecedor('00056789000111');
	ConsultarProdutosPorFornecedor('23456756700111');
END;
/

-----------------------------------------------------
--- CURSOR (OPEN, FETCH, CLOSE)
-----------------------------------------------------

DECLARE
    CURSOR c_pedido IS
        SELECT IdPedido, Data, HoraDaEntrega, CPF_Entregador, CPF, CNPJ
        FROM Pedido;
    
    v_id_pedido Pedido.IdPedido%TYPE;
    v_data Pedido.Data%TYPE;
    v_hora_entrega Pedido.HoraDaEntrega%TYPE;
    v_cpf_entregador Pedido.CPF_Entregador%TYPE;
    v_cpf_consumidor Pedido.CPF%TYPE;
    v_cnpj_fornecedor Pedido.CNPJ%TYPE;
BEGIN
    -- Abrindo o cursor
    OPEN c_pedido;
    
    LOOP
        -- Buscando uma linha do cursor
        FETCH c_pedido INTO v_id_pedido, v_data, v_hora_entrega, v_cpf_entregador, v_cpf_consumidor, v_cnpj_fornecedor;
        
        -- Verifica se todos os registros foram lidos
        EXIT WHEN c_pedido%NOTFOUND;
        
        -- Exibir os dados do pedido
        DBMS_OUTPUT.PUT_LINE('Pedido ID: ' || v_id_pedido);
        DBMS_OUTPUT.PUT_LINE('Data: ' || TO_CHAR(v_data, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('Hora da Entrega: ' || TO_CHAR(v_hora_entrega, 'HH24:MI'));
        DBMS_OUTPUT.PUT_LINE('CPF Entregador: ' || v_cpf_entregador);
        DBMS_OUTPUT.PUT_LINE('CPF Consumidor: ' || v_cpf_consumidor);
        DBMS_OUTPUT.PUT_LINE('CNPJ Fornecedor: ' || v_cnpj_fornecedor);
        DBMS_OUTPUT.PUT_LINE('-------------------------------');
    END LOOP;
    
    -- Fechando o cursor
    CLOSE c_pedido;
END;
/

-----------------------------------------------------
--- TABLE + FOR + %ROWTYPE
-----------------------------------------------------
DECLARE
    TYPE EntregadorTable IS TABLE OF Entregador%ROWTYPE;
    Entregador_Temp EntregadorTable;
BEGIN
    -- Selecionando os entregadores nascidos depois do ano 2000
    SELECT * BULK COLLECT INTO Entregador_Temp 
    FROM Entregador 
    WHERE EXTRACT(YEAR FROM DataDeNascimento) > 2000;

    -- Exibir os entregadores
    FOR i IN Entregador_Temp.FIRST .. Entregador_Temp.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('CPF: ' || Entregador_Temp(i).CPF || 
                             ', Nome: ' || Entregador_Temp(i).Nome || 
                             ', Data de Nascimento: ' || TO_CHAR(Entregador_Temp(i).DataDeNascimento, 'DD/MM/YYYY'));
    END LOOP;
END;
/

-----------------------------------------------------
--- CREATE FUNCTION
-----------------------------------------------------

CREATE OR REPLACE FUNCTION Calcular_Idade (
    p_DataNascimento IN DATE
) RETURN NUMBER IS
    v_Idade NUMBER;
BEGIN
    v_Idade := TRUNC(MONTHS_BETWEEN(SYSDATE, p_DataNascimento) / 12); -- Cálculo da idade
    RETURN v_Idade;
END
/
SELECT Nome, Calcular_Idade(DataDeNascimento) AS Idade FROM Entregador;

--------------------------------------------------------------------------------
--- CREATE OR REPLACE PACKAGE + CREATE OR REPLACE PACKAGE BODY + EXCEPTION WHEN
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE Pacote_Entregador AS
    -- Declaração do Procedimento
    PROCEDURE Exibir_Entregador(p_CPF IN Entregador.CPF%TYPE);

    -- Declaração da Função
    FUNCTION Calcular_Idade(p_DataNascimento IN DATE) RETURN NUMBER;
END Pacote_Entregador;
/
CREATE OR REPLACE PACKAGE BODY Pacote_Entregador AS
    -- Implementação do Procedimento
    PROCEDURE Exibir_Entregador(p_CPF IN Entregador.CPF%TYPE) IS
        v_Nome Entregador.Nome%TYPE;
        v_DataNascimento Entregador.DataDeNascimento%TYPE;
    BEGIN
        -- Buscar dados do entregador
        SELECT Nome, DataDeNascimento INTO v_Nome, v_DataNascimento
        FROM Entregador WHERE CPF = p_CPF;

        -- Exibir dados
        DBMS_OUTPUT.PUT_LINE('Nome: ' || v_Nome);
        DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || TO_CHAR(v_DataNascimento, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('Idade: ' || Calcular_Idade(v_DataNascimento));
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Entregador não encontrado.');
    END Exibir_Entregador;
/
    -- Implementação da Função
    FUNCTION Calcular_Idade(p_DataNascimento IN DATE) RETURN NUMBER IS
    BEGIN
        RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, p_DataNascimento) / 12);
    END Calcular_Idade;
    /
END Pacote_Entregador;
/
-----------------------------------------------------
--- WHILE LOOP + TYPE + SELECT INTO + IF 
-----------------------------------------------------

DECLARE
    v_idProduto Produto.IdProduto%TYPE; 
    v_nomeProduto Produto.Nome%TYPE;     
    -- contador para começar do primeiro produto
    v_contador NUMBER := 1;           
BEGIN
    WHILE v_contador <= 10  
    LOOP
        SELECT IdProduto, Nome INTO v_idProduto, v_nomeProduto
        FROM Produto
        WHERE IdProduto = v_contador;

        DBMS_OUTPUT.PUT_LINE('Produto ' || v_contador || ': ' || v_nomeProduto);

        IF v_nomeProduto = 'Hot Roll' THEN
            DBMS_OUTPUT.PUT_LINE('Hot Roll encontrado! Encerrando o loop.');
            EXIT;  -- sair do loop
        END IF;
        v_contador := v_contador + 1;
    END LOOP;
END;
/
-----------------------------------------------------
---  CASE WHEN
-----------------------------------------------------

SELECT 
    f.Nome, 
    p.Preco,
    CASE 
        WHEN p.Preco < 10 AND r.Categoria = 'Comida Brasileira' THEN 'Saboroso e Barato'
        WHEN p.Preco < 10 THEN 'Barato'
        WHEN p.Preco BETWEEN 10 AND 50 THEN 'Preço Justo'
        ELSE 'Caro'
    END AS Classificacao
    /
    
FROM Restaurante r
JOIN ProdutoOfertado p ON r.CNPJ_Forn = p.CNPJ_Forn
JOIN Fornecedor f ON f.CNPJ = r.CNPJ_Forn;
