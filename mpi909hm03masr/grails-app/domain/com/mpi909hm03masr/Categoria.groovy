package com.mpi909hm03masr

class Categoria {
    String catDescricao
    static constraints = {
      //catID(unique:true, nullable:false)
      //catDescricao(nullable:false)
    }
    static hasMany = [tarefas:Tarefas]
}
