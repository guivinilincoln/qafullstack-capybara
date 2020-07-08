describe 'Alertas em JS', :alert do


    before(:each) do

        visit 'javascript_alerts'

    end

    it 'alerta' do
        click_button 'Alerta'

        msg = page.driver.browser.switch_to.alert.text # usado para informar para o capybara que vamos utilziar o navegador
        expect(msg).to eql 'Isto é uma mensagem de alerta'
        sleep 1        

    end

    it 'sim confirma' do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.accept #usado para aceitar a mensagem
        expect(page).to have_content 'Mensagem confirmada'

    end

    it 'não confirma' do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.dismiss #usado para cancelar a mensagem
        expect(page).to have_content 'Mensagem não confirmada'

    end

    it 'Aceita prompt', :accept do

        accept_prompt(with: 'Guilherme') do
            click_button 'Prompt'
            sleep 2
        end
        expect(page).to have_content 'Olá, Guilherme'
        sleep 2
    end

    it 'Não aceita prompt', :n_aceita do

        dismiss_prompt(with: 'Guilherme') do
            click_button 'Prompt'
            sleep 2
        end
        expect(page).to have_content 'Olá, null'
        sleep 2
    end

end