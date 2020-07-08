# Automação de aplicação Web com Ruby/Capybara

Para criar o gemfile utilziar o comando `bundle init` esse comando vai criar a estrutura principal do nosso projeto em Ruby.
Obs: Caso o comando não funcione, utilizar o comando `gem install bundler` esse comando instala o bundler nosso gerenciador de bibliotecas Ruby.

Dentro do arquivio gemfile adicionar o seguinte codigos:
```sh
	gem "capybara", "3.31.0"
	gem "rspec", "3.9.0"
	gem "selenium-webdriver", "3.142.7"
	gem "ffi" , "1.12.2"
```
Obs: Como no java que temos o ` mvnrepository `, no Ruby temos `rubygems.org` onde encontramos nossas dependencias.

Após salvar o arquivo gemfile, executar o comando: `bundle install`

Extra: Observar que dentro da pasta do seu projeto apareceu um arquivo com o nome de "Gemfile.lock", esse arquivo
é um registro das intalações de dependencias.


Ainda do no terminal utilizar o comando `rspec --init` , esse comando iniciara um projeto de testes.
Contendo o arquivo .rspec e o spec_helper(Arquivo onde contem as configurações de inicialização dos testes).

Adicionar dentro do spec_helper os imports, DSL do Capybara e selenium:  

```sh
require "capybara" 
require "capybara/rspec" 
require "selenium-webdriver" 

RSpec.configure do |config|

config.include Capybara::DSL #Inclue DSL do Capybara (Todos os recursos)

end

Capybara.configure do |config|

  config.default_driver = :selenium_chrome
  
end

```

### Atenção !!!

- Não esquecer do WEBDRIVER

Para [Google Chrome](https://chromedriver.chromium.org/downloads)
 	- Versão deve ser a mesma do navegador

Para [Firefox](https://github.com/mozilla/geckodriver/releases)

Alterar o `config.default_driver = :selenium`

Colar o driver dentro da pasta Windows(Essa pasta é uma pasta PATH)

 - Extra: Para saber qual são as pastas do PATH, utilizado o comando `echo %path%`.....



### Comandos:

#### Essencial:
| Comando | Descrição |
| ------ | ------ |
|Visit 'SITE'|Utilziado para fazer o acesso ao site|
|expect(page.title).to eql "Training Wheels Protocol"| Utilizado esperar um resultado|
|fill_in 'username', with: 'seu dado'|Utilizado para preencher um campo name/id|
|click_button 'Enviar'|tilizado para clicar em botões por name|
|find('#flash').visible?|Utilizado para saber se o elemto esta na tela, retorna true/false|
|find('.team-stark .column')|Busca po classe pai (.team...) e (.column) é a filha, elemento alvo|

#### Find com expresções regulares:
		-find('img[alt^=Homem]')#começa com
       	-find('img[alt*=Aran]')#Contém
        -find('img[alt$=Aranha]')#Termina com
	


#### Buscadores:
| Comando | Descrição |
| ------ | ------ |
|#flash |buscar por id|
|.select2-selection--single | buscar por class|
|input[value=guardians] | buscar utilizando CSS selector pelo atributo value, no exemplo utilizamnos input, porem pode ser por img,a,div e etc..|
	

#### Utilizando escopo:

```sh
	within('#signup') do  #Escopo
        find('input[name=username]').set 'Teste22222'
        find('input[name=password]').set '1234!'
        click_link 'Criar Conta' #no pagina o elemento é um <a>, logo temos que usar click link
    end
```

#### Busca por Ids Dinamicos:
```sh
	it 'Castro' do
        	find('input[id$=UsernameInput]').set 'GuilhermeTest' # expressão regular termina
        	find('input[id^=PasswordInput]').set '123456@' #expressão regular começa com
        	find('a[id*=GetStartedButton').click # expressão regular Contém 
    	end
```

#### Iframe: 

```sh
	- Bom:
		within_frame('burgerId') do
			produto =  find('.menu-item-info-box', text: 'REFRIGERANTE')
			produto.find('a').click
			expect(find('#cart')).to have_content 'R$ 4,50'
		end
```
```sh
	- Ruim:
		script = '$(".box-iframe").attr("id", "tempId");' # Sem acesso ao  codigo fonte ou o dev não quer colocar Id
    	page.execute_script(script) # comando do capybara, que roda um script dentro da pagina
    		within_frame('tempId') do
         		expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
    		end
```

#### Headless: 
	- Para executar os testes em headless, adicionar essa configurarção dentro do `spec_helper.br` dentro da chave Capybara.configure
```sh
	config.default_driver = :selenium_chrome.headless
```

#### URL padrão: 
	- Para executar os testes com URL padrão, adicionar essa configurarção dentro do `spec_helper.br` dentro da chave Capybara.configure
```sh
	 config.app_host = 'URL PADRÃO'
```

#### Dimensão da janela:

	- Para executar os testes com resolução determinada, adicionar essa configurarção dentro do `spec_helper.br`.
```sh
	config.before(:example)do
    	page.current_window.resize_to(1280, 800)
  	end
```


#### Screenshot:

 - Adicionar essa configurarção dentro do `spec_helper.br`.
```sh
	 config.after(:exemple) do |e|
    	nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ', '_')
    	page.save_screenshot('log/' +nome + '.png')
	 end
```

- Se queiser que tire um Screenshot adicionar. 
	
```sh
	page.save_screenshot('log/' +nome + '.png') if e.exception 
```


