var options = {
    zoom: 17,
    center: {lat: 52.237, lng: 21.017}, //Warsaw
    gestureHandling: 'auto',
    styles: styles,
    disableDefaultUI: true
};

function initMap() {
    // New map
    var map = new google.maps.Map(document.getElementById('mapMarker'), options);
    // Gather position to input fields with map movement
    google.maps.event.addListener(map, 'center_changed', function () {
        document.getElementById('default_latitude').value = map.getCenter().lat();
        document.getElementById('default_longitude').value = map.getCenter().lng();
    });
    $('<div/>').addClass('centerMarker').appendTo(map.getDiv());
}