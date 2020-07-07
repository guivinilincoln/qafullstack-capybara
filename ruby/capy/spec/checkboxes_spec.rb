describe 'Caixas de selecção', :check do

    before(:each)do
        visit 'https://training-wheels-protocol.herokuapp.com/checkboxes'
    end

    it 'Marcando uma opção 1' do
          check('thor') #usado para marcar imput do tipo checkbox, somente para id ou nome
    end

    it 'Marcando uma opção 2' do
        uncheck('antman') #usado para desmarcar imput do tipo checkbox, somente para id ou nome
    end

    it 'Marcando com find set true' do
        find('input[value=cap]').set(true) #usado para marcar imput do tipo checkbox, usando value
    end

    it 'desmarcando com find set false' do
        find('input[value=guardians]').set(false) #usado para desmarcando imput do tipo checkbox, usando value
    end


    after(:each) do
        sleep 3
    end

end

