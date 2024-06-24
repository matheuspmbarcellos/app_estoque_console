require 'terminal-table'

def retirar_estoque(produtos)
    limpar_tela

    mensagem("====== Escolha um dos produtos abaixo ========", false, false)

    table = Terminal::Table.new do |t|
        t.headings = ['ID', 'Nome', 'Quantidade']
        produtos.each do |row|
            t.add_row [row[:id], row[:nome], row[:quantidade]]
        end
    end
      
    puts table

    mensagem("Digite o ID do produto:", false, false)
    id = gets.to_i
    
    produto = produtos.find{|p| p[:id] == id}
    unless produto 
        limpar_tela
        mensagem("Produto do ID (#{id}) não encontrado na lista", false, false)
        mensagem("Deseja digitar o numero novamente? (s/n)", false, false)
        opcao = gets.chomp.downcase
        limpar_tela

        if opcao == "s" || opcao == "sim"
            retirar_estoque(produtos)
        end

        return
    end


    limpar_tela
    mensagem("Digite a quantidade que deseja retirar do estoque do produto: #{produto[:nome]}", false, false)
    mensagem("Quantidade atual: #{produto[:quantidade]}", false, false)
    quantidade_retirada = gets.to_i
    produto[:quantidade] = produto[:quantidade] - quantidade_retirada

    mensagem("Retirada realizada com sucesso!", true, true, 3)
    listar_produtos(produtos)
end