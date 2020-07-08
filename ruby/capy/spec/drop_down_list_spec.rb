describe 'Caixa de opções', :drop do

    # :drop e uma tag para ser executado 
 
    it'Seleciona item simples'do
        visit 'dropdown'
        select('Loki', from: 'dropdown') # Faz seleção simples pelo  value e por id 
        sleep 3 # temporario
    end

    it'Seleciona um item por find'do
        visit 'dropdown'
        drop = find('.avenger-list') #faz um find por class
        drop.find('option', text: 'Scott Lang').select_option #busca uma opcao que contem o texto e seleciona
        sleep 3 # temporario
    end

    it 'qualquer item', :sample do
        visit 'dropdown'
        drop = find('.avenger-list') #faz um find por class
        drop.all('option').sample.select_option #seleciona uma opção aleatoria
    end
end