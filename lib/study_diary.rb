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
  [#{INSERT}] Cadastrar um item para estudar
  [#{DISPLAY_ALL}] Ver todos os itens cadastrados
  [#{SEARCH}] Buscar um item de estudo
  [#{MARK_AS_DONE}] Marcar um ítem como concluído
  [#{EXIT}] Sair
  ---------------------------------------------------------
  MENU
  print "Escolha uma opção: "
  gets.to_i
end

def display_items(collection)
  # Quando fazemos o puts de um array, o Ruby entende que é para fazer de cada um dos ítens, então não precisamos do each
  puts collection
  puts
  # Não precisamos usar if/else porque o each já não roda se o array estiver vazio
  puts "Nenhum item encontrado." if collection.empty?
  puts
end

def search_item
  print "Digite o termo que deseja buscar: "
  term = gets.chomp
  StudyItem.search(term)
end

def mark_as_done

  # & -> operador ampersand

  not_finalized = StudyItem.undone
  display_items(not_finalized)
  return if not_finalized.empty?

  print 'Digite o número que deseja finalizar: '
  index = gets.to_i
  not_finalized[index - 1].done!
end

clear 
puts 'Bem-vindo ao seu diário de estudos!'
option = menu

loop do
  case option
  when INSERT
    StudyItem.create
  when DISPLAY_ALL
    puts "========== Itens cadastrados ==========" 
    display_items(StudyItem.all)
  when SEARCH
    found_items = search_item
    puts "========== Itens encontrados =========="
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
  option = menu
end

puts
puts "Obrigado por usar o Diário de Estudos, até logo!"