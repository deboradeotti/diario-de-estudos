class StudyItem
    attr_accessor :title, :category, :done

    require_relative 'study_diary.rb'
    require_relative 'category.rb'

    def initialize(title:, category:)
        @title = title
        @category = category
        @done = false 
    end

    def self.menu

        # Heredoc: sintaxe para criar múltiplas linhas de texto
        # <<-HEREDOC -> considera a indentação do texto na hora do output
        # <<~HEREDOC -> "Squiggly Heredoc" -> não considera a indentação do texto

        puts <<~MENU 
        ---------------------------------------------------------
        [#{CADASTRAR_ITEM}] Cadastrar um item para estudar
        [#{VISUALIZAR_ITENS}] Ver todos os itens cadastrados
        [#{BUSCAR_ITEM}] Buscar um item de estudo
        [#{SAIR}] Sair
        ---------------------------------------------------------
        MENU
        print "Escolha uma opção: "
        gets.to_i
    end
      
    def self.insert_item
        puts "Digite o título do item: "
        titulo = gets.chomp
        puts "Digite a categoria do item: "
        categoria = gets.chomp
        puts
        puts "Item #{titulo} da categoria #{categoria} cadastrado com sucesso."
        puts
        return StudyItem.new(titulo: titulo, categoria: categoria)
    end
        
    def self.display_items(collection)
        puts
        puts "========== Itens cadastrados =========="
        itens.each.with_index(1) do |item, index|
            puts "##{index} - #{item.titulo} - #{item.categoria}#{' - Finalizado' if item.done == true} "
        end
        puts

        # Não precisamos usar if/else porque o each já não roda se o array estiver vazio
        puts "Nenhum item encontrado." if collection.empty?
        puts
        wait_and_clear
    end
      
      
    def self.search_item(collection)
        puts "Digite o termo que deseja buscar: "
        term = gets.chomp

        # O filter é um alias do select
        found_items = collection.filter do |item|
            item.titulo.include? term
        end
        display_items(found_items)
        wait_and_clear
    end

    def self.mark_as_done
        not_finalized = StudyItem.undone
        display_items(not_finalized)
        return if not_finalized.empty?
      
        print 'Digite o número que deseja finalizar: '
        index = gets.to_i
        not_finalized[index - 1].done!
    end
      
end