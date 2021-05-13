<#import "parts/commons.ftlh" as c>
<#import "parts/ui.ftlh" as ui>
<style type="text/css">
    <#include "css/style.css">
</style>
    <div class="body">
<@c.page>
    <div class="left">
        <div class="user">Допро пожаловать!</div>
        <div class="about">${users.getUsername()}</div>
        <div class="about">${users.getPatronymic()}</div>
    </div>
    <div class="dropdown" style="margin-left: -280px; margin-top: 20px">
        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton2"
                data-bs-toggle="dropdown" aria-expanded="false">
            Открыть меню
        </button>
        <ul class="dropdown-menu dropdown-menu-white" aria-labelledby="dropdownMenuButton2">
            <li><a class="dropdown-item active" href="#">Выберети форму</a></li>
            <li><a class="dropdown-item" href="/route/addRoute">Регистрация маршрута</a></li>
            <li><a class="dropdown-item" href="/transportRegistrationForm/addTransportRegistrationForm">Регистрация транспорта</a></li>
            <li><a class="dropdown-item" href="/driver/addDriver">Регистрация водителя</a></li>
        </ul>
    </div>
    </div>
</@c.page>