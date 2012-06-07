require File.expand_path(File.dirname(__FILE__) + '/../test_app_notes_config.rb')        

describe "Note" do      
  should "create a new note save and then destroy it" do     
    note = Note.new(:title => Faker::Lorem.words(4).join(" "), 
                    :intro => Faker::Lorem.paragraphs(2).join(" "), 
                    :body  => Faker::Lorem.paragraphs(20).join(" "), 
                    :tags  => Faker::Lorem.words(3).push('cats')      
                   )        
    note.save
    assert note.errors.size == 0   
    assert note.destroy
  end    
  
  should "fail to create a note and return validation errors" do          
    note = Note.new()        
    assert note.save == false
  end
  
  should "return some notes" do  
    notes = Note.all()
    assert notes.count > 0
  end     
  
  should "update the likes" do  
    note  = Note.first()       
    likes =  note.likes
    note.like(Faker::Internet.ip_v4_address)
    note.save
    assert note.errors.size == 0    
    note = Note.find_by_id(note.id)       
    assert note.likes > likes
  end
end