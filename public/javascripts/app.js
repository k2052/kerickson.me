$(document).ready(function() { 
  if($('body').height() > $(window).height()) {
    $('#sidebar').css('height', $('body').height());     
  } 
  else {
    $('#sidebar').css('height', $(window).height());     
  }
  $(window).bind( "resize", function ( event ) {  
    if($('body').height() > $(window).height()) {
      $('#sidebar').css('height', $('body').height());     
    } 
    else {
      $('#sidebar').css('height', $(window).height());     
    } 
  });       
  
  var toggled = false;
  
  $('#contact-open').click(function () {
    if(toggled == false) {
      $(this).addClass('active');   
      $('.in-sidebar, .sidebar-content, .not-contact').fadeOut();
      $('#contact').fadeIn();
      toggled = true; 
    } 
    else {  
      $(this).removeClass('active');         
      $('.in-sidebar, .sidebar-content').fadeIn();
      $('#contact').fadeOut();
      toggled = false;
    }
  });  
  
  $('#contact .close').click(function() {
    $('#contact-open').removeClass('active'); 
    $('#contact').fadeOut(); $('#contact').css("height", 0);  
    $('.in-sidebar, .sidebar-content, .not-contact').fadeIn();
    toggled = false;
  });
  
  $('#read_license').click(function() {
	  $('#license_wrap').fadeIn('slow');  
	  return false;
	});
});
