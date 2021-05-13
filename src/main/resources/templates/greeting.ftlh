<#import "parts/commons.ftlh" as c>
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
        <div style="margin-left: -180px; margin-top: 20px">
        <#if user??>
        <#else>
            <div><p class="fs-3">Добро пожаловать</p></div>
            <div><a href="/login">Войти</a></div>
            <div><a href="/registration">Зарегестироваться</a></div>
        </#if>
        </div>
    </@c.page>
</div>