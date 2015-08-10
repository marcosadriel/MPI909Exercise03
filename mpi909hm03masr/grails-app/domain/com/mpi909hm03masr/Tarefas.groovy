package com.mpi909hm03masr

class Tarefas {
  String nome
  //@BindingFormat('ddMMyyyy')
  Date deadLine
  boolean completo
  Categoria categoria

  static constraints = {
  }

  static mapping = {
    completo defaultValue: false
  }
}
