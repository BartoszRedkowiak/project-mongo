<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    function initMap(){
        // Map options
        var options = {
            zoom: 12,
            center: {lat: 52.237, lng: 21.017} //Warsaw
        };

        // New map
        var map = new google.maps.Map(document.getElementById('map'), options);

        // Array of markers from database
        var markers = [
            <c:forEach items="${markers}" var="marker" varStatus="index">
            {
                position: {lat: ${marker.lat}, lng:${marker.lng}},
                content: '<h5>${marker.name}</h5>'+
                    '<br>id: ${marker.id}'+
                    '<br>lat: ${marker.lat}'+
                    '<br>lng: ${marker.lng}'+
                    '<br><button class="editBtn">Edytuj</button>'+
                    '<br><button class="deleteBtn" data:id="${marker.id}">Usuń</button>'
            },
            </c:forEach>
        ];

        $('.deleteBtn').on('click', function (t) {
            var id = this.data('id');
            location.href = "localhost:8080/spots/delete/{"+ id+ "}";
        });

        // Place markers from database on the map
        for(var i = 0;i < markers.length;i++){
            addMarker(markers[i]);
        }

        // Listen for click on map - set newMarker position
        google.maps.event.addListener(map, 'click', function (event) {
            // put position inside form
            $('#formLat').val(event.latLng.lat());
            $('#formLng').val(event.latLng.lng());
            //update location of newMarker
            newMarker.setPosition(event.latLng);
        });

        //on-click marker object with info window
        var newMarker = new google.maps.Marker({
            position: null,
            map:map,
            content: '<h5>Dodaj nowy spocik</h5>'+
                '<br><button id="newBtn">Dodaj</button>'
        });
        newMarker.setDraggable(true);
        if(newMarker.content){
            var newInfoWindow = new google.maps.InfoWindow({
                content:newMarker.content
            });

            newMarker.addListener('click', function(){
                newInfoWindow.open(map, newMarker);
            });
        }

        // Add New Marker Function
        function setNewMarker(props){
            newMarker.setPosition(props);
        }

        // Add Marker Function
        function addMarker(props){
            var marker = new google.maps.Marker({
                position:props.position,
                map:map,
                icon:props.iconImage
            });

            // Check for customicon
            if(props.iconImage){
                // Set icon image
                marker.setIcon(props.iconImage);
            }

            // Check content
            if(props.content){
                var infoWindow = new google.maps.InfoWindow({
                    content:props.content
                });

                marker.addListener('click', function(){
                    infoWindow.open(map, marker);
                });
            }
        }
    }

</script>


<div id="map">
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAVcoNM2MuCYiuF08TgYY-D8kQhD08MA8&callback=initMap">
</script>
</div>