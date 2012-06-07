#= require jquery  

$(document).ready ->
  $("#like_button").click ->  
    href = window.location.pathname 
    slug = href.substr(href.lastIndexOf('/') + 1)      
  
    if window.location.host is "notes.kenerickson.me"   
      path = "/like/#{slug}"    
    else
      path = "/notes/like/#{slug}"
    
    if !$("#like").hasClass('liked') or window.location.host is "localhost:3000" 
      $.get path, (data, status) -> 
        resp = $.parseJSON(data)
        if resp.data 
          likes = resp.data.likes
          $("#like").addClass('liked')   
          $("#like_button .text").html('Liked')
          $("#likes .count_text").html("#{likes}")         
      
    return false     