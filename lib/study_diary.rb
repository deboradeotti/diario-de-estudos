require 'io/console'
require_relative 'study_item.rb' 

# Não precisa fazer o require para category pois já está dentro de study_item

INSERT       = 1
DISPLAY_ALL  = 2
SEARCH       = 3
MARK_AS_DONE = 4
EXIT         = 5

# Limpa o terminal

def clear 
  system 'clear'
end

def wait_keypress
  puts
  puts 'Pressione qualquer tecla para continuar.'

  # Pega apenas um caractere (qualquer um)
  STDIN.getch 
end

def wait_and_clear
  wait_keypress
  clear
end

def menu

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

def display_items(collection)
  puts
  puts "========== Itens cadastrados ==========" 
  # Quando fazemos o puts de um array, o Ruby entende que é para fazer de cada um dos ítens, então não precisamos do each
  puts collection
  puts
  # Não precisamos usar if/else porque o each já não roda se o array estiver vazio
  puts "Nenhum item encontrado." if collection.empty?
  puts
  wait_and_clear
end

def search_item
  puts "Digite o termo que deseja buscar: "
  term = gets.chomp
  StudyItem.search(term)
end

def mark_as_done

  # & -> operador ampersand

  not_finalized = study_items.filter(&:undone)
  display_items(not_finalized)
  return if not_finalized.empty?

  print 'Digite o número que deseja finalizar: '
  index = gets.to_i
  not_finalized[index - 1].done!
end

clear 
puts 'Bem-vindo ao seu diário de estudos!'
opcao = menu

loop do
  case option
  when INSERT
    StudyItem.create
  when DISPLAY_ALL
    display_itens(StudyItem.all)
  when SEARCH
    found_items = search_item
    display_items(found_items)
  when MARK_AS_DONE
    mark_as_done
  when EXIT
    break
  else
    puts "Opção inválida."
    puts
  end
  wait_and_clear
  opcao = StudyItem.menu
end

puts
puts "Obrigado por usar o Diário de Estudos, até logo!"