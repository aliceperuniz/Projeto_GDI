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