class Me < Padrino::Application
  register Padrino::Helpers
  register Padrino::Rendering   
  register CompassInitializer
  register AssetHatInitializer      
  # For Now Disable Cache
  # register Padrino::Cache   
  # 
  # enable :caching if Padrino.env == :production
  # 
  # set :cache, Padrino::Cache::Store::Redis.new(::Redis.new)
end