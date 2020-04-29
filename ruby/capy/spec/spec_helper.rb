require "capybara" # Faz a importação das dependencias para dentro do arquivo de configuração 
require "capybara/rspec" 
require "selenium-webdriver" 

RSpec.configure do |config|
 
  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL #Inclue DSL do Capybara (Todos os recursos)

end

Capybara.configure do |config|

  config.default_driver = :selenium_chrome #faz com que nossos testes sejam executados no chrome
  
end
