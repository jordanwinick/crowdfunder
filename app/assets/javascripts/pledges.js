$(document).on('ready page:load', function(){
  $('.btn-pledge').hide();
  $('.reward-card').on('click', function(){
    var self = $(this);
    var url = self.find('form').attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'html'
    }).done(function(data){
      $('body').append('<p class="flash notice">Pledged!</p>');
      $('.flash').fadeOut(2000);
    });
  });
});