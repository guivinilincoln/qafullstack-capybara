describe 'IDs Dinâmicos', :idsDin do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/access'
    end

    it 'Castro' do
        find('input[id$=UsernameInput]').set 'GuilhermeTest' # espreção recular termina
        find('input[id^=PasswordInput]').set '123456@' #termina com
        find('a[id*=GetStartedButton').click # contem 

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end
 
end