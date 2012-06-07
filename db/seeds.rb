require 'ffaker'   

unless Padrino.env == :production      
  if Note.all.count < 25        
    shell.say "Creating some Notes. 5 to be exact"
    
    5.times do     
      note = Note.new(:title => Faker::Lorem.words(4).join(" "),
                      :intro => Faker::Lorem.paragraphs(2).join(" "),
                      :body  => Faker::Lorem.paragraphs(20).join(" "),
                      :tags  => Faker::Lorem.words(3).push('cats')      
                     )        
      note.save
    end
  end
end