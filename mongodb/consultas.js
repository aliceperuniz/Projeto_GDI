use('Dentist');

// lista as consultas pendentes, incluindo os dados do paciente e dentista
// AGGREGATE + MATCH + LOOKUP + PROJECT + PRETTY
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
]).pretty();

// retorna a média de ganho dos agendamentos confirmados dos dentistas
// AVG + GROUP + SORT + PRETTY
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
]).pretty();

// cancela agendamentos de clientes com mais de 30 anos 
// FUNCTION + SET + UPDATE + FILTER

function calcularIdade(dataNascimento) {
    const hoje = new Date();
    const nascimento = new Date(dataNascimento);
    let idade = hoje.getFullYear() - nascimento.getFullYear();
    const mesAtual = hoje.getMonth();
    const mesNascimento = nascimento.getMonth();

    if (mesAtual < mesNascimento || (mesAtual === mesNascimento && hoje.getDate() < nascimento.getDate())) {
        idade--;
    }
    return idade;
}

db.agendamentos.updateMany(
    {
        paciente_id: { 
            $in: db.pacientes.find().toArray().filter(p => calcularIdade(p.data_nascimento) > 30).map(p => p._id) 
        }
    },
    { $set: { status: "Cancelado" } }
);

// Buscar o agendamento mais distante dos confirmados onde a data seja maior ou igual a hoje 
// GTE + MAX + FIND 

const hoje = new Date(); // Data atual

const maxData = db.agendamentos.aggregate([
  {
    $match: { 
      status: "Confirmado", 
      data_hora: { $gte: hoje } 
    }
  },
  {
    $group: { 
      _id: null, 
      max_data: { $max: "$data_hora" } 
    }
  }
]).toArray()[0]?.max_data; 

db.agendamentos.find(
  { 
    status: "Confirmado", 
    data_hora: maxData 
  },
  {
    status: 0 ($unset)
  }
)


// Calcular o total de valor ganho e o número de agendamentos confirmados por dentista, para dentistas que possuem algum tratamento registrado.
// MAPREDUCE + SUM + EXISTS + COUNT + FUNCTION

const tratamentosMap = {};
db.tratamentos.find().forEach(tratamento => {
    tratamentosMap[tratamento._id] = tratamento.valor;
});

db.agendamentos.mapReduce(
  function () { 
    if (this.status === "Confirmado" && this.tratamentos.length > 0) { 
      
      let total_ganho = 0;
      this.tratamentos.forEach(tratamentoId => {
        if (tratamentosMap[tratamentoId]) {
          total_ganho += tratamentosMap[tratamentoId]; // Soma os valores
        }
      });
      emit(this.dentista_id, { total_ganho: total_ganho, count: 1 });
    }
  },
  function (key, values) {
    return {
      total_ganho: values.reduce((sum, v) => sum + v.total_ganho, 0), // $sum do valor total recebido
      total_agendamentos: values.reduce((sum, v) => sum + v.count, 0) // $count do número de agendamentos confirmados
    };
  },
  {
    query: { "tratamentos": { $exists: true, $ne: [] } }, 
    scope: { tratamentosMap }, 
    out: "resultado_ganhos_dentistas"
  }
);

db.resultado_ganhos_dentistas.find().sort({ total_ganho: -1 });