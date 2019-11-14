function initMap() {
    // New map
    var map = new google.maps.Map(document.getElementById('mapHome'), options);

    //Add bike lane layer
    // var bikeLayer = new google.maps.BicyclingLayer();
    // bikeLayer.setMap(map);


    // Place markers from database on the map
    for (var i = 0; i < markers.length; i++) {
        addMarker(markers[i]);
    }

    // Add Marker Function
    function addMarker(props) {
        var marker = new google.maps.Marker({
            position: props.position,
            map: map,
            icon: props.iconImage
        });

        // Check for customicon
        if (props.iconImage) {
            // Set icon image
            marker.setIcon(props.iconImage);
        }

        // Check content
        if (props.content) {
            var infoWindow = new google.maps.InfoWindow({
                content: props.content
            });

            marker.addListener('click', function () {
                infoWindow.open(map, marker);
            });
        }
    }
}