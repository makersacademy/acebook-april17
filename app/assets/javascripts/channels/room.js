App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {

  },

  disconnected: function() {

  },

  received: function(data) {
    return $('#messages').append(data['message']);
  },

  speak: function(message) {
    return this.perform('speak', {
      message: message
    });
  }
});


document.addEventListener("DOMContentLoaded", function(event) { 
  $(function(){
      $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
        if (event.keyCode === 13)  {
          App.room.speak(event.target.value);
          event.target.value = '';
          return event.preventDefault();
        }
      });
      $('#add_message').submit(function(event) {
          console.log(event.target)
          App.room.speak(event.target);
          event.target.value = '';
          return event.preventDefault();
      });
  });
});

