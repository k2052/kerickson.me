require File.expand_path(File.dirname(__FILE__) + '/../../test_app_notes_config.rb')

describe "Notes Controller" do   
  setup do
    header "Host", "notes.kerickson.me"
  end  
  
  context "ajax" do     
    setup do   
      header 'Accept', 'application/json'    
      @note = Note.first
    end    
    
    should "return notes" do  
      get '/', {}, :xhr => true      
      assert last_response.status == 200
    
      notes = JSON.parse(last_response.body)
      assert !notes[0]['title'].blank?
      assert notes.length > 1  
    end                   
    
    should "return a note" do
      get "/#{@note.slug}", {}, :xhr => true  
      assert last_response.status == 200
    
      note = JSON.parse(last_response.body)
      assert !note['title'].blank?
    end
    
    should "like a note" do    
     get "/like/#{@note.slug}", {}, :xhr => true  
     assert last_response.status == 200
                       
     likes = JSON.parse(last_response.body)['data']
     assert likes['likes'].to_i > @note.likes
    end
    
    should "should reject malformed pagenum" do 
      get "/page/e--0=edd", {}, :xhr => true 
      assert last_response.status == 403
    end
    
    should "should reject malformed slug" do 
      get "/__-+_", {}, :xhr => true  
      assert last_response.status == 403
    end
  end   
  
  context "normal" do      
    setup do   
      header 'Accept', 'text/html' 
      @note = Note.first
    end 
    
    should "return notes" do  
      get '/', {}
      assert last_response.status == 200
    end                   
    
    should "return a note" do
      get "/#{@note.slug}", {}
      assert last_response.status == 200
    end
    
    should "should reject malformed pagenum" do 
      get "/page/e--0=edd", {}
      assert last_response.status == 403
    end
    
    should "should reject malformed slug" do 
      get "/__-+_", {}
      assert last_response.status == 403
    end    
    
    should "should return rss" do 
      get "/rss", {}
      assert last_response.status == 200
    end
  end
end