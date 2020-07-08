describe 'Login Campo dinamico', :dinamico do
   
    before(:each) do
        visit 'login2'
    end

    it 'com data de nascimento' do

        fill_in 'username', with: 'stark' # usado para preencher campo input type por name (name: username)
        fill_in 'passId', with: 'jarvis!' # usado para preencher campo input type por Id (id: passId)
        #find('#passId').set '' essa forma tbm serve

      
        login_form = find('#login')

        case login_form.text
        when /Dia/
            find('#day').set '29'
        when /Mês/
            find('#month').set '05'
        when /Ano/
            find('#year').set '1970'
        end

        click_button 'Login'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'

    end


end