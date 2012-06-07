require File.expand_path(File.dirname(__FILE__) + '/../../test_app_notes_config.rb')

describe "API Controller" do
  setup do
    header "Host", "notes.kerickson.me"
  end
    
  should "create a new note" do              
    title = Faker::Lorem.words(4).join(" ")
    note = {:title => title, 
            :intro => Faker::Lorem.paragraphs(2).join(" "),
            :body  => Faker::Lorem.paragraphs(20).join(" "),
            :tags  => Faker::Lorem.words(3).push('cats')   
    }  
    note = note.to_json      
    
    post '/api/notes/create', {"note" => note}, :xhr => true      
    assert last_response.status == 200

    note = JSON.parse(last_response.body)
    assert !note['title'].blank?
    assert note['title'] == title
  end
end