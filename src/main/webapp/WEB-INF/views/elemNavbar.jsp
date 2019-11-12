<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
    <a class="navbar-brand js-scroll-trigger" href="/">MonGo</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
            aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
                <a class="nav-link" href="/markers/add">Dodaj spocik</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Filtruj
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <div class="mt-1 mx-2">
                        <form method="get" action="/">
                            <label for="distanceSlider">Odległość: </label><span id="sliderValue"></span><br>
                            <input type="range" min="1" max="20" value="10" name="maxDistance"
                                   class="form-control-range"
                                   id="distanceSlider">
                            <label>Rodzaj spotu</label><br>
                            <c:forEach items="${categories}" var="category">
                                <input type="checkbox" name="categoryId" value="${category.id}"/>${category.name}<br>
                            </c:forEach>
                            <input type="submit" value="Filtruj">
                        </form>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Eventy</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Admin
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/markers/list">Lista markerów</a>
                    <a class="dropdown-item" href="/users/list">Lista użytkowników</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Profil</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Logowanie</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/users/register">Rejestracja</a>
            </li>

        </ul>
    </div>
</nav>