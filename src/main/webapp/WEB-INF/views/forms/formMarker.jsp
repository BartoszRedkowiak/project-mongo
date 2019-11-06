<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
    function initMap() {
        // Map options
        var options = {
            zoom: 17,
            center: {lat: ${marker.lat == 0? 52.237 : marker.lat}, lng: ${marker.lng == 0 ? 21.017 : marker.lat}}
        };
        // New map
        var map = new google.maps.Map(document.getElementById('map'), options);
        // Gather position to input fields with map movement
        google.maps.event.addListener(map, 'center_changed', function () {
            document.getElementById('default_latitude').value = map.getCenter().lat();
            document.getElementById('default_longitude').value = map.getCenter().lng();
        });
        $('<div/>').addClass('centerMarker').appendTo(map.getDiv());
    }
</script>

<div id="map">
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAVcoNM2MuCYiuF08TgYY-D8kQhD08MA8&callback=initMap">
    </script>
</div>

<div>
    <form:form method="post" modelAttribute="marker">
        <label> Latitude:
            <form:input path="lat" id="default_latitude"/>
        </label>
        <label>Longitude:
            <form:input path="lng" id="default_longitude"/>
        </label>
        <label>Name:
            <form:input path="name"/>
        </label>
        <label>Description:
            <form:input path="description"/>
        </label>

        <label>Category:
            <form:select path="categories">
            <form:options items="${categories}" itemLabel="name" itemValue="id"/>
            </form:select>
        </label>


        <input type="submit" value="Zapisz">
    </form:form>
</div>
