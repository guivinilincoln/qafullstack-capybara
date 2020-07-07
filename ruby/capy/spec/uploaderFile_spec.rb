describe 'Uploader File', :up do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/upload'
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt' #rDir.pwd etorna o caminho do diretorio do projeto
        @img = Dir.pwd + '/spec/fixtures/img.jpg'
        
    end


    it 'Enviado arquivo de text' do
       # puts @arquivo #@ significa que essa variavel é global    
       
        attach_file('file-upload', @arquivo) #attach_file é usado para fazer upload de arquivo é um comando especifico do rpesc, ele utiliza o Id do elemento
        click_button 'Upload' # usando value
        div_arquivo = find('#uploaded-file') #fazendo um find por Id
        expect(div_arquivo.text).to eql 'arquivo.txt' #fazendo um assertEquals para ver e o nome é igual


    end

    it 'Enviado arquivo de img' do
        attach_file('file-upload', @img) 
        click_button 'Upload' # usando value

        div_arquivo = find('#uploaded-file') #fazendo um find por Id
        expect(div_arquivo.text).to eql 'img.jpg' #fazendo um assertEquals para ver e o nome é igual

       # Capybara.defoult_max_wait_time = Tempo maximo que um elemento demora para aparecer na tela

        imag = find('#new-image') #busco o elemento por ID e guardo ele dentro do capybara
        expect(imag[:src]).to include 'img.jpg'  #aqui já temos acesso a todos os atributos do elemento, verifico se no atributo src contem img.jpg

    end



    after(:each) do

        sleep 3

    end



end