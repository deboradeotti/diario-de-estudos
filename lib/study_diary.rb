require 'io/console'
require_relative 'study_item.rb'
require_relative 'category.rb'

INSERT       = 1
DISPLAY_ALL  = 2
SEARCH       = 3
MARK_AS_DONE = 4
EXIT         = 5

puts 'Bem-vindo ao seu diário de estudos!'

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

clear 
puts welcome

opcao = StudyItem.menu

study_items = []
search = []

loop do
  case option
  when INSERT
    # << = shovel
    study_items << StudyItem.insert_item
    wait_and_clear 
  when DISPLAY_ALL
    StudyItem.display_itens(study_items)
  when SEARCH
    StudyItem.search_item(study_items)
  when EXIT
    break
  else
    puts "Opção inválida."
    puts
    wait_and_clear
  end
  wait_and_clear
  opcao = StudyItem.menu
end

puts
puts "Obrigado por usar o Diário de Estudos, até logo!"