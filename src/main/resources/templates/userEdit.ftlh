<#import "parts/commons.ftlh" as c>
<div class="body">
    <@c.page>
        Редактор пользователей.
        <form action="/user" method="post">
            <input class="form-control" type="text" name="username" value="${user.username}">
            <input class="form-control" style="margin-top: 20px" type="text" name="surname" value="${user.surname}">
            <#list roles as role>
                <div class="form-check" style="margin-top: 10px">
                    <label><input class="form-check-input" type="checkbox" style="margin-top: 5px"
                                  name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
                </div>
            </#list>
            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button class="btn btn-success" type="submit">Сохранить</button>
        </form>
    </@c.page>
</div>