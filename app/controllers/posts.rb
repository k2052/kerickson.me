Me.controllers :posts, :cache => true, :expires_in => 300 do    
  
  get :about, :map => "/about" do  
    render 'about'  
  end
   
  get :show, :map => "/:slug" do
    @post = Post.find_by_slug(params[:slug])
    render 'posts/post'
  end
end