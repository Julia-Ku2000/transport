<#import "parts/commons.ftlh" as c>
<#import "parts/pager.ftlh" as p>
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
        <div class="form">
            <div class="row mt-20"><p style="margin-left: 450px" class="fs-2">Список заявок на регистрацию транспорта</p></div>

            <#if page.content?has_content>
                <table class="table">
                    <thead class="table-dark">
                    <tr>
                        <th>Дата заключения</th>
                        <th>Действует по</th>
                        <th>Марка автомобиля</th>
                        <th>Номер автомобиля</th>
                        <th>Номер кузова</th>
                        <th>Статус</th>
                        <th>Действия</th>
                        <th>Замечания для исправлений</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <#list page.content as auto>
                        <td>${auto.dateOfConclusion}</td>
                        <td>${auto.lengthOfAContract}</td>
                        <td>${auto.carLicensePlate}</td>
                        <td>${auto.сarBrand}</td>
                        <td>${auto.winNumber}</td>
                        <#if auto.confirmed>
                            <td>Подтверждено</td>
                        <#else>
                            <td>Не подтверждено</td>
                        </#if>
                        <#if auto.confirmed>
                            <td>Заявка уже одобрена</td>
                        <#else>
                            <td><a href="/transportRegistrationForm/${auto.id}">Изменить заявку</a></td>
                        </#if>
                        <td>${auto.remark!}</td>
                    </tr>
                    </#list>
                    </tbody>
                    <div>
                        <@p.pager page />
                    </div>
                </table>
            <#else>
                Заявок на регистрацию транспорта нет.
            </#if>
        </div>
    </@c.page>
</div>