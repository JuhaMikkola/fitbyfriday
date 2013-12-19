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

    $('.friend-invite-form').on('submit', function(event) {
      event.preventDefault();

      var self = $(this);
      var url = $(this).attr("action");

      $.ajax({
        url: url,
        method: "POST",
        data: self.serialize(),
        dataType: "json",
        success: function(data) {
          self.remove();
          $("#awaiting-confirmation").append(data.name + "<br>")
        }
      });
    });
  });
})(jQuery);




