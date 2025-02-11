-----------------------------------------------------
--- RECORD
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

-- Verificando e desfazendo alterações do BD
SELECT * FROM Entregador WHERE CPF = '11122233344';

UPDATE ENTREGADOR SET NOME = 'Diego Fernandes' WHERE CPF = '11122233344';

SELECT * FROM Entregador WHERE CPF = '11122233344';


-----------------------------------------------------
--- IF ELSIF ELSE
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

-- Testando aplicação
INSERT INTO Desconto (CNPJ_Desconto, Data, Porcentagem) VALUES ('76543210000177', TO_DATE('2025-02-13', 'YYYY-MM-DD'), -6.00);
