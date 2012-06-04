Me.controllers :main, :cache => true, :expires_in => 300 do    
  
  get :index, :map => "/" do    
    render 'index'
  end    
end