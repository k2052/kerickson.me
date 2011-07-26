# A Very simple API. 
# Speaks JSON and handles imports from the hit list.    
# Protected by IP but could just as easy be done using Oauth.
# I use a variety of local ruby scripts to pull out my data and push it up. 
# Some of these can be found in the github repo here
Me.controllers :api do
 
  before do       
    unless @env['REMOTE_ADDR'] == '127.0.0.1' || @env['REMOTE_ADDR'] == ENV['IP_ACCESS'] 
      halt 403, "Not Authorized"
    end   
  end  
  
  post :post_create, :map => '/api/posts/create' do  
    @post = Post.from_json(params[:post])        
    
    if @post.save
      'Saved Post Successfully'
    else
      halt 401, @post.errors.full_messages   
    end
  end   
end 