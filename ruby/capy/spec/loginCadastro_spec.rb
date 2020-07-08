describe 'Login com cadastro', :loginCadastro do
   
    before(:each) do
        visit 'access'
    end

    it 'Login usuario já cadastrado' do
        login_form = find('#login') #elemento pai, com isso a busca sera somente dentro do espoco do form de login

        login_form.find('input[name=username]').set 'stark'#pegado o tipo o atributo e o valor do atributo
        login_form.fill_in 'password', with: 'jarvis!' # usado para preencher campo input type por Id (id: password)
        click_button 'Entrar'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'

    end

    it 'Cadastro de form', :cadastro do
        within('#signup') do  #outro tipo de escopo
            find('input[name=username]').set 'Teste22222'
            find('input[name=password]').set '1234!'
            click_link 'Criar Conta' #no pagina o elemento é um <a>, logo temos que usar click link
        end
        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end


end