class Link   
  include MongoMapper::EmbeddedDocument
  
  # Keys
  key :href,  String
  key :text,  String
  key :title, String 
end