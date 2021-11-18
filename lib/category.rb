class Category

    require_relative 'study_diary.rb'
    require_relative 'study_item.rb'
  
    attr_accessor :nome_categoria
  
    def initialize(nome_categoria: 'Sem categoria')
      @nome_categoria = nome_categoria
    end
  
end