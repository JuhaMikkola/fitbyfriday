(function($){
  $(document).ready(function(){
    $('#new_workout').on('submit', function(event) {
      var self = $(this),
          path = location.pathname;

      event.preventDefault();

      $.ajax({
        url: path,
        method: "POST",
        dataType: "html",
        data: self.serialize(),
        success: function(data) {
          $('.close-reveal-modal').click();
          $('#workout-container').html(data);
          self.find('input[type=text]').val('');
        }
      });
    });

    $('')

  });
})(jQuery);
