<#import "parts/commons.ftlh" as c>
<#import "parts/registration.ftlh" as r>
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
        <div class="form">
            <div style="margin-left: 20px">
                <p class="h1">Регистрация</p>
                <@r.registration "/registration" />
            </div>
        </div>
    </@c.page>
</div>