# Enables support for Compass, a stylesheet authoring framework based on SASS.
# See http://compass-style.org/ for more details.
# Store Compass/SASS files (by default) within 'app/stylesheets'  
module CompassInitializer
  def self.registered(app)   
    require 'sass/plugin/rack'   

    Compass.configuration do |config|
      config.project_path               = Padrino.root
      config.sass_dir                   = "app/assets/css"
      config.project_type               = :stand_alone
      config.http_path                  = "/"
      config.css_dir                    = "public/css"
      config.images_dir                 = "public/images"  
      config.http_images_path           = "/" + 'images'
      config.javascripts_dir            = "public/js"
      config.output_style               = :expanded   
      config.http_generated_images_path = "/" + 'images'    
      
      if Padrino.env == :production   
        config.http_path        = "http://assets0." + ENV['DOMAIN'] 
        config.images_dir       =  "public/images"          
        config.output_style     = :compressed     
          
        config.asset_host do |asset|
          "http://assets%d.#{ENV['DOMAIN']}" % (asset.hash % 4)
        end        
      end     
    end  

    Compass.configure_sass_plugin!
    Compass.handle_configuration_change!

    app.use Sass::Plugin::Rack
  end
end