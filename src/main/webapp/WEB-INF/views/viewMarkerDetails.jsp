<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>
</head>
<body>
<jsp:include page="elemNavbar.jsp"/>

<script>

    function initMap() {
        // var map = new google.maps.Map(document.getElementById('map'), options);

        var streetViewOptions = {
            position: {lat: ${marker.lat}, lng: ${marker.lng}},
            visible: true,
            clickToGo: false
        };

        function addMarker() {
            var marker = new google.maps.Marker({
                position: ${marker.lat}, lng: ${marker.lng},
                map: view
            });
        }

        var view = new google.maps.StreetViewPanorama(map, streetViewOptions);

        addMarker();
    }


</script>
<div class="container-fluid" id="map">
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAVcoNM2MuCYiuF08TgYY-D8kQhD08MA8&callback=initMap">
    </script>
</div>

<div class="container-fluid">
    <div class="card mt-2">
        <table class="table">
            <tr>
                <th scope="row">Nazwa</th>
                <td>${marker.name}</td>
            </tr>
            <tr>
                <th scope="row">Data dodania</th>
                <td>${marker.createdOn}</td>
            </tr>
            <tr>
                <th scope="row">Średnia ocena</th>
                <td><fmt:formatNumber type="number" maxFractionDigits="2" value="${rating}"/></td>
            </tr>
            <tr>
                <th scope="row">Opis</th>
                <td>${empty marker.description ? "Brak opisu" : marker.description}</td>
            </tr>
            <tr>
                <th scope="row">Kategorie</th>
                <td>
                    <c:forEach items="${marker.categories}" var="category">
                        <span>${category.name}</span><br>
                    </c:forEach>
                </td>
            </tr>
        </table>
    </div>

    <div class="card mt-2">
        <h3 class="card-header">Dodaj opinię</h3>
        <div class="card-body">
            <div class="mx-1">
                <form:form method="post" modelAttribute="newReview">
                    <input name="markerId" value="${marker.id}" hidden>
                    <div class="row">
                        <div class="form-group col-md-2">
                            <label for="ratingId">Ocena spotu</label>
                            <form:select path="rating" cssClass="form-control" id="ratingId">
                                <c:forEach begin="1" end="5" var="number">
                                    <form:option value="${number}"/>
                                </c:forEach>
                            </form:select>
                            <form:errors path="rating" element="small" cssStyle="color:red"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="commentId">Komentarz</label>
                            <form:textarea path="comment" rows="4" cssClass="form-control" id="commentId"/>
                            <form:errors path="comment" element="small" cssStyle="color:red"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-2">
                            <input type="submit" class="btn btn-dark" value="Zapisz"/>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <div class="mt-2">
        <h3>Opinie użytkowników</h3>

        <c:if test="${empty marker.reviews}">
            <div class="card mt-3 mb-3">
                <div class="card-body">
                    Brak opinii
                </div>
            </div>
        </c:if>


        <c:forEach items="${marker.reviews}" var="review">
            <div class="card mt-1">
                <div class="card-body">
                    <table>
                        <tr>
                            <small class="form-text text-muted">Data: ${review.created}</small>
                            <p>${review.user.firstName} ${review.user.lastName} ocenił na ${review.rating}</p>
                        </tr>
                        <tr>
                            <p>Komentarz: ${review.comment}</p>
                        </tr>
                    </table>
                </div>
            </div>

        </c:forEach>
    </div>

</div>

</body>
</html>
