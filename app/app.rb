class Me < Padrino::Application
  register Padrino::Helpers
  register Padrino::Rendering   
  register CompassInitializer
  register AssetHatInitializer      
  register Padrino::Cache   
  
  enable :caching if Padrino.env == :production
  
  set :cache, Padrino::Cache::Store::Redis.new(::Redis.new)
end