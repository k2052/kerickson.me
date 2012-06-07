require 'redcarpet'
class Note
  include MongoMapper::Document 
  include MongoMapperExt::Slugizer      
  include MongoMapperExt::Tags  
  include MongoMapperExt::Markdown
  plugin MongoMapper::Plugins::Timestamps

  # Keys
  key :title,     String
  key :body,      String
  key :intro,     String           
  key :likes,     Integer, :default => 0    
  key :likers,  Array
  
  # Key Settings
  slug_key :title, :unique => false
  timestamps!    
  markdown :body, :intro, {:parser => 'redcarpet'}       
  
  ##
  # Validatons
  #
  validates_presence_of :title, :if => :title_required?
  validates_presence_of :body,  :if => :body_required?
  validates_presence_of :intro, :if => :intro_required?
  
  def title_required?
    title.blank?
  end 
  
  def body_required?
    body.blank?
  end
  
  def intro_required?
    intro.blank?
  end
  
  def like(ip)    
    unless ip == '127.0.0.1'
      return false if self.likers.include?(ip.to_s)       
    end
    self.likes = self.likes + 1
    self.likers << ip.to_s
  end    
  
  def liked?(ip)  
    return self.likers.include?(ip.to_s)       
  end
end