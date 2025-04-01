use('Dentist');

// lista as consultas pendentes, incluindo os dados do paciente e dentista
// AGGREGATE + MATCH + LOOKUP + PROJECT
db.agendamentos.aggregate([
    { $match: { status: "Pendente" } },
    {
      $lookup: {
        from: "pacientes",
        localField: "paciente_id",
        foreignField: "_id",
        as: "paciente"
      }
    },
    {
      $lookup: {
        from: "dentistas",
        localField: "dentista_id",
        foreignField: "_id",
        as: "dentista"
      }
    },
    {
        $project: {
          _id: 0,
          "paciente.nome": 1,
          "dentista.nome": 1,
          data_hora: 1,
          status: 1
        }
    }
]);

// retorna a média de ganho dos agendamentos confirmados dos dentistas
// AVG + GROUP + SORT
db.agendamentos.aggregate([
    {
      $match: { status: "Confirmado" }  
    },
    {
      $lookup: {
        from: "tratamentos",           
        localField: "tratamentos",     
        foreignField: "_id",           
        as: "tratamentos_info"        
      }
    },
    {
      $unwind: "$tratamentos_info"    
    },
    {
      $group: {
        _id: "$dentista_id",                  
        media_ganho: { $avg: "$tratamentos_info.valor" }  
      }
    },
    {
      $sort: { media_ganho: -1 }  
    }
])