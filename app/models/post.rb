require 'kramdown' 
require 'nokogiri'
class Post
  include MongoMapper::Document 
  include MongoMapperExt::Slugizer      
  include MongoMapperExt::Tags 
  plugin MongoMapper::Plugins::Timestamps

  # Keys
  key :title,     String
  key :body_src,  String
  key :body,      String
  key :intro_src, String
  key :intro,     String   
  key :mistakes,  Integer
  
  # Key Settings
  slug_key :title
  timestamps!     
  
  # Associations
  has_many :links
  has_many :notes
  
  # Callbacks
  before_save :parse_markdown, :parse_links, :parse_notes        
  
  def chars()
    self[:body_src].length
  end   
  
  def stupids() 
    notes_count = 1 if self.notes.count == 0
    links_count =  1 if self.links.count == 0  
    (chars / 6) / notes_count / links_count
  end  
  
  def doc
    return @doc if @doc
    @doc = Nokogiri::HTML(self[:body])
  end  
  
  def url()
    'http://' << ENV['BLOG_DOMAIN'] << '/' << self.slug
  end 
  
  def generate_slug
    return false if self[self.class.slug_key].blank?
    max_length = self.class.slug_options[:max_length]
    min_length = self.class.slug_options[:min_length] || 0

    slug = self[self.class.slug_key].parameterize.to_s
    slug = slug[0, max_length] if max_length

    if slug.size < min_length
      slug = nil
    end
    post = Post.first(:slug => slug)
    if post
      self.slug = self.created_at.strftime("%j-%d")+"-"+slug
    else
      self.slug = slug
    end
  end
  
  private             
    def parse_markdown()
      markdown    = Kramdown::Document.new(self[:body_src])
      self[:body] = markdown.to_html
    end  
    
    def parse_links()
      self.links.clear
      doc.css('a[@href^="http://"]').each do |link| 
        self.links << Link.new(:title => link['title'], :text => link.text, :href => link['href']) 
      end
    end
    
    def parse_notes()    
      self.notes.clear
      doc.css('.footnotes li').each do |note| 
        self.notes << Note.new(:text => note.text, :fnid => note['id'] ) 
      end
    end
end