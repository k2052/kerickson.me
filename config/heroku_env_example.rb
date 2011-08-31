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

ENV['ASSET_HOST']           = "http://assets%d.kerickson.me"  
ENV['ASSET_HOST_COUNT']     = '4' 
ENV['S3_ACCESS_KEY']        = 'XXXXXXXX'
ENV['S3_SECRET_ACCESS_KEY'] = 'XXXXXXXX'     

# Authorization
ENV['IP_ACCESS']        = 'XXXXXXX' 

# VLAD/Deployment Enviroment Variables
ENV['DEPLOY_USER']      = "XXX"
ENV['APP_NAME']         = "me" 
ENV['SSH_USER']         = "XXX" 
ENV['DEPLOY_DOMAIN']    = "XXXX" 
ENV['APP_DOMAIN']       = "kerickson.me"
ENV['REPOSITORY']       = "ssh://#{ENV['DEPLOY_DOMAIN']}/home/#{ENV['DEPLOY_USER']}/repos/#{ENV['APP_NAME']}.git"
ENV['DEPLOY_TO']        = "/home/#{ENV['DEPLOY_USER']}/#{ENV['APP_DOMAIN']}/#{ENV['APP_NAME']}"     
ENV['NGINX_SITE_PATH']  = "/etc/nginx/sites-available/#{ENV['APP_DOMAIN']}"
ENV['DEPLOY_VIA']       = "git"