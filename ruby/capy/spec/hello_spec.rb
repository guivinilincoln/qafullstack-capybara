 describe "Meu primeiro script" do # suite de teste
      
    it "visitar a página" do # caso de teste
        visit ''
        puts page.title
        expect(page.title).to eql "Training Wheels Protocol"
        page.save_screenshot('log/hello_com_sucesso.png')
        sleep 5 #temporário 
    end
 end