class Category

    attr_reader :title, :id

    @@next_index = 1 

    def initialize(title:)
      @id = @@next_index
      @title = title
      @@next_index += 1
    end

    def to_s
      "##{id} - #{title}"
    end

    # Vamos criar uma constante dentro da nossa classe com as categorias possíveis

    CATEGORIES = [
      new(title: 'Ruby'),
      new(title: 'Rails'),
      new(title: 'HTML')
    ]

    # Vamos agora criar um método que retorna a constante
    # O self na frente indica que é um método da classe, e não de instância, ou seja, pode ser chamado sobre a própria classe, sem necessidade de criar um objeto para isso

    def self.all
      CATEGORIES
    end

    def self.index(number)
      CATEGORIES[number]
    end
  
end