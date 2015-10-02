$(function() {
  $( "#each_activity" ).sortable({
     update: function(event, ui) {
          console.log('update: '+ui.item.index());
      },
      start: function(event, ui) {
          console.log('start: ' + ui.item.index());
      }
  });
  $( "#each_activity" ).disableSelection();
});

function replaceActivity(array,i) {
  $("#item"+i).html(
    array[i+1].hash.name + array[i+1].hash.location.city + array[i+1].hash.rating +
    "<input type='hidden' name='activity_id' id='activity_id' value=" + array[i+1].hash.id + ">"
  );
}

function saveItinerary() {
  var activities = [];
    $('.ui-sortable-handle #activity_id').each(function() {
      activities.push($(this).val());
  });
  $.ajax({
    url: "/itineraries",
    type: "POST",
    data: {activity_ids: activities},
    dataType: "script",
    success: function(resp){
      $("#save-itinerary").replaceWith("");
    }
  });

}
