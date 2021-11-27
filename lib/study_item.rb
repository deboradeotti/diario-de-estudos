require_relative 'category.rb'

class StudyItem
    attr_reader :id, :title, :category

    # Variável estática que vale para a classe e para o objeto
    # Para qualquer instância que chamar essa variável, ela terá o mesmo valor
    # Dessa forma, podemos guardar em memória qual o próximo índice
    @@next_index = 1 
    @@study_items = []

    def initialize(title:, category:)
        @id = @@next_index
        @title = title
        @category = category
        @done = false 
        @@next_index += 1
        # Todo objeto criado será inserido no array
        @@study_items << self
    end

    # Métodos com ? têm como padrão retornar true ou false
    def done?
        @done
    end

    # Métodos com ! -> são chamados de bang methods e possuem algum "efeito colateral"
    def done!
        @done = true
    end

    def undone?
        !@done
    end

    # Vamos sobrescrever o método to_s da classe. Assim, quando chamarmos puts em algum objeto StudyItem, ele já virá formatado dessa maneira

    def to_s
        "##{id} - #{title} - #{category}#{' - Finalizado' if done?}"
    end

    def include?(term)
        # Deixando tanto o title quanto o termo em downcase, fazemos com que a busca se torne case insensitive
        title.downcase.include? term.downcase
    end
      
    def self.create
        puts "Digite o título do item: "
        title = gets.chomp
        display_items(Category.all)
        print "Escolha uma categoria para o seu item: "
        category = Category.index(gets.to_i - 1)
        puts
        puts "Item #{title} da categoria #{category} cadastrado com sucesso."
        puts
        StudyItem.new(titulo: titulo, categoria: categoria)
    end

    # Vamos criar um método de classe para pegar todos os ítens criados

    def self.all
        @@study_items
    end

    def self.search(term)
        all.filter { |element| element.include?(term) }
    end

    def self.undone
        all.filter(&:undone?)
    end
      
end