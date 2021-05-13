<#import "parts/commons.ftlh" as c>
<div class="body">
    <style type="text/css">
        <#include "css/style.css">
    </style>
<@c.page>
    <div class="list-group" style="margin-top: 15px">
        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
            Выберите форму
        </a>
        <a href="/route" class="list-group-item list-group-item-action">Заявки регистрации маршрута</a>
        <a href="/transportRegistrationForm" class="list-group-item list-group-item-action">Заявки регистрации транспорта</a>
        <a href="/driver" class="list-group-item list-group-item-action">Заявки регистрации водителей</a>
    </div>
</@c.page>
</div>