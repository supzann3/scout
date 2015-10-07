function getGeoLocation(callback) {
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
    getGeoLocation(function(){
    });
  }
    // getGeoLocation();
  $('#location').click(function() {
    e.preventDefault();
    deleteCookie("lat_lng=");
    getGeoLocation(function(){
      $('#location').unbind("submit").submit();
    });
  });
});
