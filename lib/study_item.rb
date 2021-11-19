class StudyItem
    attr_accessor :titulo, :categoria

    require_relative 'study_diary.rb'
    require_relative 'category.rb'

    def initialize(titulo: 'Sem título', categoria: Category.new)
        @titulo = titulo
        @categoria = categoria
    end

    def self.menu()
        puts "[#{CADASTRAR_ITEM}] Cadastrar um item para estudar"
        puts "[#{VISUALIZAR_ITENS}] Ver todos os itens cadastrados"
        puts "[#{BUSCAR_ITEM}] Buscar um item de estudo"
        puts "[#{SAIR}] Sair"
        print "Escolha uma opção: "
        return gets.to_i()
    end
        
    def self.cadastrar_item()
        puts "Digite o título do item: "
        titulo = gets.chomp() 
        puts "Digite a categoria do item: "
        categoria = gets.chomp()
        puts
        puts "Item #{titulo} da categoria #{categoria} cadastrado com sucesso."
        puts
        return StudyItem.new(titulo: titulo, categoria: categoria)
    end
        
    def self.imprimir_itens(itens)
        puts
        puts "========== Itens cadastrados =========="
        itens.each do |item|
            puts "#{item.titulo} - #{item.categoria}"
        end
        puts
        if itens.empty?
            puts "Nenhum item cadastrado."
            puts
        end
    end

end