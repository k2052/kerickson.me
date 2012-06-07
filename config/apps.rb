require 'uri'    

Padrino.configure_apps do
  set :session_secret, '94a00a1fd1a120762ce925da3bce6a27224ce775e4e27d5dd8624feadf110972'
  set :assets_host, ENV['ASSETS_HOST'] if Padrino.env == :production  
       
  if Padrino.env == :production    
    enable :caching 
    uri = URI.parse(ENV["REDIS_URL"])
    set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => uri.host, :port => uri.port, :password => uri.password))   
  end     
         
  set :views, File.expand_path('../../views', __FILE__)  
end

# Mounts the core application for this project
Padrino.mount("Me").to('/')     
Padrino.mount("app_notes", :app_class => "MeNotes").to('/notes') unless Padrino.env == :production 
Padrino.mount("app_notes", :app_class => "MeNotes").to('/').host('notes.kerickson.me') if Padrino.env == :production