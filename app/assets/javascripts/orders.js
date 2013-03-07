var rendererOptions = {
    draggable: true
};
var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
var directionsService = new google.maps.DirectionsService();
var map;
var kuznia = new google.maps.LatLng(50.186425, 18.80099);

function initialize() {
    var mapOptions = {
        zoom: 16,
        mapTypeId: google.maps.MapTypeId.HYBRID,
        center: kuznia,
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    directionsDisplay.setMap(map);

    google.maps.event.addListener(directionsDisplay, 'directions_changed', function() {
        computeTotalDistance(directionsDisplay.directions);
    });

    calcRoute();
}

function calcRoute() {
    var city = document.getElementById("order_city").value;
    var street = document.getElementById("order_street").value;
    var homeNumber = document.getElementById("order_home_number").value;
    var deliveryTarget = "Polska, Śląsk, " + city + ", " + street + " " + homeNumber
    var request = {
        origin: kuznia,
        destination: deliveryTarget,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
}

function computeTotalDistance(result) {
  var total = 0;
  var myroute = result.routes[0];
  for (i = 0; i < myroute.legs.length; i++) {
    total += myroute.legs[i].distance.value;
  }
  total = total / 1000.
  document.getElementById("total").innerHTML = "Dystans = " + total + "km";
}
