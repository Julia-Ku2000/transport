<#import "parts/commons.ftlh" as c>
<#import "parts/login.ftlh" as l>
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>

        <div class="form">
            <div style="margin-left: 20px">
                <p class="fs-3">Страница входа</p>
                <@l.login "/login" />
                <div style="margin-top: 20px">
                    <a href="/registration">Зарегестрироваться</a>
                </div>
            </div>
        </div>

    </@c.page>
</div>