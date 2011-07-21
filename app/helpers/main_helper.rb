Me.helpers do
  
  def post_class()
    post_class = @post.class.to_s
    post_class << ' post' 
    post_class << ' last' if @index == @posts.last
    post_class << ' first' if @index == 0
  end
end