class Note   
  include MongoMapper::EmbeddedDocument
  
  # Keys
  key :text,  String   
  key :fnid,  String
end