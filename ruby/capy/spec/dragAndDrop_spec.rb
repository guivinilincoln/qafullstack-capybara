describe '', :drag do

    before(:each)do
        visit 'https://training-wheels-protocol.herokuapp.com/drag_and_drop'
    end

    #para localizar classe utilizar $('. nome da classe')

    it 'Team Stark' do

        stark = find('.team-stark .column') # Primeiro é a classe pai (.team...) e (.column) é a filha, elemento alvo
        cap = find('.team-cap .column')

        spiderman = find('img[alt$=Aranha]') # elemento para drop
        spiderman.drag_to stark # enviando o drop para o alvo

        expect(stark).to have_css 'img[alt$=Aranha]' #verificando no alvo final de ele esta la dentro
        expect(cap).not_to have_css 'img[alt$=Aranha]' #verifica se no alvo anterior não exite no elemento drop

    end

    after(:each)do
        sleep 2
    end
    
end