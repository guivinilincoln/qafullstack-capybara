describe 'Forms', :forms do

    it 'login com sucesso'do
        visit 'login'

        fill_in 'username', with: 'stark' # usado para preencher campo input type por name (name: username)
        fill_in 'passId', with: 'jarvis!' # usado para preencher campo input type por Id (id: passId)

        click_button 'Login' # usado para clicar em botão com texto login usando value
        
        find('#flash').visible? #find é usado para localizar um seletor especifico. # = buscar por id / visible retorna "true/false" se existir o elemento

        expect(find('#flash').visible?).to be true #o comando expect, como o proprio nome já diz, tem uma expectativa de que algo aconteça. Nesse exemplo que o elemento visivel seja = true

        #expect(find('#flash').text).to eql "Olá, Tony Stark. Você acessou a área logada!" # eql faz comparação total da string

        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!' # Captura o texto e verificar se contem 

        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!' # Pergunta se no elemento contem no elemento

        sleep 5 #temporário 

    end

    it 'Login com senha incorreta' do
        visit 'login'

        fill_in 'username', with: 'stark' # usado para preencher campo input type por name (name: username)
        fill_in 'passId', with: 'jarvis' # usado para preencher campo input type por Id (id: passId)

        click_button 'Login' # usado para clicar em botão com texto login

        expect(find('#flash').text).to include 'Senha é invalida!' # Captura o texto e verificar se contem 
        expect(find('#flash')).to have_content 'Senha é invalida!' # Pergunta se no elemento contem no elemento


    end

    it 'usuaio nao cadastrado' do

        visit 'login'


        click_button 'Login' # usado para clicar em botão com texto login

        expect(find('#flash').text).to include 'O usuário informado não está cadastrado!' # Captura o texto e verificar se contem 
        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!' # Pergunta se no elemento contem no o text


    end

end