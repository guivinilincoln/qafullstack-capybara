describe 'Tabelas', :tabs do

    before(:each) do
        visit 'tables#'
    end

    it 'deve exibir o salario do Stark' do #Procurando por nome
        atores = all('table tbody tr')
        stark = atores.detect {|ator|ator.text.include?('Robert Downey Jr')}
        #puts stark.text

        expect(stark.text).to include '10.000.000'
    end

    it 'deve exibir o salario do Vin disel' do #procurando por chave unica
        disel = find('table tbody tr', text: '@vindiesel')
        expect(disel).to have_content '10.000.000'
    end

    it 'deve exibir o filme velozes' do 
        disel = find('table tbody tr', text: '@vindiesel') # fazendo um find por atributo nome e falando que quer a tr e o texto que nele contem
        filme = disel.all('td')[2].text # pegando o segundo elemento do array da tabela, filtrado pela chave unica disel

        expect(filme).to eql 'Velozes e Furioso' # fazendo a verificação 

    end

    it 'deve exibir o instagram do Chris Evans' do

        evans = find('table tbody tr', text: 'Chris Evans')
        insta =  evans.all('td')[4].text

        expect(insta).to eql '@teamcevans'

    end


    it 'deve selecionar Chris Prat para remoção' do
        prat = find('table tbody tr', text: 'Chris Pratt')
        prat.find('a', text: 'delete').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    end

    it 'deve selecionar Chris Prat para edição' do
        prat = find('table tbody tr', text: 'Chris Pratt')
        prat.find('a', text: 'edit').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
    end
 
end