<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <script>
        var markers = [
            <c:forEach items="${markers}" var="marker" varStatus="index">
            {
                position: {lat: ${marker.lat}, lng:${marker.lng}},
                <c:if test="${marker.activeEvent == true}">
                iconImage: '../../resources/icons/eventIcon.png',
                </c:if>
                content: '<h5>${marker.name}</h5>' +
                    '<button class="btn btn-dark btn-sm btn-block mt-1" onclick="markerRedirect(${marker.id}, \'tricks\')" class="detailsBtn">Triczki</button>' +
                    '<button class="btn btn-dark btn-sm btn-block mt-1" onclick="markerRedirect(${marker.id}, \'details\')" class="detailsBtn">Szczegóły</button>' +
                    '<button class="btn btn-dark btn-sm btn-block mt-1" onclick="markerRedirect(${marker.id}, \'edit\')" class="editBtn">Edytuj</button>'
            },
            </c:forEach>
        ];
    </script>
    <jsp:include page="elemHeadLinks.jsp"/>
    <script src="<c:url value="/resources/js/mapHome.js"/>"></script>
</head>
<body>
<div class="mainContainer">
    <jsp:include page="elemNavbar.jsp"/>

    <script>
        function markerRedirect(id, option) {
            window.location.href = '/markers/' + option + '/' + id;
        }
    </script>

    <div class="container-fluid" id="map">
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAVcoNM2MuCYiuF08TgYY-D8kQhD08MA8&callback=initMap">
        </script>
    </div>

</div>
</body>
</html>
