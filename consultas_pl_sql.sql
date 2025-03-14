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

    -- Loop para percorrer os registros
    LOOP
        -- Buscando uma linha do cursor
        FETCH c_pedido INTO v_id_pedido, v_data, v_hora_entrega, v_cpf_entregador, v_cpf_consumidor, v_cnpj_fornecedor;

        -- Condição de saída do loop se não houver mais registros
        EXIT WHEN c_pedido%NOTFOUND;

        -- Exibir os dados do pedido
        DBMS_OUTPUT.PUT_LINE('Pedido ID: ' || v_id_pedido);
        DBMS_OUTPUT.PUT_LINE('Data: ' || TO_CHAR(v_data, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('Hora da Entrega: ' || NVL(TO_CHAR(v_hora_entrega, 'HH24:MI'), 'Sem horário'));
        DBMS_OUTPUT.PUT_LINE('CPF Entregador: ' || NVL(v_cpf_entregador, 'Sem entregador'));
        DBMS_OUTPUT.PUT_LINE('CPF Consumidor: ' || v_cpf_consumidor);
        DBMS_OUTPUT.PUT_LINE('CNPJ Fornecedor: ' || v_cnpj_fornecedor);
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
END;
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

    -- Implementação da Função
    FUNCTION Calcular_Idade(p_DataNascimento IN DATE) RETURN NUMBER IS
    BEGIN
        RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, p_DataNascimento) / 12);
    END Calcular_Idade;
    
END Pacote_Entregador;
/
-----------------------------------------------------
--- WHILE LOOP + TYPE + SELECT INTO + IF 
-----------------------------------------------------

DECLARE
    -- Declarando um tipo de record para armazenar informações completas do produto
    TYPE t_produto IS RECORD (
        id    Produto.IdProduto%TYPE,
        nome  Produto.Nome%TYPE,
        preco ProdutoOfertado.Preco%TYPE
    );
    
    v_produto t_produto;
    v_contador NUMBER := 1;
    v_max      NUMBER;
BEGIN
    -- Obter o maior IdProduto para definir o limite do loop
    SELECT NVL(MAX(IdProduto), 0) INTO v_max FROM Produto;
    
    DBMS_OUTPUT.PUT_LINE('Iniciando processamento de produtos de 1 até ' || v_max);
    
    WHILE v_contador <= v_max LOOP
        BEGIN
            -- Seleciona dados do produto e seu menor preço a partir da junção entre Produto e ProdutoOfertado
            SELECT p.IdProduto, p.Nome, MIN(po.Preco)
              INTO v_produto.id, v_produto.nome, v_produto.preco
              FROM Produto p
              JOIN ProdutoOfertado po ON p.IdProduto = po.IdProduto
             WHERE p.IdProduto = v_contador
             GROUP BY p.IdProduto, p.Nome;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                -- Se o produto não existir ou não tiver oferta, exibe aviso e pula para o próximo
                DBMS_OUTPUT.PUT_LINE('Produto com Id ' || v_contador || ' não encontrado ou sem oferta.');
                v_contador := v_contador + 1;
                CONTINUE;  -- vai para a próxima iteração
        END;
        
        DBMS_OUTPUT.PUT_LINE('Produto ' || v_produto.id || ': ' || v_produto.nome || ' | Preço: ' || v_produto.preco);
        
        -- Condições complexas para atualizar ou exibir mensagens conforme o nome e o preço
        IF v_produto.nome LIKE '%Roll%' THEN
            DBMS_OUTPUT.PUT_LINE('>> Produto contém "Roll": ' || v_produto.nome);
            IF v_produto.preco < 5 THEN
                UPDATE ProdutoOfertado 
                   SET Preco = 5 
                 WHERE IdProduto = v_produto.id;
                DBMS_OUTPUT.PUT_LINE('   Preço ajustado para 5 (valor mínimo) para o produto ' || v_produto.nome);
            ELSIF v_produto.preco BETWEEN 5 AND 8 THEN
                DBMS_OUTPUT.PUT_LINE('   Preço razoável para o produto ' || v_produto.nome);
            ELSE
                DBMS_OUTPUT.PUT_LINE('   Preço elevado para um produto "Roll": ' || v_produto.preco);
            END IF;
        ELSIF v_produto.preco BETWEEN 10 AND 20 THEN
            DBMS_OUTPUT.PUT_LINE('>> Produto com preço entre 10 e 20: ' || v_produto.nome);
        ELSE
            DBMS_OUTPUT.PUT_LINE('>> Produto ' || v_produto.nome || ' não se enquadra em condições especiais.');
        END IF;
        
        v_contador := v_contador + 1;
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Processamento concluído!');
END;
/

-----------------------------------------------------
---  CASE WHEN
-----------------------------------------------------

SELECT 
    f.Nome AS Fornecedor,
    p.Preco AS PrecoOriginal,
    r.Categoria,
    d.Porcentagem AS Desconto,
    CASE 
        WHEN p.Preco < 10 
             AND r.Categoria = 'Comida Brasileira' 
             AND NVL(d.Porcentagem, 0) >= 5 
             THEN 'Saboroso, Barato e com Bom Desconto'
        WHEN p.Preco < 10 AND r.Categoria = 'Comida Brasileira' THEN 'Saboroso e Barato'
        WHEN p.Preco < 10 THEN 'Barato'
        WHEN p.Preco BETWEEN 10 AND 50 THEN 'Preço Justo'
        WHEN p.Preco > 50 
             AND p.Preco < (SELECT AVG(Preco) FROM ProdutoOfertado) 
             THEN 'Acima da Média, mas Competitivo'
        WHEN p.Preco >= (SELECT AVG(Preco) FROM ProdutoOfertado)
             THEN 'Caro'
        ELSE 'Indefinido'
    END AS Classificacao,
    -- Caso aninhado para verificação adicional do preço em relação à média
    CASE 
        WHEN p.Preco = (SELECT AVG(Preco) FROM ProdutoOfertado) THEN 'Preço exatamente na média'
        ELSE 'Preço fora da média'
    END AS Observacao
FROM Restaurante r
JOIN ProdutoOfertado p ON r.CNPJ_Forn = p.CNPJ_Forn
JOIN Fornecedor f ON f.CNPJ = r.CNPJ_Forn
LEFT JOIN Desconto d ON d.CNPJ_Desconto = f.CNPJ;

-----------------------------------------------------
--- LOOP EXIT WHEN
-----------------------------------------------------

DECLARE
    v_contador NUMBER := 1;
    v_soma     NUMBER := 0;
    v_limite   NUMBER := 100;  -- Limite para a soma
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('Início iteração ' || v_contador || ' | Soma atual: ' || v_soma);
        
        -- Atualiza a soma com uma fórmula (exemplo: soma dos dobrados do contador)
        v_soma := v_soma + (v_contador * 2);
        
        -- Se o contador for múltiplo de 3, verifica se a soma ultrapassou o limite
        IF MOD(v_contador, 3) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Iteração ' || v_contador || ' é múltiplo de 3. Verificando soma...');
            IF v_soma > v_limite THEN
                DBMS_OUTPUT.PUT_LINE('Soma (' || v_soma || ') ultrapassou o limite (' || v_limite || '). Encerrando o loop na iteração ' || v_contador);
                EXIT;
            END IF;
        END IF;
        
        DBMS_OUTPUT.PUT_LINE('Fim iteração ' || v_contador || ' | Soma atualizada: ' || v_soma);
        
        v_contador := v_contador + 1;
        
        -- Saída de segurança: se o contador ultrapassar 20, encerra o loop
        EXIT WHEN v_contador > 20;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Loop finalizado com soma final: ' || v_soma);
END;
/

-----------------------------------------------------
--- IN, OUT e IN OUT (em um PROCEDURE)
-----------------------------------------------------
CREATE OR REPLACE PROCEDURE Aplicar_Desconto_Fornecedor (
    p_CNPJ IN Fornecedor.CNPJ%TYPE,  -- Entrada (fornecedor)
    p_Preco IN OUT NUMBER,  -- Entrada e saída (preço com desconto)
    p_Diferenca OUT NUMBER  -- Apenas saída (diferença entre preços)
) IS
    v_Desconto NUMBER := 0; -- Variável para armazenar o desconto
    v_PrecoOriginal NUMBER; -- Variável para armazenar o preço original
BEGIN
    -- Armazena o preço original antes do desconto
    v_PrecoOriginal := p_Preco;

    -- Busca o desconto do fornecedor se existir
    BEGIN
        SELECT Porcentagem INTO v_Desconto 
        FROM Desconto 
        WHERE CNPJ_Desconto = p_CNPJ;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_Desconto := 0; -- Se não houver desconto, assume 0%
    END;

    -- Aplica o desconto ao preço
    p_Preco := p_Preco * (1 - v_Desconto / 100);

    -- Calcula a diferença entre o preço original e o novo preço
    p_Diferenca := v_PrecoOriginal - p_Preco;

    -- Exibe as informações no console
    DBMS_OUTPUT.PUT_LINE('CNPJ: ' || p_CNPJ);
    DBMS_OUTPUT.PUT_LINE('Preço Original: ' || v_PrecoOriginal);
    DBMS_OUTPUT.PUT_LINE('Desconto Aplicado: ' || v_Desconto || '%');
    DBMS_OUTPUT.PUT_LINE('Novo Preço: ' || p_Preco);
    DBMS_OUTPUT.PUT_LINE('Diferença: ' || p_Diferenca);
END Aplicar_Desconto_Fornecedor;
/
DECLARE
    v_Preco NUMBER := 200.00;  -- Preço original do produto
    v_Diferenca NUMBER;  -- Variável para armazenar a diferença de preços
BEGIN
    -- Chamando a procedure com um CNPJ específico
    Aplicar_Desconto_Fornecedor('11122233344455', v_Preco, v_Diferenca);

    -- Exibir os valores finais
    DBMS_OUTPUT.PUT_LINE('Novo Preço Final: ' || v_Preco);
    DBMS_OUTPUT.PUT_LINE('Diferença de Preço: ' || v_Diferenca);
END;
/