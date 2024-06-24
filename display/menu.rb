def iniciar_menu(produtos = [])
    loop do 
        puts "Escolha uma das opções abaixo:"
        puts "1 - Cadastro de produtos"
        puts "2 - Lista de produtos"
        puts "3 - Retirada de estoque"
        puts "4 - Sair"

        opcao = gets.to_i

        case opcao
        when  1
          cadastrar_produto(produtos)
        when  2
          listar_produtos(produtos)
        when  3
          retirar_estoque(produtos)
        when  4
          limpar_tela
          puts exit
        else
          puts "Opção inválida"
        end
    end
end