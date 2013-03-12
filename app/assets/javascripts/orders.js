// combo scipt
var mapTop;
var mapBottom;
var rendererOptions = {
    preserveViewport: true
}
var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
var directionsService = new google.maps.DirectionsService();
var geocoder;
var bounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(50.258839,18.667831),
    new google.maps.LatLng(50.099881,18.917427)
);
var marker = new google.maps.Marker();
var origin = new google.maps.LatLng(50.186428, 18.801008);
var toAddressLanLng;


window.onload = initialize();

function initialize() {
    document.getElementById("btn").onclick = function(){codeAddress()};
    geocoder = new google.maps.Geocoder();
    var mapOptions = {
        zoom: 19,
        center: origin,
        mapTypeId: google.maps.MapTypeId.HYBRID
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    // map.fitBounds(bounds);
    directionsDisplay.setMap(map);



}

function calcRoute() {
    var request = {
        origin: origin,
        destination: toAddressLatLng,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
            computeTotalDistance(directionsDisplay.directions)
        } else {
            alert("Routing was unsuccesfull for the following reason: " + status);
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
        document.getElementById("order_accurate_distance").value = total + " km";
}

function codeAddress() {
    var city = document.getElementById("order_city").value;
    var street = document.getElementById("order_street").value;
    var homeNumber = document.getElementById("order_home_number").value;
    var address = city + ", " + street + " " + homeNumber + ", Śląsk, Polska";
    geocoder.geocode({
        'address': address,
        'bounds': bounds // doesnt work. google bug.
    }, function(results, status) {
        // document.getElementById("geocoder_result").innerHTML = results[0].formatted_address;
        if (status == google.maps.GeocoderStatus.OK) {
            marker.setMap(null);
            map.setCenter(results[0].geometry.location);
            map.setZoom(17);
            marker = new google.maps.Marker({
                draggable: true,
                map: map,
                position: results[0].geometry.location,
                title: "dokładne miejsce dostawy"
            });
            getMarkerLocation();
            google.maps.event.addListener(marker, "dragend", function() {
                getMarkerLocation()
            });
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}

function getMarkerLocation() {
    var lat = marker.getPosition().lat();
    var lng = marker.getPosition().lng();
    toAddressLatLng = marker.getPosition();
    document.getElementById("order_geolocation").value = lat + ", " + lng;
    calcRoute();
}
