require_relative 'study_item.rb'
require_relative 'category.rb'

CADASTRAR_ITEM = 1
VISUALIZAR_ITENS = 2
BUSCAR_ITEM = 3
SAIR = 4

puts "Bem-vindo ao seu diário de estudos!"

def menu()
puts "[#{CADASTRAR_ITEM}] Cadastrar um item para estudar"
puts "[#{VISUALIZAR_ITENS}] Ver todos os itens cadastrados"
puts "[#{BUSCAR_ITEM}] Buscar um item de estudo"
puts "[#{SAIR}] Sair"
print "Escolha uma opção: "
return gets.to_i()
end

def cadastrar_item()
  puts "Digite o título do item: "
  titulo = gets.chomp() 
  puts "Digite a categoria do item: "
  categoria = gets.chomp()
  item = StudyItem.new(titulo: titulo, categoria: categoria)
  puts
  puts "Item #{titulo} da categoria #{categoria} cadastrado com sucesso."
  puts
  return item
end

def imprimir_itens(itens)
    puts
    puts "========== Itens cadastrados =========="
    itens.each do |item|
        puts "#{titulo} - #{categoria}"
    end
    puts
    if itens.empty?
        puts "Nenhum item cadastrado."
        puts
    end
end

opcao = menu()

itens = []

loop do

  if(opcao == CADASTRAR_ITEM)
    itens << cadastrar_item()
  elsif(opcao == VISUALIZAR_ITENS)
    imprimir_itens(itens)
    
    #Adicionar função buscar

  elsif(opcao == SAIR)
    break
  else
    puts "Opção inválida."
    puts
  end

  opcao = menu()

end

puts
puts "Obrigado por usar o diário de estudos, até logo!"