Me.controllers :main, :cache => true, :expires_in => 300 do    
  
  get :index, :map => "/" do 
    @notes = Note.all(:limit => 5)
    render 'index'
  end    
end