$(function() {
  $( "#each_activity" ).sortable({
     update: function(event, ui) { 
          console.log('update: '+ui.item.index())
      },
      start: function(event, ui) { 
          console.log('start: ' + ui.item.index())
      }
  });
  $( "#each_activity" ).disableSelection();
});
