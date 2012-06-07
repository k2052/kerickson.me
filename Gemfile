source :rubygems

# Server requirements
gem 'thin'

# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'  

# Component requirements
gem 'slim'       
gem 'airbrake'  
gem 'paginator'     
gem 'magic'  
gem 'redcarpet'  
gem 'escape_utils', :require => 'escape_utils'   
gem 'topsy'

# DB           
gem 'tzinfo'
gem 'mongo_mapper'  
gem 'mongomapper_ext', :git => "git://github.com/bookworm/mongomapper_ext.git" 
gem 'bcrypt-ruby', :require => "bcrypt"
gem 'bson_ext', :require => "mongo"         
gem 'redis', :require => 'redis'

# Assets 
gem 'compass'  
gem 'sprockets' 
gem 'coffee-script'  
gem 'uglifier' 
gem 'padrino-sprockets', :git => 'git://github.com/bookworm/padrino-sprockets.git'     
gem 'padrino-assethelpers', :git => 'git://github.com/bookworm/padrino-assethelpers.git'             
gem 'padrino-responders', :git => 'git://github.com/bookworm/padrino-responders.git'
gem 'yajl-ruby', :require => 'yajl'          

# Test requirements      
group :test do  
  gem 'fog'
  gem 'minitest', "~>2.6.0", :require => "minitest/autorun", :group => "test"  
  gem 'mini_shoulda', :require => 'mini_shoulda', :group => "test"    
  gem 'rack-test', :require => "rack/test", :group => "test"  
  gem 'ffaker', :require => 'ffaker'
end   

group :development do
  gem 'fog'
end

# Or Padrino Edge
gem 'padrino',  :git => 'git://github.com/bookworm/padrino-framework.git'