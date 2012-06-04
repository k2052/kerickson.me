require 'kramdown' 
require 'nokogiri'
class Post
  include MongoMapper::Document 
  include MongoMapperExt::Slugizer      
  include MongoMapperExt::Tags 
  plugin MongoMapper::Plugins::Timestamps

  # Keys
  key :title,     String
  key :body,      String
  key :intro,     String   
  key :mistakes,  Integer
  
  # Key Settings
  slug_key :title
  timestamps!     
end