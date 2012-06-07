require 'padrino/sprockets'   
class MeNotes < Padrino::Application
  use Airbrake::Rack     
  register Padrino::Rendering  
  register Padrino::Cache   
  register Padrino::Helpers   
  register CompassInitializer
              
  layout :notes        
  
  ## 
  # Assets
  #  
  set :stylesheets_folder, :css
  set :javascripts_folder, :js   
  set :assets_uri_root, '/'
  register Padrino::AssetHelpers
  register Padrino::Sprockets   
  register Padrino::Responders
  
  assets do    
    digest false  
    handle_stylesheets false  
    assets_folder '/public'
    append_path '../app/assets/js'  
    append_path '../lib/assets/js'
    append_path '../vendor/assets/js'   
  end   
end