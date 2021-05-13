<#import "parts/commons.ftlh" as c>
<#import "parts/pager.ftlh" as p>
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
        <div class="form">
            <div class="row mt-20"><p class="fs-2">Список заявок на регистрацию водителей</p></div>

            <#if page.content?has_content>
                <table class="table">
                    <thead class="table-dark">
                    <tr>
                        <th>ФИО</th>
                        <th>Номер водительского</th>
                        <th>Дата заключения</th>
                        <th>Действует по</th>
                        <th>Без стажа</th>
                        <th>Стаж от 1 до 3</th>
                        <th>Стаж больше 3</th>
                        <th>Статус</th>
                        <th>Изменить</th>
                        <th>Замечания для исправлений</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <#list page.content as driver>
                        <td>${driver.fullName}</td>
                        <td>${driver.driverLicenseNumber}</td>
                        <td>${driver.dateOfConclusion}</td>
                        <td>${driver.lengthOfAContract}</td>
                        <#if driver.noExperience>
                            <td>Да</td>
                        <#else>
                            <td>Нет</td>
                        </#if>
                        <#if driver.experienceFromOneToThree>
                            <td>Да</td>
                        <#else>
                            <td>Нет</td>
                        </#if>
                        <#if driver.experienceMoreThanThree>
                            <td>Да</td>
                        <#else>
                            <td>Нет</td>
                        </#if>

                        <#if driver.confirmed>
                            <td>Подтверждено</td>
                        <#else>
                            <td>Не подтверждено</td>
                        </#if>
                        <#if driver.confirmed>
                            <td>Заявка уже одобрена</td>
                        <#else>
                            <td><a href="/driver/${driver.id}">Изменить заявку</a></td>
                        </#if>
                        <td>${driver.remark!}</td>
                    </tr>
                    </#list>
                    </tbody>
                    <div>
                        <@p.pager page />
                    </div>
                </table>
            <#else>
                Заявок на регистрацию нет.
            </#if>
        </div>
    </@c.page>
</div>