package com.mpi909hm03masr

class Categoria {
    String catId
    String catDescricao
    static constraints = {
    
    }
    static hasMany = [tarefas:Tarefas]
}
