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

function initMap() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  directionsService = new google.maps.DirectionsService();
  var handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'gmap'}}, function(){
    directionsDisplay.setMap(handler.getMap());
    handler.fitMapToBounds();
  });
    calcRoute(directionsService, directionsDisplay);
  $('#refresh-map').on("click", function() {
    calcRoute(directionsService, directionsDisplay);
  });
}

function calcRoute(directionsService, directionsDisplay) {
  var waypts = [];
  $('.ui-sortable-handle').each(function() {
    var self = $(this);
    waypts.push({
      location: new google.maps.LatLng(parseFloat(self.find('#lat').val()), parseFloat(self.find('#lng').val())),
      stopover: true
    });
  });
  var request = {
      origin: waypts[0].location,
      destination: waypts[waypts.length-1].location,
      waypoints: waypts.slice(1,-1),
      optimizeWaypoints: true,
      travelMode: google.maps.TravelMode.WALKING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
}

function replaceActivity(array,i) {
  var new_item = _.sample(array);
  $("#item"+i).html(
    new_item.hash.name + new_item.hash.location.city + new_item.hash.rating +
    "<input type='hidden' name='activity_id' id='activity_id' value=" + new_item.hash.id + ">" +
    "<input type='hidden' name='lat' id='lat' value='" + new_item.hash.location.coordinate.latitude + "'>" +
    "<input type='hidden' name='lng' id='lng' value='" + new_item.hash.location.coordinate.longitude + "'>"
  );
}

function deleteActivity(array,i) {
  var result = confirm("Delete activity?");
  if (result) {
    $("#li"+i).remove();
  }
}

function saveItinerary() {
  var activities = [];
    $('.ui-sortable-handle #activity_id').each(function() {
      activities.push($(this).val());
  });
  var itineraryName=$('#itineraryName').val();
  $.ajax({
    url: "/itineraries",
    type: "POST",
    data: {name:itineraryName,activity_ids: activities},
    dataType: "script",
    success: function(resp){
      $("#save-itinerary").replaceWith("");
    }
  });
}
