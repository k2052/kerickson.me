require File.expand_path(File.dirname(__FILE__) + '/../../test_app_config.rb')

describe "Main Controller" do   
  setup do
    header "Host", "example.org"
  end
    
  context "ajax" do     
    setup do   
      header 'Accept', 'application/json' 
    end   
    
    should "return notes" do 
      get '/', {}, :xhr => true  
      assert last_response.status == 200
      
      notes = JSON.parse(last_response.body)
      assert !notes[0]['title'].blank?
      assert notes.length > 1
    end
  end   
  
  context "normal" do     
    setup do
      header 'Accept', 'text/html' 
    end
    
    should "return index" do 
      get '/', {}
      assert last_response.status == 200
    end
  end
end