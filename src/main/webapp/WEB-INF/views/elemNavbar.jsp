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
                <li class="nav-item">
                    <a class="nav-link" href="#">Filtruj</a>
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