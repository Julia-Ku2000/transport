<#import "parts/commons.ftlh" as c>
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
        <div class="form">
            Список пользователей
            <#if users?has_content>
                <table class="table">
                    <thead class="table-dark">
                    <tr>
                        <th>Имя</th>
                        <th>Фамилия</th>
                        <th>Роль</th>
                        <th>Действия</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <#list users as user>
                        <td>${user.username}</td>
                        <td>${user.surname}</td>
                        <td><#list user.roles as role>${role.roleName}<#sep>, </#list></td>
                        <td><a href="/user/${user.id}">Изменить роль</a></td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            <#else>
                Пользователей нет
            </#if>
        </div>
    </@c.page>
</div>