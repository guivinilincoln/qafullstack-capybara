 describe "Meu primeiro script" do # suite de teste
      
    it "visitar a página" do # caso de teste
        visit 'https://training-wheels-protocol.herokuapp.com/'
        expect(page.title).to eql "Training Wheels Protocol"
        sleep 5 #temporário 
    end

 end