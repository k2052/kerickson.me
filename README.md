## Intro

Source code for http://kerickson.ne. 

## Installation/Setup

1. After that you'll need to setup the following ENV vars.
  You can either 1. Use your .bashrc file, 2. Use heroku and add the vars using their tool.
  Or 3. Use a heroku_env.rb file and place it in config/. heroku_ev.rb is loaded if it exists. 
  If you choose this method you should probably add the file to your gitignore so it is not checked in with subversion.
  
  ### ENV Vars     

  ```ruby
  if defined?(Padrino.env)
    if Padrino.env == :production  
      ENV['DOMAIN'] = 'kerickson.me'  
    else
      ENV['DOMAIN'] = 'localhost:3000' 
    end  
    if Padrino.env == :production
      ENV['BLOG_DOMAIN'] = 'kerickson.me/notes' 
    else      
      ENV['BLOG_DOMAIN'] = 'localhost:3000/notes' 
    end  
  end      

  ENV['ASSET_HOST']           = "http://assets%d.domain.me"  
  ENV['ASSET_HOST_COUNT']     = '4' 
  ENV['S3_ACCESS_KEY']        = 'XXXXXXX'
  ENV['S3_SECRET_ACCESS_KEY'] = 'XXXXXXXXXX' 

  # VLAD/Deployment Enviroment Variables
  ENV['DEPLOY_USER']      = "xxxt"
  ENV['APP_NAME']         = "me" 
  ENV['SSH_USER']         = "xxx" 
  ENV['DEPLOY_DOMAIN']    = "xxxx" 
  ENV['APP_DOMAIN']       = "kxxx"
  ENV['REPOSITORY']       = "ssh://#{ENV['DEPLOY_DOMAIN']}/home/#{ENV['DEPLOY_USER']}/repos/#{ENV['APP_NAME']}.git"
  ENV['DEPLOY_TO']        = "/home/#{ENV['DEPLOY_USER']}/#{ENV['APP_DOMAIN']}/#{ENV['APP_NAME']}"     
  ENV['NGINX_SITE_PATH']  = "/etc/nginx/sites-available/#{ENV['APP_DOMAIN']}"
  ENV['DEPLOY_VIA']       = "git"                   
  ```     
### Deployment                       

The app contains a VLAD deployment script that directly relies on git.   
To use it you'll need to make sure you've VLAD + git installed on both your sever and locally.
To understand how to setup your server paths correctly and to understand my deployment setup refer to config/deploy.rb

## License

Copyright (C) 2009-2010 Ken Erickson AKA Bookworm. (http://bookwormproductions.net)

Media License.    
 
You do not receive any rights to use the fonts, images or videos. 
These are for example purposes only and you must replace them.    
You may not use any of the fonts, images, or videos on any site without permission. 

Also please be reasonable with your css usage i.e don't just swap-out graphics.

All Source Code Is Licensed under WTFPL.

           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                   Version 3, August 2010. 
 
           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 
  0. Do Not Claim Authorship Of Code You Did Not Author.
  1. Do Not Use The Same Name As The Original Project.
  2. Beyond That, You just DO WHAT THE FUCK YOU WANT TO.   