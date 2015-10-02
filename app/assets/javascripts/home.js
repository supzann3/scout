$(document).ready(function(){
  onLoad();
});

function onLoad() {
  $("#activity_form").submit(function(e){
    e.preventDefault();

    getLocation(function(location){
      $('#longitude').val(location.coords.longitude);
      $('#latitude').val(location.coords.latitude);
      $('#activity_form').unbind("submit").submit();
    });

  });

  function getLocation(callback) {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(callback);
    } else {
      $('#error-msg').html("Geolocation isn't supported in your browser.");
    }
  }
}


$(document).ready(function() {
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID

    var x = 1; //initlal text box count
    var j=0;
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            j++;
            $(wrapper).append('<div><select name="search[ids]['+j+'][tag]" id="search_ids_'+j+'_tag"><option value="active">Active Life</option><option value="arts">Arts &amp; Entertainment</option><option value="auto">Automotive</option><option value="beautysvc">Beauty &amp; Spas</option><option value="bicycles">Bicycles</option><option value="education">Education</option><option value="eventservices">Event Planning &amp; Services</option><option value="financialservices">Financial Services</option><option value="food">Food</option><option value="health">Health &amp; Medical</option><option value="homeservices">Home Services</option><option value="hotelstravel">Hotels &amp; Travel</option><option value="localflavor">Local Flavor</option><option value="localservices">Local Services</option><option value="massmedia">Mass Media</option><option value="nightlife">Nightlife</option><option value="pets">Pets</option><option value="professional">Professional Services</option><option value="publicservicesgovt">Public Services &amp; Government</option><option value="realestate">Real Estate</option><option value="religiousorgs">Religious Organizations</option><option value="restaurants">Restaurants</option><option value="shopping">Shopping</option></select><input type="text" name="search[ids]['+j+'][term]" id="search_ids_'+j+'_term"><button class="remove_field">-</button></div>'); //add input box
        }
    });

    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    });
});
