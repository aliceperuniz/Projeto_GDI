-- Povoamento da tabela tb_entregador
INSERT INTO tb_entregador VALUES (tp_entregador('11111111111', TO_DATE('1985-06-15','YYYY-MM-DD'), 'Carlos Pereira',
    varray_telefoneEntregador(tp_telefoneEntregador('51', '987871677'), tp_telefoneEntregador('81', '987783453'), tp_telefoneEntregador('81', '987783333'))));
INSERT INTO tb_entregador VALUES (tp_entregador('22222222222', TO_DATE('1990-03-22','YYYY-MM-DD'), 'Mariana Silva',
        varray_telefoneEntregador(tp_telefoneEntregador('71', '999999999'), tp_telefoneEntregador('71', '999999998'),tp_telefoneEntregador('71', '999999997'), tp_telefoneEntregador('71', '999999996'),tp_telefoneEntregador('71', '999999995'))));
INSERT INTO tb_entregador VALUES (tp_entregador('33333333333', TO_DATE('1978-11-30','YYYY-MM-DD'), 'João Souza',
            varray_telefoneEntregador(tp_telefoneEntregador('84', '999999995'))));
INSERT INTO tb_entregador VALUES (tp_entregador('44444444444', TO_DATE('1988-02-10','YYYY-MM-DD'), 'Ana Costa',
        varray_telefoneEntregador(tp_telefoneEntregador('87', '999999997'), tp_telefoneEntregador('87', '999999996'),tp_telefoneEntregador('87', '999999995'))));
INSERT INTO tb_entregador VALUES (tp_entregador('55555555555', TO_DATE('1992-12-01','YYYY-MM-DD'), 'Bruno Lima',
            varray_telefoneEntregador(tp_telefoneEntregador('85', '999999987'), tp_telefoneEntregador('71', '999999998'),tp_telefoneEntregador('71', '999999997'), tp_telefoneEntregador('71', '999999996'),tp_telefoneEntregador('71', '999999995'))));
INSERT INTO tb_entregador VALUES (tp_entregador('77777777777', TO_DATE('1975-04-18','YYYY-MM-DD'), 'Ricardo Alves',
            varray_telefoneEntregador(tp_telefoneEntregador('81', '999999999'), tp_telefoneEntregador('81', '999999998'),tp_telefoneEntregador('81', '999999997'), tp_telefoneEntregador('81', '999999996'),tp_telefoneEntregador('81', '999999995'))));
INSERT INTO tb_entregador VALUES (tp_entregador('88888888888', TO_DATE('1995-09-09','YYYY-MM-DD'), 'Beatriz Mendes',
            varray_telefoneEntregador(tp_telefoneEntregador('81', '999956997'), tp_telefoneEntregador('81', '999975996'),tp_telefoneEntregador('81', '999999995'))));
INSERT INTO tb_entregador VALUES (tp_entregador('99999999999', TO_DATE('1983-08-20','YYYY-MM-DD'), 'Luiz Martins',
            varray_telefoneEntregador(tp_telefoneEntregador('81', '999999999'))));
INSERT INTO tb_entregador VALUES (tp_entregador('10101010101', TO_DATE('1991-05-05','YYYY-MM-DD'), 'Paula Fernandes',
            varray_telefoneEntregador(tp_telefoneEntregador('83', '999999999'), tp_telefoneEntregador('83', '999999998'),tp_telefoneEntregador('83', '999999997'), tp_telefoneEntregador('83', '999999996'),tp_telefoneEntregador('83', '999999995'))));
INSERT INTO tb_entregador VALUES (tp_entregador('12121212121', TO_DATE('1987-10-12','YYYY-MM-DD'), 'Eduardo Nunes',
            varray_telefoneEntregador(tp_telefoneEntregador('81', '999999999'), tp_telefoneEntregador('81', '999999998'),tp_telefoneEntregador('81', '999999997'), tp_telefoneEntregador('81', '999999996'),tp_telefoneEntregador('81', '999999995'))));
INSERT INTO tb_entregador VALUES (tp_entregador('13131313131', TO_DATE('1989-07-30','YYYY-MM-DD'), 'Sonia Ribeiro',
            varray_telefoneEntregador(tp_telefoneEntregador('81', '999339999'), tp_telefoneEntregador('81', '994599998'), tp_telefoneEntregador('83', '999999996'),tp_telefoneEntregador('83', '999959995'))));
INSERT INTO tb_entregador VALUES (tp_entregador('14141414141', TO_DATE('1979-03-17','YYYY-MM-DD'), 'Fernando Dias',
            varray_telefoneEntregador(tp_telefoneEntregador('81', '999999997'), tp_telefoneEntregador('81', '999999996'),tp_telefoneEntregador('81', '999999995'))));
INSERT INTO tb_entregador VALUES (tp_entregador('15151515151', TO_DATE('1993-12-31','YYYY-MM-DD'), 'Gabriela Teixeira',
            varray_telefoneEntregador(tp_telefoneEntregador('81', '999999999'), tp_telefoneEntregador('81', '999999998'),tp_telefoneEntregador('81', '999999997'), tp_telefoneEntregador('81', '999999996'),tp_telefoneEntregador('81', '999999995'))));


-- Povoamento da tabela tb_consumidor
INSERT INTO tb_consumidor VALUES (tp_consumidor('16161616161', TO_DATE('1985-04-12','YYYY-MM-DD'), 'Roberto Silva', '12345678', 'Rua A', 100, 'São Paulo', 'Apto 101',
    varray_telefoneConsumidor(tp_telefoneConsumidor('11', '999999999'), tp_telefoneConsumidor('11', '987872188'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('17171717171', TO_DATE('1990-08-23','YYYY-MM-DD'), 'Carla Souza', '87654321', 'Avenida B', 200, 'Rio de Janeiro', 'Casa',
    varray_telefoneConsumidor(tp_telefoneConsumidor('21', '999999999'), tp_telefoneConsumidor('21', '987872188'), tp_telefoneConsumidor('21', '987872188'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('18181818181', TO_DATE('1977-02-14','YYYY-MM-DD'), 'Marcelo Oliveira', '11223344', 'Travessa C', 50, 'Curitiba', 'Fundos',
    varray_telefoneConsumidor(tp_telefoneConsumidor('41', '999999999'), tp_telefoneConsumidor('41', '987872188'), tp_telefoneConsumidor('41', '987872188'), tp_telefoneConsumidor('41', '987872188'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('19191919191', TO_DATE('1982-12-05','YYYY-MM-DD'), 'Fernanda Alves', '44332211', 'Rua D', 75, 'Porto Alegre', 'Bloco 2',
    varray_telefoneConsumidor(tp_telefoneConsumidor('51', '999999999'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('20202020202', TO_DATE('1995-07-19','YYYY-MM-DD'), 'Aline Pereira', '55667788', 'Av E', 150, 'Belo Horizonte', 'Apto 303',
    varray_telefoneConsumidor(tp_telefoneConsumidor('31', '999999999'), tp_telefoneConsumidor('31', '987872188'), tp_telefoneConsumidor('31', '987872188'), tp_telefoneConsumidor('31', '987872188'), tp_telefoneConsumidor('31', '987872188'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('21212121212', TO_DATE('1988-03-11','YYYY-MM-DD'), 'Ricardo Lima', '66778899', 'Rua F', 80, 'Salvador', 'Casa',
    varray_telefoneConsumidor(tp_telefoneConsumidor('71', '999999999'), tp_telefoneConsumidor('71', '987872188'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('23232323232', TO_DATE('1979-09-27','YYYY-MM-DD'), 'Juliana Cardoso', '77889900', 'Av G', 95, 'Fortaleza', 'Apto 12',
    varray_telefoneConsumidor(tp_telefoneConsumidor('85', '999999999'), tp_telefoneConsumidor('85', '987872188'), tp_telefoneConsumidor('85', '987872188'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('24242424242', TO_DATE('1991-11-15','YYYY-MM-DD'), 'Eduardo Martins', '88990011', 'Rua H', 60, 'Recife', 'Cobertura',
    varray_telefoneConsumidor(tp_telefoneConsumidor('81', '999999999'), tp_telefoneConsumidor('81', '987872188'), tp_telefoneConsumidor('81', '987872188'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('25252525252', TO_DATE('1983-06-30','YYYY-MM-DD'), 'Vanessa Costa', '99001122', 'Travessa I', 30, 'Florianópolis', 'Loja',
    varray_telefoneConsumidor(tp_telefoneConsumidor('48', '999999999'), tp_telefoneConsumidor('48', '987872188'), tp_telefoneConsumidor('48', '987872188'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('26262626262', TO_DATE('1994-01-20','YYYY-MM-DD'), 'Renato Gomes', '10101010', 'Av J', 210, 'Curitiba', 'Casa 2',
    varray_telefoneConsumidor(tp_telefoneConsumidor('41', '999999999'), tp_telefoneConsumidor('41', '987872188'), tp_telefoneConsumidor('41', '987872188'), tp_telefoneConsumidor('41', '987872188'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('27272727272', TO_DATE('1987-05-05','YYYY-MM-DD'), 'Simone Ribeiro', '20202020', 'Rua K', 110, 'São Paulo', 'Apto 202',
    varray_telefoneConsumidor(tp_telefoneConsumidor('11', '999999999'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('28282828282', TO_DATE('1992-10-10','YYYY-MM-DD'), 'Fabio Moreira', '30303030', 'Av L', 130, 'Rio de Janeiro', 'Fundos',
    varray_telefoneConsumidor(tp_telefoneConsumidor('21', '999999999'), tp_telefoneConsumidor('21', '987872188'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('29292929292', TO_DATE('1980-04-04','YYYY-MM-DD'), 'Patricia Souza', '40404040', 'Rua M', 90, 'Porto Alegre', 'Apto 5',
    varray_telefoneConsumidor(tp_telefoneConsumidor('51', '999999999'), tp_telefoneConsumidor('51', '987872188'), tp_telefoneConsumidor('51', '987872188'))));
INSERT INTO tb_consumidor VALUES (tp_consumidor('30303030303', TO_DATE('1976-08-08','YYYY-MM-DD'), 'Diego Fernandes', '50505050', 'Av N', 55, 'Belo Horizonte', 'Casa 3',
    varray_telefoneConsumidor(tp_telefoneConsumidor('31', '999999999'), tp_telefoneConsumidor('31', '987872188'), tp_telefoneConsumidor('31', '987872188'))));

-- Povoamento da tabela tb_fornecedor
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('11111111111111', 'Fornecedor A', '11111111', 'Rua Forn A', 10, 'Curitiba', 'Centro',
    TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-01-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-01-15','YYYY-MM-DD'), 0.10), tp_desconto(TO_DATE('2025-01-30','YYYY-MM-DD'), 0.15)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'))
    ));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('22222222222222', 'Fornecedor B', '22222222', 'Av Forn B', 20, 'Florianópolis', 'Bairro',
    TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-01-01','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '921672167'))
    ));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('33333333333333', 'Fornecedor C', '33333333', 'Rua Forn C', 30, 'São Paulo', 'Industrial',
    TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-02-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-11-15','YYYY-MM-DD'), 0.10), tp_desconto(TO_DATE('2025-11-30','YYYY-MM-DD'), 0.55)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'))
    ));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('44444444444444', 'Fornecedor D', '44444444', 'Av Forn D', 40, 'Rio de Janeiro', 'Centro',
    TP_DESCONTO_NT(),  varray_telefoneFornecedor()));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('55555555555555', 'Fornecedor E', '55555555', 'Rua Forn E', 50, 'Belo Horizonte', 'Zona Sul',
    TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-01-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-01-15','YYYY-MM-DD'), 0.10), tp_desconto(TO_DATE('2025-01-30','YYYY-MM-DD'), 0.15)),
    varray_telefoneFornecedor()
    ));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('66666666666666', 'Fornecedor F', '66666666', 'Av Forn F', 60, 'Porto Alegre', 'Centro',
    TP_DESCONTO_NT(),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'))
    ));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('77777777777777', 'Fornecedor G', '77777777', 'Rua Forn G', 70, 'Salvador', 'Industrial',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-06-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-06-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '933344455'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('88888888888888', 'Fornecedor H', '88888888', 'Av Forn H', 80, 'Recife', 'Bairro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-07-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-07-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('99999999999999', 'Fornecedor I', '99999999', 'Rua Forn I', 90, 'Fortaleza', 'Centro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-08-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-08-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('10101010101010', 'Fornecedor J', '10101010', 'Av Forn J', 100, 'Curitiba', 'Zona Leste',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('11111111111112', 'Fornecedor K', '12121212', 'Rua Forn K', 110, 'Florianópolis', 'Bairro Alto',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10), tp_desconto(TO_DATE('2025-09-30','YYYY-MM-DD'), 0.15)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('12121212121212', 'Fornecedor L', '13131313', 'Av Forn L', 120, 'São Paulo', 'Centro',
  TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('13131313131313', 'Fornecedor M', '14141414', 'Rua Forn M', 130, 'Rio de Janeiro', 'Zona Norte',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('14141414141414', 'Fornecedor N', '15151515', 'Av Forn N', 140, 'Belo Horizonte', 'Industrial',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('15151515151515', 'Fornecedor O', '16161616', 'Rua Forn O', 150, 'Porto Alegre', 'Zona Sul',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'), tp_telefoneFornecedor('81', '987444444'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('16161616161616', 'Fornecedor P', '17171717', 'Av Forn P', 160, 'Recife', 'Centro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('17171717171717', 'Fornecedor Q', '18181818', 'Rua Forn Q', 170, 'Salvador', 'Bairro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('18181818181818', 'Fornecedor R', '19191919', 'Av Forn R', 180, 'Fortaleza', 'Industrial',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('19191919191919', 'Fornecedor S', '20202020', 'Rua Forn S', 190, 'Curitiba', 'Zona Norte',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('20202020202020', 'Fornecedor T', '21212121', 'Av Forn T', 200, 'Florianópolis', 'Centro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('21212121212121', 'Fornecedor U', '22222222', 'Rua Forn U', 210, 'São Paulo', 'Bairro', 
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('22222222222223', 'Fornecedor V', '23232323', 'Av Forn V', 220, 'Rio de Janeiro', 'Industrial',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('23232323232323', 'Fornecedor W', '24242424', 'Rua Forn W', 230, 'Belo Horizonte', 'Zona Oeste',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('24242424242424', 'Fornecedor X', '25252525', 'Av Forn X', 240, 'Porto Alegre', 'Centro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('25252525252525', 'Fornecedor Y', '26262626', 'Rua Forn Y', 250, 'Recife', 'Bairro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('26262626262626', 'Fornecedor Z', '27272727', 'Av Forn Z', 260, 'Salvador', 'Industrial',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('27272727272727', 'Fornecedor AA', '28282828', 'Rua Forn AA', 270, 'Fortaleza', 'Centro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_fornecedor VALUES (tp_fornecedor('28282828282828', 'Fornecedor AB', '29292929', 'Av Forn AB', 280, 'Curitiba', 'Zona Leste',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.12)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '936549876'))));

-- Povoamento da tabela tb_supermercado
INSERT INTO tb_supermercado VALUES (tp_supermercado('11111111111111', 'Supermercado X', '55555555', 'Rua X', 101, 'Porto Alegre', 'Zona 1',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-01-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-01-15','YYYY-MM-DD'), 0.10)),
  varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_supermercado VALUES (tp_supermercado('22222222222222', 'Supermercado Y', '66666666', 'Av Y', 102, 'Curitiba', 'Zona 2',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-01-01','YYYY-MM-DD'), 0.10)),
  varray_telefoneFornecedor(tp_telefoneFornecedor('81', '921672167'))));
INSERT INTO tb_supermercado VALUES (tp_supermercado('33333333333333', 'Supermercado Z', '77777777', 'Rua Z', 103, 'São Paulo', 'Centro',
 TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-02-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-11-15','YYYY-MM-DD'), 0.10)),
  varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_supermercado VALUES (tp_supermercado('44444444444444', 'Supermercado Alfa', '88888888', 'Av Alfa', 104, 'Rio de Janeiro', 'Bairro',
TP_DESCONTO_NT(),  varray_telefoneFornecedor()));
INSERT INTO tb_supermercado VALUES (tp_supermercado('55555555555555', 'Supermercado Beta', '99999999', 'Rua Beta', 105, 'Belo Horizonte', 'Zona Sul',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-01-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-01-15','YYYY-MM-DD'), 0.10), tp_desconto(TO_DATE('2025-01-30','YYYY-MM-DD'), 0.15)),
  varray_telefoneFornecedor()));
INSERT INTO tb_supermercado VALUES (tp_supermercado('66666666666666', 'Supermercado Gama', '10101010', 'Av Gama', 106, 'Florianópolis', 'Industrial',
TP_DESCONTO_NT(),
  varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_supermercado VALUES (tp_supermercado('77777777777777', 'Supermercado Delta', '11111111', 'Rua Delta', 107, 'Recife', 'Centro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-06-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-06-15','YYYY-MM-DD'), 0.10)),
  varray_telefoneFornecedor(tp_telefoneFornecedor('81', '933344455'))));
INSERT INTO tb_supermercado VALUES (tp_supermercado('88888888888888', 'Supermercado Épsilon', '12121212', 'Av Épsilon', 108, 'Salvador', 'Bairro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-07-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-07-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_supermercado VALUES (tp_supermercado('99999999999999', 'Supermercado Zeta', '13131313', 'Rua Zeta', 109, 'Fortaleza', 'Industrial',
tP_DESCONTO_NT(tp_desconto(TO_DATE('2025-08-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-08-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_supermercado VALUES (tp_supermercado('10101010101010', 'Supermercado Eta', '14141414', 'Av Eta', 110, 'Porto Alegre', 'Zona Leste',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_supermercado VALUES (tp_supermercado('11111111111112', 'Supermercado Theta', '15151515', 'Rua Theta', 111, 'Curitiba', 'Centro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10), tp_desconto(TO_DATE('2025-09-30','YYYY-MM-DD'), 0.15)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987878787'), tp_telefoneFornecedor('81', '987444444'), tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_supermercado VALUES (tp_supermercado('12121212121212', 'Supermercado Iota', '16161616', 'Av Iota', 112, 'São Paulo', 'Bairro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_supermercado VALUES (tp_supermercado('13131313131313', 'Supermercado Kappa', '17171717', 'Rua Kappa', 113, 'Rio de Janeiro', 'Industrial',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));
INSERT INTO tb_supermercado VALUES (tp_supermercado('14141414141414', 'Supermercado Lambda', '18181818', 'Av Lambda', 114, 'Belo Horizonte', 'Zona Oeste',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'))));

-- Povoamento da tabela tb_restaurante
INSERT INTO tb_restaurante VALUES (tp_restaurante('15151515151515', 'Restaurante A', '19191919', 'Rua R1', 201, 'São Paulo', 'Próximo ao parque',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'), tp_telefoneFornecedor('81', '987444444'), tp_telefoneFornecedor('81', '987444444')),'Italiano'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('16161616161616', 'Restaurante B', '20202020', 'Av R2', 202, 'Rio de Janeiro', 'Centro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444')),'Churrascaria'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('17171717171717', 'Restaurante C', '21212121', 'Rua R3', 203, 'Belo Horizonte', 'Loja',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444')), 'Mexicano'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('18181818181818', 'Restaurante D', '22222222', 'Av R4', 204, 'Curitiba', 'Apto',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444')), 'Japones'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('19191919191919', 'Restaurante E', '23232323', 'Rua R5', 205, 'Fortaleza', 'Casa',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444')), 'Vegano'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('20202020202020', 'Restaurante F', '24242424', 'Av R6', 206, 'Recife', 'Bloco',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444')), 'Italiano'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('21212121212121', 'Restaurante G', '25252525', 'Rua R7', 207, 'Salvador', 'Fundos',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444'), tp_telefoneFornecedor('81', '987444444')), 'Chines'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('22222222222223', 'Restaurante H', '26262626', 'Av R8', 208, 'Florianópolis', 'Apartamento',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444')), 'Brasileiro'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('23232323232323', 'Restaurante I', '27272727', 'Rua R9', 209, 'Porto Alegre', 'Loja',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444')), 'Tailandês'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('24242424242424', 'Restaurante J', '28282828', 'Av R10', 210, 'São Paulo', 'Casa',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444')), 'Mediterrâneo'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('25252525252525', 'Restaurante K', '29292929', 'Rua R11', 211, 'Rio de Janeiro', 'Centro',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444')), 'Indiano'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('26262626262626', 'Restaurante L', '30303030', 'Av R12', 212, 'Belo Horizonte', 'Zona Sul',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444')), 'Frances'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('27272727272727', 'Restaurante M', '31313131', 'Rua R13', 213, 'Curitiba', 'Próximo ao parque',
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.05), tp_desconto(TO_DATE('2025-09-15','YYYY-MM-DD'), 0.10)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '987444444')), 'Pizzaria'));
INSERT INTO tb_restaurante VALUES (tp_restaurante('28282828282828', 'Restaurante N', '32323232', 'Av R14', 214, 'Fortaleza', 'Industrial', 
TP_DESCONTO_NT(tp_desconto(TO_DATE('2025-09-01','YYYY-MM-DD'), 0.12)),
    varray_telefoneFornecedor(tp_telefoneFornecedor('81', '936549876')), 'Hamburgueria'));

-- Povoamento da tabela tb_produto
INSERT INTO tb_produto VALUES (tp_produto(1, 'Arroz'));
INSERT INTO tb_produto VALUES (tp_produto(2, 'Feijão'));
INSERT INTO tb_produto VALUES (tp_produto(3, 'Macarrão'));
INSERT INTO tb_produto VALUES (tp_produto(4, 'Açúcar'));
INSERT INTO tb_produto VALUES (tp_produto(5, 'Sal'));
INSERT INTO tb_produto VALUES (tp_produto(6, 'Café'));
INSERT INTO tb_produto VALUES (tp_produto(7, 'Farinha'));
INSERT INTO tb_produto VALUES (tp_produto(8, 'Leite'));
INSERT INTO tb_produto VALUES (tp_produto(9, 'Ovo'));
INSERT INTO tb_produto VALUES (tp_produto(10, 'Manteiga'));
INSERT INTO tb_produto VALUES (tp_produto(11, 'Tomate'));
INSERT INTO tb_produto VALUES (tp_produto(12, 'Batata'));
INSERT INTO tb_produto VALUES (tp_produto(13, 'Cebola'));
INSERT INTO tb_produto VALUES (tp_produto(14, 'Alface'));

-- Povoamento da tabela tb_produtoOfertado
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 1),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '11111111111111'),
  10.50
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 2),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '22222222222222'),
  8.75
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 3),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '33333333333333'),
  5.30
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 4),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '44444444444444'),
  3.20
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 5),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '55555555555555'),
  2.10
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 6),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '66666666666666'),
  15.00
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 7),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '77777777777777'),
  4.50
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 8),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '88888888888888'),
  6.80
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 9),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '99999999999999'),
  1.99
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 10),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '10101010101010'),
  12.00
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 11),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '11111111111112'),
  7.25
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 11),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '11111111111111'),
  7.25
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 12),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '12121212121212'),
  9.90
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 13),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '13131313131313'),
  11.50
);
INSERT INTO tb_produtoOfertado VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 14),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '14141414141414'),
  13.30
);

-- Povoamento da tabela tb_pedido
INSERT INTO tb_pedido VALUES (
  1,
  TO_DATE('2025-03-20','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-20 10:30:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '11111111111'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '16161616161'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '11111111111111')
);
INSERT INTO tb_pedido VALUES (
  2,
  TO_DATE('2025-03-21','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-21 11:00:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '22222222222'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '17171717171'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '22222222222222')
);
INSERT INTO tb_pedido VALUES (
  3,
  TO_DATE('2025-03-22','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-22 12:15:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '33333333333'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '18181818181'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '33333333333333')
);
INSERT INTO tb_pedido VALUES (
  4,
  TO_DATE('2025-03-23','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-23 13:45:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '44444444444'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '19191919191'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '44444444444444')
);
INSERT INTO tb_pedido VALUES (
  5,
  TO_DATE('2025-03-24','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-24 09:20:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '55555555555'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '20202020202'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '55555555555555')
);
INSERT INTO tb_pedido VALUES (
  6,
  TO_DATE('2025-03-25','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-25 14:10:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '66666666666'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '21212121212'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '66666666666666')
);
INSERT INTO tb_pedido VALUES (
  7,
  TO_DATE('2025-03-26','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-26 15:05:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '77777777777'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '23232323232'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '77777777777777')
);
INSERT INTO tb_pedido VALUES (
  8,
  TO_DATE('2025-03-27','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-27 16:30:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '88888888888'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '24242424242'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '88888888888888')
);
INSERT INTO tb_pedido VALUES (
  9,
  TO_DATE('2025-03-28','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-28 08:15:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '99999999999'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '25252525252'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '99999999999999')
);
INSERT INTO tb_pedido VALUES (
  10,
  TO_DATE('2025-03-29','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-29 10:00:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '10101010101'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '26262626262'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '10101010101010')
);
INSERT INTO tb_pedido VALUES (
  11,
  TO_DATE('2025-03-30','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-30 11:45:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '12121212121'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '27272727272'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '11111111111112')
);
INSERT INTO tb_pedido VALUES (
  12,
  TO_DATE('2025-03-31','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-03-31 12:30:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '13131313131'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '28282828282'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '12121212121212')
);
INSERT INTO tb_pedido VALUES (
  13,
  TO_DATE('2025-04-01','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-04-01 13:15:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '14141414141'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '29292929292'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '13131313131313')
);
INSERT INTO tb_pedido VALUES (
  14,
  TO_DATE('2025-04-02','YYYY-MM-DD'),
  TO_TIMESTAMP('2025-04-02 14:00:00','YYYY-MM-DD HH24:MI:SS'),
  (SELECT REF(e) FROM tb_entregador e WHERE e.CPF = '15151515151'),
  (SELECT REF(c) FROM tb_consumidor c WHERE c.CPF = '30303030303'),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '14141414141414')
);

-- Povoamento da tabela tb_contem
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 1 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 1) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '11111111111111' FETCH FIRST 1 ROW ONLY)
);

INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 1 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 11) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '11111111111111' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 2 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 2) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '22222222222222' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 3 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 3) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '33333333333333' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 4 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 4) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '44444444444444' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 5 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 5) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '55555555555555' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 6 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 6) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '66666666666666' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 7 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 7) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '77777777777777' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 8 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 8) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '88888888888888' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 9 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 9) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '99999999999999' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 10 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 10) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '10101010101010' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 11 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 11) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '11111111111112' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 12 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 12) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '12121212121212' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 13 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 13) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '13131313131313' FETCH FIRST 1 ROW ONLY)
);
INSERT INTO tb_contem VALUES (
  (SELECT REF(ped) FROM tb_pedido ped WHERE ped.IdPedido = 14 FETCH FIRST 1 ROW ONLY),
  (SELECT REF(po) FROM tb_produtoOfertado po 
   WHERE po.IdProduto = (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 14) FETCH FIRST 1 ROW ONLY),
  (SELECT REF(f) FROM tb_fornecedor f WHERE f.CNPJ = '14141414141414' FETCH FIRST 1 ROW ONLY)
);
-- Povoamento da tabela tb_componente
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 1),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 2)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 2),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 3)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 3),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 4)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 4),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 5)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 5),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 6)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 6),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 7)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 7),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 8)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 8),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 9)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 9),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 10)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 10),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 11)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 11),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 12)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 12),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 13)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 13),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 14)
);
INSERT INTO tb_componente VALUES (
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 14),
  (SELECT REF(p) FROM tb_produto p WHERE p.IdProduto = 1)
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000001',                             
    'Restaurante Saboroso',                       
    '12345678',                                   
    'Rua dos Sabores',                            
    100,                                          
    'Cidade Exemplo',                              
    'Apto 101',                                    
    'Comida Italiana',                             
    varray_pratos(
      tp_prato('Massa à Carbonara', 35.90),
      tp_prato('Pizza Margherita', 29.90)
    ),
    nt_historicoCardapios(
      tp_historicoCardapio(TO_DATE('2025-01-15','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Lasagna', 40.00),
                             tp_prato('Tiramisu', 20.00)
                           )),
      tp_historicoCardapio(TO_DATE('2025-02-10','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Risotto', 38.50)
                           ))
    )
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000002',
    'Bistrô da Vila',
    '23456789',
    'Avenida Central',
    200,
    'Vila Nova',
    'Loja 5',
    'Bistrô Francês',
    varray_pratos(
      tp_prato('Coq au Vin', 45.00),
      tp_prato('Bouillabaisse', 50.00),
      tp_prato('Crème Brûlée', 18.00)
    ),
    nt_historicoCardapios()
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000003',
    'Sabor Nordestino',
    '34567890',
    'Rua do Sol',
    150,
    'Fortaleza',
    'Casa 10',
    'Comida Nordestina',
    varray_pratos(),
    nt_historicoCardapios(
      tp_historicoCardapio(TO_DATE('2025-03-05','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Baião de Dois', 25.00)
                           ))
    )
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000004',
    'Sushi & Sashimi',
    '45678901',
    'Rua da Pesca',
    75,
    'Osaka',
    'Andar 1',
    'Comida Japonesa',
    varray_pratos(
      tp_prato('Sushi Especial', 60.00),
      tp_prato('Sashimi de Salmão', 55.00)
    ),
    nt_historicoCardapios(
      tp_historicoCardapio(TO_DATE('2025-01-20','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Tempura', 40.00)
                           ))
    )
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000005',
    'La Piadina',
    '56789012',
    'Rua dos Sabores Italianos',
    88,
    'Roma',
    'Próximo à Fontana',
    'Culinária Italiana',
    varray_pratos(
      tp_prato('Piadina Tradicional', 22.50)
    ),
    nt_historicoCardapios(
      tp_historicoCardapio(TO_DATE('2025-02-05','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Focaccia', 15.00)
                           )),
      tp_historicoCardapio(TO_DATE('2025-03-10','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Calzone', 28.00)
                           ))
    )
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000006',
    'Vegano Vitta',
    '67890123',
    'Rua Verde',
    310,
    'São Paulo',
    'Bloco B',
    'Cozinha Vegana',
    varray_pratos(),
    nt_historicoCardapios()
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000007',
    'Churrascaria Gaúcha',
    '78901234',
    'Avenida dos Pampas',
    450,
    'Porto Alegre',
    'Fundos',
    'Churrasco',
    varray_pratos(
      tp_prato('Picanha', 75.00),
      tp_prato('Costela', 65.00),
      tp_prato('Fraldinha', 55.00)
    ),
    nt_historicoCardapios(
      tp_historicoCardapio(TO_DATE('2025-01-10','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Linguiça', 30.00)
                           )),
      tp_historicoCardapio(TO_DATE('2025-02-15','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Maminha', 70.00),
                             tp_prato('Alcatra', 68.00)
                           )),
      tp_historicoCardapio(TO_DATE('2025-03-01','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Costela', 65.00)
                           ))
    )
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000008',
    'Cantina do Chef',
    '89012345',
    'Rua da Tradição',
    210,
    'Florença',
    'Casa 3',
    'Culinária Toscana',
    varray_pratos(
      tp_prato('Ragu de Carne', 42.00),
      tp_prato('Pappardelle', 37.50)
    ),
    nt_historicoCardapios(
      tp_historicoCardapio(TO_DATE('2025-02-20','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Bruschetta', 12.00),
                             tp_prato('Minestrone', 20.00),
                             tp_prato('Gelato', 15.00)
                           ))
    )
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000009',
    'Casa de Sabores',
    '90123456',
    'Alameda dos Aromas',
    320,
    'Lisboa',
    'Edifício A',
    'Cozinha Portuguesa',
    varray_pratos(
      tp_prato('Bacalhau à Brás', 50.00),
      tp_prato('Arroz de Marisco', 60.00),
      tp_prato('Francesinha', 55.00),
      tp_prato('Pastel de Nata', 10.00)
    ),
    nt_historicoCardapios(
      tp_historicoCardapio(TO_DATE('2025-01-25','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Caldo Verde', 18.00),
                             tp_prato('Bifana', 22.00)
                           )),
      tp_historicoCardapio(TO_DATE('2025-03-05','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Leitão Assado', 65.00)
                           ))
    )
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000010',
    'Sabor Oriental',
    '01234567',
    'Travessa dos Sabores',
    135,
    'Beijing',
    'Próximo ao Mercado',
    'Culinária Chinesa',
    varray_pratos(
      tp_prato('Pato Laqueado', 70.00)
    ),
    nt_historicoCardapios(
      tp_historicoCardapio(TO_DATE('2025-02-28','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Dim Sum', 25.00)
                           ))
    )
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000011',
    'La Boulangerie',
    '11223344',
    'Rua dos Pães',
    55,
    'Paris',
    'Apt 7B',
    'Padaria Francesa',
    varray_pratos(
      tp_prato('Croissant', 5.50),
      tp_prato('Baguette', 3.00)
    ),
    nt_historicoCardapios()
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000012',
    'El Mexicano',
    '22334455',
    'Avenida Cinco de Mayo',
    210,
    'Cidade do México',
    'Conjunto 12',
    'Comida Mexicana',
    varray_pratos(),
    nt_historicoCardapios(
      tp_historicoCardapio(TO_DATE('2025-01-30','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Tacos', 15.00)
                           )),
      tp_historicoCardapio(TO_DATE('2025-02-25','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Enchiladas', 18.00),
                             tp_prato('Guacamole', 10.00)
                           ))
    )
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000013',
    'Fusion 360',
    '33445566',
    'Rua das Culturas',
    78,
    'Dubai',
    'Suite 300',
    'Culinária Fusion',
    varray_pratos(
      tp_prato('Burger de Quinoa', 30.00),
      tp_prato('Tacos de Salmão', 35.00),
      tp_prato('Sushi Burrito', 32.00)
    ),
    nt_historicoCardapios(
      tp_historicoCardapio(TO_DATE('2025-03-01','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Ramen Vegano', 28.00),
                             tp_prato('Tempura de Legumes', 26.00),
                             tp_prato('Mochi', 12.00)
                           )),
      tp_historicoCardapio(TO_DATE('2025-03-15','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Poke Bowl', 30.00)
                           ))
    )
  )
);

INSERT INTO tb_restauranteComHistorico VALUES (
  tp_restauranteComHistorico(
    '00000000000014',
    'Mediterrâneo',
    '44556677',
    'Beco das Oliveiras',
    90,
    'Atenas',
    'Perto do Fórum',
    'Culinária Grega',
    varray_pratos(
      tp_prato('Moussaka', 33.00),
      tp_prato('Souvlaki', 27.50)
    ),
    nt_historicoCardapios(
      tp_historicoCardapio(TO_DATE('2025-02-12','YYYY-MM-DD'),
                           varray_pratos(
                             tp_prato('Tzatziki', 10.00),
                             tp_prato('Baklava', 12.00)
                           ))
    )
  )
);
