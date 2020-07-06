###Automação de aplicação Web com Ruby/Capybara

Para criar o gemfile utilziar o comando ``` bundle init ´´´´ esse comando vai criar a estrutura principal do nosso projeto em Ruby.
Obs: Caso o comando não funcione, utilizar o comando ``` gem install bundler ´´´´ esse comando instala o bundler nosso gerenciador de bibliotecas Ruby.

Dentro do arquivio gemfile adicionar o seguinte codigos:
´´´´
	gem "capybara", "3.31.0"
	gem "rspec", "3.9.0"
	gem "selenium-webdriver", "3.142.7"
	gem "ffi" , "1.12.2"

´´´´
Obs: Como no java que temos o ``` mvnrepository ```, no Ruby temos ``` rubygems.org ``` onde encontramos nossas dependencias.

Após salvar o arquivo gemfile, executar o comando: ``` bundle install ```

Extra: Observar que dentro da pasta do seu projeto apareceu um arquivo com o nome de "Gemfile.lock", esse arquivo
é um registro das intalações de dependencias.


Ainda do no terminal utilizar o comando ``` rspec --init ```, esse comando iniciara um projeto de testes.
Contendo o arquivo .rspec e o spec_helper(Arquivo onde contem as configurações de inicialização dos testes).

Adicionar dentro do spec_helper os imports, DSL do Capybara e selenium:  

``` 
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
###Atenção !!!

-Não esquecer do WEBDRIVER

Para chrome: https://chromedriver.chromium.org/downloads
Versão deve ser a mesma do navegador

Para firefox: https://github.com/mozilla/geckodriver/releases

Alterar o ``` config.default_driver = :selenium```

Colar o driver dentro da pasta Windows(Essa pasta é uma pasta PATH)
Extra: Para saber qual são as pastas do PATH, utilizado o comando echo %path%.....



Comandos:
	Visit 'SITE' -----> Utilziado para fazer o acesso ao site