function replaceActivity(array,i) {
  $("#item"+i).html(
    array[i+1].hash.name + array[i+1].hash.location.city + array[i+1].hash.rating +
    "<input type='hidden' name='activity_id' id='activity_id' value=" + array[i+1].hash.id + ">"
  );
}

function saveItinerary(count) {
  i = 0;
  var activities = [];
  for (i = 0; i < count; i++) {
    activities.push($("#item"+i+" #activity_id").val());
  }
  $.ajax({
    url: "/itineraries",
    type: "POST",
    data: {activity_ids: activities},
    dataType: "script",
    success: function(resp){
      $("#save-itinerary").replaceWith("Saved!!!");
    }
  });

}
