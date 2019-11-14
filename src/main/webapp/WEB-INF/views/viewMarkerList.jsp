<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="elemHeadLinks.jsp"/>
    <script>
        $(function () {
            var initEntryRows = $('tr.initEntry');
            var markersEdits = $('.markerEdits');
            // markersEdits.parent().hide();

            initEntryRows.on('click', function () {
                $(this).find('.markerEdits').toggle(300);
            });


        });

    </script>
</head>
<body>

<jsp:include page="elemNavbar.jsp"/>

<div class="container-fluid mt-1 mx-1">
    <div class="card mt-2">
        <h5 class="card-header">Lista markerów</h5>
        <div class="card-body">
            <table class="table table-sm table-hover table-responsive-sm">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Lat</th>
                    <th scope="col">Lng</th>
                    <th scope="col">Nazwa</th>
                    <th scope="col">Opis</th>
                    <th scope="col">Widoczność</th>
                    <th scope="col">Event</th>
                    <th scope="col">Liczba edycji</th>
                    <th scope="col">Akcje</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${markers}" var="marker" varStatus="index">
                    <tr class="initEntry">
                        <td scope="row">${marker.id}</td>
                        <td>${marker.lat}</td>
                        <td>${marker.lng}</td>
                        <td>${marker.name}</td>
                        <td>${marker.description}</td>
                        <td>
                                ${marker.visible == true? 'TAK' : 'NIE'}
                            <a class="btn btn-dark btn-sm mx-1 my-1"
                               href="/markers/visibilityTog/${marker.id}">Toggle</a>
                        </td>
                        <td>
                                ${marker.activeEvent == true? 'TAK' : 'NIE'}
                            <a class="btn btn-dark btn-sm mx-1 my-1" href="/markers/eventTog/${marker.id}">Toggle</a>
                        </td>
                        <td>${fn:length(marker.markerEdits)}</td>
                        <td>
                            <div class="row">
                                <a class="btn btn-warning btn-sm mx-1 my-1" href="/markers/edit/${marker.id}">Edytuj</a>
                                <a class="btn btn-danger btn-sm mx-1 my-1"
                                   onclick="confirmDelete(${marker.id}, '/markers/delete/')">Usuń</a>
                            </div>
                        </td>
                    </tr>
                    <div>
                        <c:forEach items="${marker.markerEdits}" var="edit">
                            <tr class="markerEdits">
                                <td scope="row">${edit.id}</td>
                                <td>${edit.lat}</td>
                                <td>${edit.lng}</td>
                                <td>${edit.name}</td>
                                <td>${edit.description}</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <div class="row">
                                        <a class="btn btn-success btn-sm mx-1"
                                           href="/markers/acceptEdit/${edit.id}">Akceptuj</a><br>
                                        <a class="btn btn-danger btn-sm mx-1" href="#"
                                           onclick="confirmDelete(${edit.id}, '/markers/delete/')">Odrzuć</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </div>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
