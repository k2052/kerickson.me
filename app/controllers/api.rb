Me.controllers :api do
 
  before do       
    unless @env['REMOTE_ADDR'] == '127.0.0.1' || @env['REMOTE_ADDR'] == ENV['IP_ACCESS'] 
      halt 403, "Not Authorized"
    end   
  end  
  
  post :post_create, :map => '/api/posts/create' do  
    @post = Post.from_json(params[:post])        
    
    if @post.save    
      respond(@post)
    else
      respond(@post)
    end
  end   
end 