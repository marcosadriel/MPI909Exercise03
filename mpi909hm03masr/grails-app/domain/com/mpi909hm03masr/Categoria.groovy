package com.mpi909hm03masr

class Categoria {
    String catDescricao
    static constraints = {
    }
    static hasMany = [tarefas:Tarefas]
}
