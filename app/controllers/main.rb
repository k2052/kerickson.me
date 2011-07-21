Me.controllers :main, :cache => true, :expires_in => 300 do    
  
  get :index, :map => "/" do    
    @posts = Post.all(:limit => 20)
    render 'index'
  end    
end