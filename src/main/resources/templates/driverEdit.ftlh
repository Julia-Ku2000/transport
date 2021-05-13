<#import "parts/commons.ftlh" as c>
<#include "parts/security.ftlh">
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
    <div class="editBody">
        <div class="editForm">
            <#if driver.user.id = id && !driver.confirmed || isAdmin>
            Редактор договора водителя.
            <form action="/driver/saveDriver" method="post">
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> ФИО :</label>
                    <div class="col-sm-6">
                        <input type="text" name="fullName" value="<#if driver??>${driver.fullName}</#if>"
                               class="form-control ${(fullName??)?string('is-invalid', '')}"
                               placeholder="ФИО"/>
                        <#if fullName??>
                            <div class="invalid-feedback">
                                ${fullName}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Номер водительского :</label>
                    <div class="col-sm-6">
                        <input type="text" name="driverLicenseNumber"
                               class="form-control ${(driverLicenseNumberError??)?string('is-invalid', '')}"
                               value="<#if driver??>${driver.driverLicenseNumber}</#if>"
                               placeholder="Номер водительского"/>
                        <#if driverLicenseNumberError??>
                            <div class="invalid-feedback">
                                ${driverLicenseNumberError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Дата заключения :</label>
                    <div class="col-sm-6">
                        <input type="date" name="dateOfConclusion"
                               class="form-control ${(dateOfConclusionError??)?string('is-invalid', '')}"
                               value="<#if driver??>${driver.dateOfConclusion!"null or missing"}</#if>"
                               placeholder="Дата заключения"/>
                        <#if dateOfConclusionError??>
                            <div class="invalid-feedback">
                                ${dateOfConclusionError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Действует по :</label>
                    <div class="col-sm-6">
                        <input type="date" name="lengthOfAContract"
                               class="form-control ${(lengthOfAContractError??)?string('is-invalid', '')}"
                               value="<#if driver??>${driver.lengthOfAContract!"null or missing"}</#if>"
                               placeholder="Действует по"/>
                        <#if lengthOfAContractError??>
                            <div class="invalid-feedback">
                                ${lengthOfAContractError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"
                           name="noExperience"
                           <#if driver.noExperience>checked</#if>
                    <label class="form-check-label" for="flexSwitchCheckDefault">Без стажа</label>
                </div>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked"
                           name="experienceFromOneToThree"
                           <#if driver.experienceFromOneToThree>checked</#if>>
                    <label class="form-check-label" for="flexSwitchCheckChecked">Стаж от 1 до 3</label>
                </div>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked"
                           name="experienceMoreThanThree"
                           <#if driver.experienceMoreThanThree>checked</#if>>
                    <label class="form-check-label" for="flexSwitchCheckChecked">Стаж больше 3</label>
                </div>
                <#if errorOptions??>
                    <div class="alert alert-danger" role="alert">
                        ${errorOptions}
                    </div>
                </#if>

                <#if isAdmin>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Замечания для исправлений</label>
                        <textarea class="form-control ${(remarkError??)?string('is-invalid', '')}" name="remark"
                                  id="exampleFormControlTextarea1" rows="3"
                                  placeholder="Для внесения замечаний"
                        ><#if driver??>${driver.remark!}</#if></textarea>
                        <#if remarkError??>
                            <div class="invalid-feedback">
                                ${remarkError}
                            </div>
                        </#if>
                    </div>
                </#if>
                <#if isAdmin>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked"
                               name="confirmed" <#if driver.confirmed>checked</#if>>
                        <label class="form-check-label" for="flexSwitchCheckChecked">Договор подтвержден</label>
                    </div>
                <#else>
                </#if>
                <input type="hidden" value="${driver.id}" name="driverId">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-primary">Сохранить</button>
                <a type="button" href="/driver/driver/${driver.id}"
                   class="btn btn-danger">Удалить</a>
            </form>
            <form action="/driver/driver/${driver.id}" method="post">
                <input id="delButton" class="btn btn-danger" type="submit" value="Удалить">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            </form>
        </div>
        <#else>
            <script>
                window.location.replace("http://localhost:8080/404");
            </script>
        </#if>
        <#if isAdmin>
            <div class="userInfoEstate">
                <ul class="list-group">
                    <li class="list-group-item">Имя: ${driver.user.username}</li>
                    <li class="list-group-item">Фамилия: ${driver.user.surname}</li>
                    <li class="list-group-item">Отчество: ${driver.user.patronymic}</li>
                    <li class="list-group-item">Номер
                        паспорта: ${driver.user.passportSeriesNumber}</li>
                    <li class="list-group-item">Адрес
                        прописки: ${driver.user.registrationAddress}</li>
                    <li class="list-group-item">Дата рождения: ${driver.user.dateOfBirth}</li>
                </ul>
            </div>
        <#else>
        </#if>
        </@c.page>
    </div>
</div>