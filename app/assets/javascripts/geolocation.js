function getGeoLocation() {
 navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
 var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
 document.cookie = "lat_lng=" + escape(cookie_val);
}

function deleteCookie(name) {
 document.cookie = name + '=; Max-Age=0';
}

$(document).ready(function() {
  var hiddenLocationTag=$('#lat_lng').val();
  if (hiddenLocationTag === "") {
    getGeoLocation();
  }
    // getGeoLocation();
  $('#location').click(function() {
    deleteCookie("lat_lng=");
    getGeoLocation();
  });
});
