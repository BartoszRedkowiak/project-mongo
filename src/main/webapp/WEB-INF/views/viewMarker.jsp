<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>
    <script src="<c:url value="/resources/js/mapMarker.js"/>"></script>
</head>
<body>
<jsp:include page="elemNavbar.jsp"/>

<div class="container-fluid">
    <div class="card mt-2 mb-2">
        <h5 class="card-header">
            ${empty marker.id ? 'Dodaj spot' : 'Edytuj spot'}
        </h5>
        <div class="container-fluid" id="map">
            <script async defer
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAVcoNM2MuCYiuF08TgYY-D8kQhD08MA8&callback=initMap">
            </script>
        </div>

        <div class="card-body">

            <form:form method="post" modelAttribute="marker">
                <form:hidden path="createdOn"/>
                <form:hidden path="lat" id="default_latitude"/>
                <form:hidden path="lng" id="default_longitude"/>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="formName">Nazwa spotu</label>
                        <form:input path="name" cssClass="form-control" id="formName"/>
                        <form:errors path="name" element="small" cssStyle="color:red"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="formCategories">Kategorie</label>
                        <form:select path="categories" items="${categories}" itemLabel="name" itemValue="id"
                                     cssClass="form-control" id="formCategories"/>
                        <form:errors path="categories" element="small" cssStyle="color:red"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="formDescription">Opis</label>
                        <form:textarea path="description" cssClass="form-control" id="formDescription"/>
                        <form:errors path="description" element="small" cssStyle="color:red"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <input class="btn btn-primary" type="submit" value="Zapisz">
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>

</body>
</html>
