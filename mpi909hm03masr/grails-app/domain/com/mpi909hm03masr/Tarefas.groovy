package com.mpi909hm03masr

class Tarefas {
    String taskDescricao
    Date taskFinal
    Categoria categoria

    static constraints = {
      //taskID(unique:true, nullable:false)
    }
    //static hasMany = [categoria:Categoria]
}
