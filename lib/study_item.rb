class StudyItem
    attr_accessor :titulo, :categoria

    require_relative 'study_diary.rb'
    require_relative 'category.rb'

    def initialize(titulo: 'Sem título', categoria: Category.new)
        @titulo = titulo
        @categoria = categoria
    end

end