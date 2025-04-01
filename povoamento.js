use('Dentist');

// db.createCollection("pacientes")
// db.createCollection("dentistas")
// db.createCollection("agendamentos")
// db.createCollection("tratamentos")

db.pacientes.drop();
db.dentistas.drop();
db.tratamentos.drop();
db.agendamentos.drop();

db.pacientes.insertMany([
    {
      "_id": 1,
      "nome": "João Pereira",
      "cpf": "987.654.321-00",
      "data_nascimento": "1985-10-22",
      "telefone": "(11) 99876-5432",
      "endereco": {
        "rua": "Av. Paulista, 1500",
        "cidade": "São Paulo",
        "estado": "SP",
        "cep": "01310-100"
      },
      "historico_medico": ["Hipertensão", "Asma"]
    },
    {
      "_id": 2,
      "nome": "Ana Lima",
      "cpf": "456.789.123-44",
      "data_nascimento": "1992-07-30",
      "telefone": "(21) 98555-1234",
      "endereco": {
        "rua": "Rua do Mercado, 45",
        "cidade": "Rio de Janeiro",
        "estado": "RJ",
        "cep": "20031-144"
      },
      "historico_medico": ["Nenhuma"]
    },
    {
      "_id": 3,
      "nome": "Carlos Mendes",
      "cpf": "321.654.987-55",
      "data_nascimento": "1978-03-12",
      "telefone": "(31) 99456-7890",
      "endereco": {
        "rua": "Rua da Liberdade, 222",
        "cidade": "Belo Horizonte",
        "estado": "MG",
        "cep": "30140-040"
      },
      "historico_medico": ["Colesterol alto", "Cirurgia no joelho"]
    },
    {
      "_id": 4,
      "nome": "Fernanda Costa",
      "cpf": "654.321.789-11",
      "data_nascimento": "2000-11-05",
      "telefone": "(48) 99999-5555",
      "endereco": {
        "rua": "Rua das Palmeiras, 75",
        "cidade": "Florianópolis",
        "estado": "SC",
        "cep": "88036-500"
      },
      "historico_medico": ["Alergia a poeira"]
    },
    {
      "_id": 5,
      "nome": "Ricardo Alves",
      "cpf": "159.357.258-66",
      "data_nascimento": "1982-06-25",
      "telefone": "(41) 98888-4444",
      "endereco": {
        "rua": "Rua XV de Novembro, 333",
        "cidade": "Curitiba",
        "estado": "PR",
        "cep": "80020-310"
      },
      "historico_medico": ["Hipertensão", "Problemas renais"]
    },
    {
      "_id": 6,
      "nome": "Juliana Duarte",
      "cpf": "753.951.852-99",
      "data_nascimento": "1995-09-08",
      "telefone": "(71) 99777-1111",
      "endereco": {
        "rua": "Av. Sete de Setembro, 1200",
        "cidade": "Salvador",
        "estado": "BA",
        "cep": "40060-001"
      },
      "historico_medico": ["Nenhuma"]
    },
    {
      "_id": 7,
      "nome": "Eduardo Ferreira",
      "cpf": "852.369.741-22",
      "data_nascimento": "1970-04-14",
      "telefone": "(51) 99666-7777",
      "endereco": {
        "rua": "Rua dos Andradas, 999",
        "cidade": "Porto Alegre",
        "estado": "RS",
        "cep": "90020-005"
      },
      "historico_medico": ["Cardiopatia", "Diabetes"]
    },
    {
      "_id": 8,
      "nome": "Larissa Mendes",
      "cpf": "369.258.147-33",
      "data_nascimento": "1988-12-19",
      "telefone": "(95) 99333-2222",
      "endereco": {
        "rua": "Av. Getúlio Vargas, 500",
        "cidade": "Boa Vista",
        "estado": "RR",
        "cep": "69304-000"
      },
      "historico_medico": ["Problema na tireoide"]
    },
    {
      "_id": 9,
      "nome": "Felipe Martins",
      "cpf": "741.852.963-77",
      "data_nascimento": "1999-02-10",
      "telefone": "(85) 99111-0000",
      "endereco": {
        "rua": "Rua José de Alencar, 88",
        "cidade": "Fortaleza",
        "estado": "CE",
        "cep": "60110-000"
      },
      "historico_medico": ["Alergia a frutos do mar"]
    },
    {
      "_id": 10,
      "nome": "Patrícia Nogueira",
      "cpf": "258.147.369-88",
      "data_nascimento": "1975-05-29",
      "telefone": "(62) 99444-3333",
      "endereco": {
        "rua": "Rua das Acácias, 200",
        "cidade": "Goiânia",
        "estado": "GO",
        "cep": "74000-000"
      },
      "historico_medico": ["Pressão baixa"]
    }
  ]
);

db.dentistas.insertMany([
    {
      "_id": 1,
      "nome": "Dra. Maria Fernandes",
      "cro": "SP-67890",
      "especialidade": ["Endodontia", "Clínico Geral"],
      "telefone": "(11) 91234-5678",
      "horarios_atendimento": {
        "segunda": ["08:00 - 12:00", "14:00 - 18:00"],
        "quinta": ["09:00 - 13:00"]
      }
    },
    {
      "_id": 2,
      "nome": "Dr. Carlos Souza",
      "cro": "RJ-54321",
      "especialidade": ["Ortodontia"],
      "telefone": "(21) 99876-5432",
      "horarios_atendimento": {
        "terça": ["10:00 - 16:00"],
        "sexta": ["08:00 - 12:00", "14:00 - 17:00"]
      }
    },
    {
      "_id": 3,
      "nome": "Dra. Fernanda Oliveira",
      "cro": "MG-11223",
      "especialidade": ["Implantodontia", "Periodontia"],
      "telefone": "(31) 95555-8888",
      "horarios_atendimento": {
        "quarta": ["08:00 - 12:00"],
        "sexta": ["14:00 - 18:00"]
      }
    },
    {
      "_id": 4,
      "nome": "Dr. Ricardo Martins",
      "cro": "PR-33445",
      "especialidade": ["Clínico Geral"],
      "telefone": "(41) 99999-1111",
      "horarios_atendimento": {
        "segunda": ["07:30 - 11:30"],
        "quinta": ["13:00 - 17:00"]
      }
    },
    {
      "_id": 5,
      "nome": "Dra. Juliana Cardoso",
      "cro": "RS-55667",
      "especialidade": ["Endodontia"],
      "telefone": "(51) 98888-2222",
      "horarios_atendimento": {
        "terça": ["08:00 - 12:00"],
        "sexta": ["09:00 - 14:00"]
      }
    },
    {
      "_id": 6,
      "nome": "Dr. Eduardo Lima",
      "cro": "BA-77889",
      "especialidade": ["Ortodontia", "Cirurgia Bucomaxilofacial"],
      "telefone": "(71) 97777-3333",
      "horarios_atendimento": {
        "segunda": ["10:00 - 16:00"],
        "quarta": ["14:00 - 18:00"]
      }
    },
    {
      "_id": 7,
      "nome": "Dra. Larissa Nogueira",
      "cro": "SC-99001",
      "especialidade": ["Implantodontia"],
      "telefone": "(48) 96666-4444",
      "horarios_atendimento": {
        "quinta": ["08:00 - 12:00"],
        "sexta": ["13:00 - 17:00"]
      }
    },
    {
      "_id": 8,
      "nome": "Dr. Felipe Castro",
      "cro": "PE-22334",
      "especialidade": ["Clínico Geral", "Odontopediatria"],
      "telefone": "(81) 95555-5555",
      "horarios_atendimento": {
        "terça": ["07:00 - 12:00"],
        "quinta": ["14:00 - 18:00"]
      }
    },
    {
      "_id": 9,
      "nome": "Dra. Patrícia Mendes",
      "cro": "CE-44556",
      "especialidade": ["Periodontia", "Endodontia"],
      "telefone": "(85) 94444-6666",
      "horarios_atendimento": {
        "segunda": ["08:00 - 13:00"],
        "quarta": ["14:00 - 19:00"]
      }
    },
    {
      "_id": 10,
      "nome": "Dr. Gustavo Andrade",
      "cro": "GO-66778",
      "especialidade": ["Ortodontia", "Clínico Geral"],
      "telefone": "(62) 93333-7777",
      "horarios_atendimento": {
        "terça": ["09:00 - 15:00"],
        "sexta": ["10:00 - 16:00"]
      }
    }
  ]
);

db.tratamentos.insertMany([
    {
      "_id": 1,
      "nome": "Limpeza Dental",
      "descricao": "Remoção de placa bacteriana e tártaro para manter a saúde bucal",
      "valor": 200.00,
      "duracao_minutos": 40
    },
    {
      "_id": 2,
      "nome": "Extração de Dente",
      "descricao": "Procedimento para remover um dente danificado ou impactado",
      "valor": 350.00,
      "duracao_minutos": 45
    },
    {
      "_id": 3,
      "nome": "Tratamento de Canal",
      "descricao": "Remoção da polpa do dente infectado e selagem do canal",
      "valor": 800.00,
      "duracao_minutos": 90
    },
    {
      "_id": 4,
      "nome": "Aparelho Ortodôntico",
      "descricao": "Correção da posição dos dentes com uso de aparelho fixo ou móvel",
      "valor": 2500.00,
      "duracao_minutos": 60
    },
    {
      "_id": 5,
      "nome": "Implante Dentário",
      "descricao": "Substituição de um dente perdido por um implante de titânio",
      "valor": 4500.00,
      "duracao_minutos": 120
    },
    {
      "_id": 6,
      "nome": "Restauração Dentária",
      "descricao": "Reparo de dentes danificados com resina ou amálgama",
      "valor": 300.00,
      "duracao_minutos": 50
    },
    {
      "_id": 7,
      "nome": "Lente de Contato Dental",
      "descricao": "Finas camadas de porcelana aplicadas sobre os dentes para estética",
      "valor": 1500.00,
      "duracao_minutos": 80
    },
    {
      "_id": 8,
      "nome": "Prótese Dentária",
      "descricao": "Substituição de múltiplos dentes ausentes com prótese fixa ou móvel",
      "valor": 3200.00,
      "duracao_minutos": 90
    },
    {
      "_id": 9,
      "nome": "Cirurgia Gengival",
      "descricao": "Procedimento para corrigir problemas gengivais e melhorar a estética",
      "valor": 700.00,
      "duracao_minutos": 75
    },
    {
      "_id": 10,
      "nome": "Bruxismo - Placa de Mordida",
      "descricao": "Confecção de uma placa de mordida para reduzir o desgaste dos dentes",
      "valor": 600.00,
      "duracao_minutos": 40
    }
  ]
);

db.agendamentos.insertMany([
    {
      "_id": 1,
      "paciente_id": 1,
      "dentista_id": 2,
      "data_hora": new Date('2025-04-15T09:00:00'),
      "status": "Confirmado",
      "tratamentos": [1, 3]
    },
    {
      "_id": 2,
      "paciente_id": 3,
      "dentista_id": 4,
      "data_hora": new Date('2025-04-16T14:30:00'),
      "status": "Pendente",
      "tratamentos": [2, 5]
    },
    {
      "_id": 3,
      "paciente_id": 5,
      "dentista_id": 6,
      "data_hora": new Date('2025-04-18T10:45:00'),
      "status": "Cancelado",
      "tratamentos": [4]
    },
    {
      "_id": 4,
      "paciente_id": 7,
      "dentista_id": 8,
      "data_hora": new Date('2025-04-20T16:00:00'),
      "status": "Confirmado",
      "tratamentos": [6, 7]
    },
    {
      "_id": 5,
      "paciente_id": 9,
      "dentista_id": 10,
      "data_hora": new Date('2025-04-22T08:30:00'),
      "status": "Pendente",
      "tratamentos": [8]
    },
    {
      "_id": 6,
      "paciente_id": 2,
      "dentista_id": 3,
      "data_hora": new Date('2025-04-25T11:15:00'),
      "status": "Confirmado",
      "tratamentos": [9, 10]
    },
    {
      "_id": 7,
      "paciente_id": 4,
      "dentista_id": 5,
      "data_hora": new Date('2025-04-28T13:00:00'),
      "status": "Cancelado",
      "tratamentos": [1]
    },
    {
      "_id": 8,
      "paciente_id": 6,
      "dentista_id": 7,
      "data_hora": new Date('2025-04-30T15:45:00'),
      "status": "Confirmado",
      "tratamentos": [2, 3]
    },
    {
      "_id": 9,
      "paciente_id": 8,
      "dentista_id": 9,
      "data_hora": new Date('2025-05-02T09:30:00'),
      "status": "Pendente",
      "tratamentos": [4, 5]
    },
    {
      "_id": 10,
      "paciente_id": 10,
      "dentista_id": 1,
      "data_hora": new Date('2025-05-05T14:00:00'),
      "status": "Confirmado",
      "tratamentos": [6, 7, 8]
    },
    {
      "_id": 11,
      "paciente_id": 1,
      "dentista_id": 4,
      "data_hora": new Date('2025-05-06T10:00:00'),
      "status": "Confirmado",
      "tratamentos": [2, 5]
    },
    {
      "_id": 12,
      "paciente_id": 2,
      "dentista_id": 6,
      "data_hora": new Date('2025-05-07T14:00:00'),
      "status": "Pendente",
      "tratamentos": [3, 7]
    },
    {
      "_id": 13,
      "paciente_id": 3,
      "dentista_id": 8,
      "data_hora": new Date('2025-05-10T08:30:00'),
      "status": "Confirmado",
      "tratamentos": [4, 6]
    },
    {
      "_id": 14,
      "paciente_id": 4,
      "dentista_id": 9,
      "data_hora": new Date('2025-05-12T15:30:00'),
      "status": "Cancelado",
      "tratamentos": [1, 10]
    },
    {
      "_id": 15,
      "paciente_id": 5,
      "dentista_id": 2,
      "data_hora": new Date('2025-05-14T11:00:00'),
      "status": "Confirmado",
      "tratamentos": [3, 4]
    },
    {
      "_id": 16,
      "paciente_id": 6,
      "dentista_id": 5,
      "data_hora": new Date('2025-05-16T12:30:00'),
      "status": "Pendente",
      "tratamentos": [8]
    },
    {
      "_id": 17,
      "paciente_id": 7,
      "dentista_id": 10,
      "data_hora": new Date('2025-05-18T09:30:00'),
      "status": "Confirmado",
      "tratamentos": [2, 6]
    },
    {
      "_id": 18,
      "paciente_id": 8,
      "dentista_id": 3,
      "data_hora": new Date('2025-05-20T13:00:00'),
      "status": "Cancelado",
      "tratamentos": [1, 7]
    },
    {
      "_id": 19,
      "paciente_id": 9,
      "dentista_id": 7,
      "data_hora": new Date('2025-05-22T10:45:00'),
      "status": "Confirmado",
      "tratamentos": [5, 9]
    },
    {
      "_id": 20,
      "paciente_id": 10,
      "dentista_id": 4,
      "data_hora": new Date('2025-05-25T14:15:00'),
      "status": "Pendente",
      "tratamentos": [3, 8]
    }
  ]
);
  

