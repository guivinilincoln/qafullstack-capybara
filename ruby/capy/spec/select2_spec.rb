describe 'Select2', :select2 do

    describe('single', :single) do #sub suit

        before(:each) do
            visit 'apps/select2/single.html'
        end

        it 'select ator por nome' do
            find('.select2-selection--single').click #select por capybara por class
            sleep 1
            find('.select2-results__option', text: 'Adam Sandler').click
            sleep 5
        end

        it 'Busca e clica no ator' do
            find('.select2-selection--single').click #select por capybara por class
            sleep 1
            find('.select2-search__field').set 'Chris Rock'
            sleep 1
            find('.select2-search__field').click
            sleep 1
        end
    end

    describe('multiple', :mult) do

        before(:each) do
            visit 'apps/select2/multi.html'
        end

        def seleciona(ator)

            find('.select2-selection--multiple').click
            find('.select2-search__field').set ator
            find('.select2-results__option').click

        end

        it 'Seleciona Varios Atores' do

            atores = ['Jim Carrey', 'Owen Wilson', 'Kevim James']
           
            atores.each do |a|
                seleciona(a)
            end

        end

    end


end