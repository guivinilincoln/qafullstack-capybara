describe 'iframes' do

    describe 'iframes bom', :bom do

        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/nice_iframe'
        end

        it 'adicionar ao carrinho' do

            within_frame('burgerId') do

               produto =  find('.menu-item-info-box', text: 'REFRIGERANTE')
               produto.find('a').click
               expect(find('#cart')).to have_content 'R$ 4,50'
        
            end


        end

    end

    describe 'iframes ruim',:ruim do

        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/bad_iframe'
        end

        it 'adicionar ao carrinho' do # Selector Css não funciona em iframe, pedir para dev colocar ID

            script = '$(".box-iframe").attr("id", "tempId");' # solução para quado o não tem acesso ao codigo fonte ou o dev não quer colocar Id
            page.execute_script(script) # comando do capybara, que roda um script dentro da pagina

            within_frame('tempId') do
               expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
            end


        end

    end


end    