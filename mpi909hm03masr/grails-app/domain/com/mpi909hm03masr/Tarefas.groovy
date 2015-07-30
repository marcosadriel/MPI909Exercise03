package com.mpi909hm03masr

class Tarefas {
    String taskID
    String taskDescricao
    Date taskFinal
    Categoria categoria

    static constraints = {
      //taskID(unique:true, nullable:false)
    }

    static belongsTo=[categoria:Categoria]
}
