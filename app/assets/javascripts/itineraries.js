$(document).ready(function(){

});

function replaceActivity(array,i) {
  $("#"+i).html(
    array[i+1].hash.name + array[i+1].hash.location.city + array[i+1].hash.rating +
    "<button type='button' onclick='replaceActivity(" + array + "," + i + ")'>Replace</button>"
  );
}
