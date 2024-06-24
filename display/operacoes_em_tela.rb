def mensagem(msg, usar_limpar_tela=true, usar_timer=true, timer=5)
    limpar_tela if usar_limpar_tela 
    puts msg
    sleep(timer) if usar_timer 
    limpar_tela if usar_limpar_tela
end

def limpar_tela
    if Gem.win_platform?
        system("cls") # No Windows
    else
        system("clear") # Em sistemas Unix/Linux
    end
end