MeNotes.controllers :api do
 
  before do       
    unless @env['REMOTE_ADDR'] == '127.0.0.1' || @env['REMOTE_ADDR'] == ENV['IP_ACCESS'] 
      halt 403, "Not Authorized"
    end   
  end  
  
  post :note_create, :map => '/api/notes/create' do  
    @note = Note.from_json(params[:note])        
    
    @note.save    
    @note.to_json
  end   
end 