$(document).ready(function() {

  $('#submit').on('click', function(){
    $('#mce-EMAIL').val($('#user_email').val())
    $('#mce-FNAME').val($('#user_first_name').val())
    $('#mce-LNAME').val($('#user_last_name').val())
    if ($('#optout').is(':checked') != false) {
      console.log($('#optout').is(':checked'));
      $('#mc-embedded-subscribe').trigger('click');
    };
  });


  $('#mc-embedded-subscribe').on('click', function(e){
    e.preventDefault();
    $.ajax({
      type : 'POST',
      cache: false,
      url  : 'http://tefal.us7.list-manage.com/subscribe/post?u=f1e1f9734ffb1dc33f4668b72&amp;id=d7adb445ff',
      data : $('form#mc-embedded-subscribe-form').serialize()
    });
  });   

  $('#user_email').keyup(function(){
    $('#mce-EMAIL').val($(this).val())
  });
  $('#user_first_name').keyup(function(){
    $('#mce-EMAIL').val($(this).val())
  });
  $('#user_last_name').keyup(function(){
    $('#mce-EMAIL').val($(this).val())
  });
  
});
