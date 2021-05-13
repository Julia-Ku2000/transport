<#import "parts/commons.ftlh" as c>
<#import "parts/pager.ftlh" as p>
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
        <div class="form">
            <div class="row mt-20"><p class="fs-2">Список заявок на регистрацию маршрута</p></div>
            <#if page.content?has_content>
                <table class="table">
                    <thead class="table-dark">
                    <tr>
                        <th>Дата установки маршрута</th>
                        <th>Дата последних изменений</th>
                        <th>Тип транспорта</th>
                        <th>Количество остановок</th>
                        <th>Начальная точка</th>
                        <th>Направление поездки</th>
                        <th>Конечная точка</th>
                        <th>Статус</th>
                        <th>Действия</th>
                        <th>Замечания для исправлений</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <#list page.content as route>
                        <td>${route.dateOfSetupRoute}</td>
                        <td>${route.lastChangeDate}</td>
                        <td>${route.typeOfTransport}</td>
                        <td>${route.numberOfStops}</td>
                        <td>${route.startPoint}</td>
                        <td>${route.direction}</td>
                        <td>${route.endPoint}</td>
                        <#if route.confirmed>
                            <td>Подтверждено</td>
                        <#else>
                            <td>Не подтверждено</td>
                        </#if>
                        <#if route.confirmed>
                            <td>Заявка уже одобрена</td>
                        <#else>
                            <td><a href="/route/${route.id}">Изменить заявку</a></td>
                        </#if>
                        <td>${route.remark!}</td>
                    </tr>
                    </#list>
                    </tbody>
                    <div>
                        <@p.pager page />
                    </div>
                </table>
            <#else>
                Заявок на регистрацию маршрута нет.
            </#if>
        </div>
    </@c.page>
</div>
