require 'padrino/sprockets'   
class Me < Padrino::Applicatio
  use Airbrake::Rack     
  register Padrino::Rendering  
  register Padrino::Cache   
  register Padrino::Helpers   
  register CompassInitializer

  enable :caching if Padrino.env == :production
  set :cache, Padrino::Cache::Store::Redis.new(::Redis.new)            
  
  ## 
  # Assets
  #  
  set :stylesheets_folder, :css
  set :javascripts_folder, :js
  register Padrino::AssetHelpers
  register Padrino::Sprockets   
  register Padrino::Responders
  
  assets do    
    digest false  
    handle_stylesheets false  
    assets_folder '/public'
    append_path 'assets/js'  
    append_path '../lib/assets/js'
    append_path '../vendor/assets/js'   
  end  
end