
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new Spot</title>
    <style>
        body,
        html,
        #map-canvas {
            height: 100%;
            margin: 0;
        }
        #map-canvas .centerMarker {
            position: absolute;
            /*url of the marker*/
            background: url(http://maps.gstatic.com/mapfiles/markers2/marker.png) no-repeat;
            /*center the marker*/
            top: 50%;
            left: 50%;
            z-index: 1;
            /*fix offset when needed*/
            margin-left: -10px;
            margin-top: -34px;
            /*size of the image*/
            height: 34px;
            width: 20px;
            cursor: pointer;
        }


    </style>
</head>
<body>

<script>
    var map = null;
    var marker;

    function showlocation() {
        if ("geolocation" in navigator) {
            /* geolocation is available */
            // One-shot position request.
            navigator.geolocation.getCurrentPosition(callback, error);
        } else {
            /* geolocation IS NOT available */
            console.warn("geolocation IS NOT available");
        }
    }

    function error(err) {
        console.warn('ERROR(' + err.code + '): ' + err.message);
    };

    function callback(position) {

        var lat = position.coords.latitude;
        var lon = position.coords.longitude;
        document.getElementById('default_latitude').value = lat;
        document.getElementById('default_longitude').value = lon;
        var latLong = new google.maps.LatLng(lat, lon);
        map.setZoom(16);
        map.setCenter(latLong);
    }
    google.maps.event.addDomListener(window, 'load', initMap);



    function initMap() {
        var mapOptions = {
            center: new google.maps.LatLng(0, 0),
            zoom: 1,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
        google.maps.event.addListener(map, 'center_changed', function() {
            document.getElementById('default_latitude').value = map.getCenter().lat();
            document.getElementById('default_longitude').value = map.getCenter().lng();
        });
        $('<div/>').addClass('centerMarker').appendTo(map.getDiv())
        //do something onclick
            .click(function() {
                var that = $(this);
                if (!that.data('win')) {
                    that.data('win', new google.maps.InfoWindow({
                        content: 'this is the center'
                    }));
                    that.data('win').bindTo('position', map, 'center');
                }
                that.data('win').open(map);
            });
    }

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
<input type="button" class="btn  pull-right map-btn" value="btn " onclick="javascript:showlocation()" />

<div id="map-canvas" style="height: 300px">

</div>

<input type="text" id="default_latitude" placeholder="Latitude" />
<input type="text" id="default_longitude" placeholder="Longitude" />

</body>
</html>
