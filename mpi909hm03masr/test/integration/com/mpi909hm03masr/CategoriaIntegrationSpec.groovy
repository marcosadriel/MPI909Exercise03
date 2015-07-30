package com.mpi909hm03masr

import grails.test.spock.IntegrationSpec

class CategoriaIntegrationSpec extends IntegrationSpec {

    def setup() {
    }

    def cleanup() {
    }

    void "Salvar e obter categoria do banco"() {
        when:
        def categoria = new Categoria(catId: '1', catDescricao: 'Pessoal')

        then:
        categoria.save() != null
        categoria.id != null

        when:
        def foundUser = Categoria.get(categoria.id)

        then:
        '1' == foundUser.catId
    }

    void "Salvar e atualizar no banco"(){
      when:
      def categoria = new Categoria(catId:'1',catDescricao:'Pessoal')

      then:
      categoria.save()!=null

      when:
      def foundCategoria = Categoria.get(categoria.id)
      foundCategoria.catDescricao = 'Profissional'
      foundCategoria.save()
      def editedCategoria = Categoria.get(categoria.id)

      then:
      'Profissional' == editedCategoria.catDescricao
    }
}
