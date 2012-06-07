require 'topsy' 
MeNotes.controllers :notes, :provides => [:html, :json] do   
  
  before(:index) do 
    if params[:page]     
      @pagenum = params[:page].to_i 
      halt 403, "Malformed Pagenum" if !@pagenum.is_a?(Numeric) or @pagenum == 0
    else  
      @pagenum = 0     
    end
  end   
  
  before(:index) do    
    options = {} 
    if request.xhr? or mime_type(:json) == request.preferred_type  
      @notes = Note.all(:skip => @pagenum * 5, :limit => 5)
    else   
      @pager = Paginator.new(Note.count, 5) do |offset, per_page|
        options[:skip] = offset 
        options[:limit] = per_page
        Note.all(options)  
      end
      @notes = @pager.page(@pagenum)
    end
  end
  
  before(:show, :like) do 
    slug  = params[:slug].match(/^([A-Za-z0-9-]+)/i).to_s    
    halt 403, "Malformed Slug" if slug.blank?
    @note = Note.find_by_slug(slug)     
    not_found unless @note
  end  
    
  get :rss, :map => '/rss' do    
    @notes = Note.all(:limit => 25)      
    render "notes/list"
  end    
  
  get :like, :map => '/like/:slug' do 
    @note.like(@env['REMOTE_ADDR']) 
    if @note.save               
      data = {:data => {:likes => @note.likes}}
      data.to_json   
    else
      respond(@note)
    end
  end
  
  get :index, :map => '/(page/:page)' do 
    respond(@notes)
  end            
  
  get :show, :map => '/:slug' do     
    respond(@note, :layout => :note)   
  end      
end