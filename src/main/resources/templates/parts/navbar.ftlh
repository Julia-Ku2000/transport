<#include "security.ftlh">
<#import "login.ftlh" as l>
<nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd; color: white;">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Обзественный транспорт</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <#if user?? && name!='unknown'>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/main">Кабинет</a>
                </li>
                </#if>
                <#if user?? && name!='unknown'>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/forms">Cписок заявок</a>
                    </li>
                </#if>
                <#if user?? && name!='unknown'>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/user/profile">Профиль</a>
                    </li>
                </#if>
                <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/user">Пользователи</a>
                </li>
                </#if>
                <#if isAdmin>
                <li class="nav-item dropdown">
                    <a class="nav-link active dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Список активных заявок</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/transportRegistrationForm/unconfirmed">Список заявок на регистрацию транспорта</a></li>
                        <li><a class="dropdown-item" href="/route/unconfirmed">Список заявок на маршрут</a></li>
                        <li><a class="dropdown-item" href="/driver/unconfirmed">Список заявок на регистрацию водителей</a></li>
                    </ul>
                </li>
                </#if>
            </ul>
            <#if user?? && name!='unknown'>
            <div class="navbar-text" style="margin-right: 30px; margin-bottom: auto; color: rgb(54, 121, 253)">${name}</div>
            <@l.logout/>
            </#if>
        </div>
    </div>
</nav>