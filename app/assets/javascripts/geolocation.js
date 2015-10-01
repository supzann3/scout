function getGeoLocation(callback) {
  navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
  debugger;
}

function deleteCookie(name) {
  document.cookie = name + '=; Max-Age=0';
}

$(document).ready(function() {
  $('#search-btn').click(function(){
    getGeoLocation();
  });
});
