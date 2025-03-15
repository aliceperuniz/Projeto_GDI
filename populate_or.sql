-- INSERINDO ENTREGADORES

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('34567890123', TO_DATE('1995-09-30', 'YYYY-MM-DD'), 'Carlos Lima'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('14408809444', TO_DATE('1986-05-15', 'YYYY-MM-DD'), 'Lucas Silva'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('09445676533', TO_DATE('2000-09-04', 'YYYY-MM-DD'), 'Gabriel Melo'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('32454367899', TO_DATE('1979-12-31', 'YYYY-MM-DD'), 'Miguel Carneiro'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('00912345678', TO_DATE('2001-04-15', 'YYYY-MM-DD'), 'Alvaro Neto'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('03212355678', TO_DATE('1998-05-30', 'YYYY-MM-DD'), 'Bianca Pessoa'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('12487954266', TO_DATE('1995-09-30', 'YYYY-MM-DD'), 'Eduarda Rocha'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('87632145677', TO_DATE('2000-03-27', 'YYYY-MM-DD'), 'Gabriela Ferraz'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('45676555523', TO_DATE('1999-01-14', 'YYYY-MM-DD'), 'Fabiana Gomes'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('24367899911', TO_DATE('2002-06-01', 'YYYY-MM-DD'), 'Julia Carvalho'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('55566677788', TO_DATE('1990-02-02', 'YYYY-MM-DD'), 'Rafael Pereira'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('66677788899', TO_DATE('1985-07-07', 'YYYY-MM-DD'), 'Marcela Souza'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('77788899900', TO_DATE('1988-08-08', 'YYYY-MM-DD'), 'Roberto Costa'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('88899900011', TO_DATE('1992-12-12', 'YYYY-MM-DD'), 'Sandra Dias'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('99900011122', TO_DATE('1975-03-03', 'YYYY-MM-DD'), 'Leonardo Pinto'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('00011122233', TO_DATE('1980-10-10', 'YYYY-MM-DD'), 'Mariana Freitas'));

INSERT INTO tb_entregador (CPF, DataDeNascimento, Nome)
VALUES (tp_entregador('11122233344', TO_DATE('1999-06-06', 'YYYY-MM-DD'), 'Diego Fernandes'));

-- INSERINDO CONSUMIDORES

INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('76543210987', TO_DATE('1995-09-30', 'YYYY-MM-DD'), 'Julia Almeida', '52000000', 'Rua 3', 789, 'Recife', 'Apto 3');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('12312312300', TO_DATE('1969-04-15', 'YYYY-MM-DD'), 'Zenaide Castro', '52061100', 'Rua ABC', 59, 'Recife', 'Apto 2702');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('86586586599', TO_DATE('2004-11-10', 'YYYY-MM-DD'), 'Juliana Valenca', '52061540', 'Rua 17 de Agosto', 2483, 'Recife', 'Apto 2301');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('43245676588', TO_DATE('1987-03-30', 'YYYY-MM-DD'), 'Clarissa Baltar', '32154679', 'Rua da Aurora', 50, 'Recife', 'Apto 301');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('32166677788', TO_DATE('1950-06-12', 'YYYY-MM-DD'), 'Gabriela Lucena', '12343456', 'Rua Real da Torre', 140, 'Recife', 'Apto 2');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('21345676555', TO_DATE('1986-07-02', 'YYYY-MM-DD'), 'Bruno Rezende', '52061540', 'Rua 17 de Agosto', 2720, 'Recife', 'Apto 1802');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('76540000987', TO_DATE('1957-01-03', 'YYYY-MM-DD'), 'Lucas Mendes', '51000000', 'Rua Virginia Loreto', 79, 'Recife', 'Apto 303');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('22543210987', TO_DATE('1994-11-03', 'YYYY-MM-DD'), 'Vinicius Albuquerque', '53400000', 'Rua das Gracas', 80, 'Recife', 'Apto 1401');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('98765432112', TO_DATE('1991-01-01', 'YYYY-MM-DD'), 'Renata Martins', '52012345', 'Avenida Brasil', 100, 'Recife', 'Casa 1');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('11223344556', TO_DATE('2003-03-03', 'YYYY-MM-DD'), 'André Costa', '52054321', 'Rua da Paz', 45, 'Recife', 'Apto 101');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('22334455667', TO_DATE('1982-02-02', 'YYYY-MM-DD'), 'Carla Mendes', '52011122', 'Avenida Central', 101, 'Recife', 'Casa 12');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('33445566778', TO_DATE('1978-04-04', 'YYYY-MM-DD'), 'Andressa Lima', '52022233', 'Rua das Flores', 202, 'Recife', 'Apto 303');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('44556677889', TO_DATE('1993-03-03', 'YYYY-MM-DD'), 'Felipe Cardoso', '52033344', 'Travessa da Luz', 303, 'Recife', 'Casa 2');
INSERT INTO tb_consumidor (CPF, DataDeNascimento, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('55667788990', TO_DATE('2000-08-08', 'YYYY-MM-DD'), 'Marcelo Souza', '52044455', 'Alameda Santos', 404, 'Recife', 'Apto 405');

-- INSERINDO FORNECEDOR

INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('34567890000122', 'Padaria Pão Quente', '52000000', 'Rua C', 30, 'Recife', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('00056789000111', 'Frutaria Verd Campo', '52111000', 'Rua Silvana Salazar', 45, 'Recife', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('23456756700111', 'Padaria Casa Forte', '52061540', 'Rua 17 de Agosto', 1211, 'Recife', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('23999989000111', 'DOC', '51110000', 'Rua Irma Maria David', 200, 'Recife', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('23999555000111', 'Mix Matheus', '52340000', 'Rua Rui Barbosa', 144, 'Recife', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('23456789000111', 'Padaria Pão Quente', '52000000', 'Rua C', 30, 'Recife', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('23456000000111', 'Kojima', '41230000', 'Rua Antonio de Souza', 300, 'Recife', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('23456289000111', 'Tigres da Serra', '52000000', 'Rua Vicente', 60, 'Recife', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('32145678900111', 'Açougue Silva', '52110000', 'Rua Litorânea', 33, 'Olinda', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('76543210000111', 'Cozinha Gourmet', '52340000', 'Rua das Palmeiras', 77, 'Recife', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('12398765432111', 'Lava Jato Clean', '52022000', 'Rua da Paz', 90, 'Jaboatão', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('87965432198711', 'Armazém do Frango', '52066000', 'Avenida Recife', 100, 'Recife', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('54321567891011', 'Mercado São José', '52120000', 'Rua Floriano Peixoto', 40, 'Recife', '');
INSERT INTO tb_fornecedor (CNPJ, Nome, CEP, Rua, Numero, Cidade, Complemento) VALUES ('65432109876511', 'Supermercado Barato', '52033000', 'Avenida dos Coqueiros', 150, 'Recife', '');
