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
    <header>Lista kontrybucji(trików)</header>
    <div class="card mt-2">
        <table class="table-sm table-responsive-sm">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Data dodania</th>
                <th scope="col">Nazwa</th>
                <th scope="col">Użytkownik</th>
                <th scope="col">Marker Id</th>
                <th scope="col">Zweryfikowano</th>
                <th scope="col">Akcje</th>
            </tr>
            </thead>
            <tbody class="table-hover">
            <c:forEach items="${contributions}" var="contribution" varStatus="index">
                <tr class="initEntry">
                    <td scope="row">${contribution.id}</td>
                    <td>${contribution.created}</td>
                    <td>${contribution.name}</td>
                    <td>${contribution.user.email}</td>
                    <td>${contribution.marker.id}</td>
                    <td>${contribution.validated == true? 'TAK' : 'NIE'}</td>
                    <td>
                        <div class="row">
                            <a class="btn btn-dark btn-sm mx-1" href="/markers/visibilityTog/${marker.id}">Visibility tog</a> <br>
                            <a class="btn btn-dark btn-sm mx-1" href="/markers/eventTog/${marker.id}">Event tog</a> <br>
                            <a class="btn btn-warning btn-sm mx-1" href="/markers/edit/${marker.id}">Edytuj</a> <br>
                            <a class="btn btn-danger btn-sm mx-1" onclick="confirmDelete(${marker.id}, '/markers/delete/')">Usuń</a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <div>
                        <blockquote class="instagram-media"
                                    data-instgrm-captioned
                                    data-instgrm-permalink="${contribution.igLink}?utm_source=ig_embed&amp;utm_campaign=loading"
                                    data-instgrm-version="12"
                                    style=" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:540px; min-width:326px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);">
                        </blockquote>
                        <script async src="//www.instagram.com/embed.js"></script>
                    </div>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
