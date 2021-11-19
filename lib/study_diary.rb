require_relative 'study_item.rb'
require_relative 'category.rb'

CADASTRAR_ITEM = 1
VISUALIZAR_ITENS = 2
BUSCAR_ITEM = 3
SAIR = 4

puts "Bem-vindo ao seu diário de estudos!"

opcao = StudyItem.menu()

itens = []

loop do

  if(opcao == CADASTRAR_ITEM)
    itens << StudyItem.cadastrar_item()
  elsif(opcao == VISUALIZAR_ITENS)
    StudyItem.imprimir_itens(itens)
  elsif(opcao == BUSCAR_ITEM)
    # Criar um novo array só com os que correspondem e passar na função imprimir_itens()
    StudyItem.imprimir_itens(itens)
  elsif(opcao == SAIR)
    break
  else
    puts "Opção inválida."
    puts
  end

  opcao = StudyItem.menu()

end

puts
puts "Obrigado por usar o diário de estudos, até logo!"