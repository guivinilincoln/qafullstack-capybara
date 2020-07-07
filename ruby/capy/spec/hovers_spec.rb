describe 'Mouse Hover', :hovers do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/hovers'
    end

    it 'passando o mouse sobre o blade ' do
       card = find('img[alt=Blade]')
       card.hover #passa o mouse pelo elemento

       expect(page).to have_content 'Nome: Blade'

    end

    it 'passando o mouse sobre pantera negra' do

        card = find('img[alt="Pantera Negra"]') # se a string que esta procurando tem caracteres especiais, utilizar o ""
        card.hover #passa o mouse pelo elemento
        expect(page).to have_content 'Pantera Negra'

    end


    it 'passando o mouse sobre Homem Aranha' do #exemplos de expressão recular

        card = find('img[alt^=Homem]')#começa com
        card = find('img[alt*=Aran]')#Contem
        card = find('img[alt$=Aranha]')#começa Termina
        card.hover #passa o mouse pelo elemento
        expect(page).to have_content 'Homem Aranha'

    end


    after()do
        sleep 0.5
    end

end