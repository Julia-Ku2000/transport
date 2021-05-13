<#import "parts/commons.ftlh" as c>
<#include "parts/security.ftlh">
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
    <div class="editBody">
        <div class="editForm">
            <#if transportRegistrationForm.user.id = id && !transportRegistrationForm.confirmed || isAdmin>
            Редактор договора.
            <form action="/transportRegistrationForm/saveTransportRegistrationForm" method="post">
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Действует по :</label>
                    <div class="col-sm-6">
                        <input type="date" name="dateOfConclusion"
                               class="form-control ${(dateOfConclusionError??)?string('is-invalid', '')}"
                               value="<#if transportRegistrationForm??>${transportRegistrationForm.dateOfConclusion!"null or missing"}</#if>"
                               placeholder="Действует по"/>
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
                               value="<#if transportRegistrationForm??>${transportRegistrationForm.lengthOfAContract!"null or missing"}</#if>"
                               placeholder="Действует по"/>
                        <#if lengthOfAContractError??>
                            <div class="invalid-feedback">
                                ${lengthOfAContractError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Марка автомобиля :</label>
                    <div class="col-sm-6">
                        <input type="text" name="сarBrand"
                               class="form-control ${(сarBrandError??)?string('is-invalid', '')}"
                               value="<#if transportRegistrationForm??>${transportRegistrationForm.сarBrand}</#if>"
                               placeholder="Марка автомобиля"/>
                        <#if сarBrandError??>
                            <div class="invalid-feedback">
                                ${сarBrandError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Номер автомобиля :</label>
                    <div class="col-sm-6">
                        <input type="text" name="carLicensePlate"
                               class="form-control ${(carLicensePlateError??)?string('is-invalid', '')}"
                               value="<#if transportRegistrationForm??>${transportRegistrationForm.carLicensePlate}</#if>"
                               placeholder="Номер автомобиля"/>
                        <#if carLicensePlateError??>
                            <div class="invalid-feedback">
                                ${carLicensePlateError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Номер кузова :</label>
                    <div class="col-sm-6">
                        <input type="text" name="winNumber"
                               class="form-control ${(winNumberError??)?string('is-invalid', '')}"
                               value="<#if transportRegistrationForm??>${transportRegistrationForm.winNumber}</#if>"
                               placeholder="Номер кузова"/>
                        <#if winNumberError??>
                            <div class="invalid-feedback">
                                ${winNumberError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Номер водительского :</label>
                    <div class="col-sm-6">
                        <input type="text" name="driverLicenseNumber"
                               class="form-control ${(driverLicenseNumberError??)?string('is-invalid', '')}"
                               value="<#if transportRegistrationForm??>${transportRegistrationForm.driverLicenseNumber!"null or missing"}</#if>"
                               placeholder="Номер водительского"/>
                        <#if driverLicenseNumberError??>
                            <div class="invalid-feedback">
                                ${driverLicenseNumberError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Дата выдачи водительского :</label>
                    <div class="col-sm-6">
                        <input type="date" name="dateOfFirstTrip"
                               class="form-control ${(dateOfFirstTrip??)?string('is-invalid', '')}"
                               value="<#if transportRegistrationForm??>${transportRegistrationForm.dateOfFirstTrip!"null or missing"}</#if>"
                               placeholder="Дата выдачи водительского"/>
                        <#if dateOfFirstTrip??>
                            <div class="invalid-feedback">
                                ${dateOfFirstTrip}
                            </div>
                        </#if>
                    </div>
                </div>
                <#if isAdmin>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Замечания для исправлений</label>
                        <textarea class="form-control ${(remarkError??)?string('is-invalid', '')}" name="remark"
                                  id="exampleFormControlTextarea1" rows="3"
                                  placeholder="Для внесения замечаний"
                        ><#if transportRegistrationForm??>${transportRegistrationForm.remark!}</#if></textarea>
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
                               name="confirmed" <#if transportRegistrationForm.confirmed>checked</#if>>
                        <label class="form-check-label" for="flexSwitchCheckChecked">Договор подтвержден</label>
                    </div>
                <#else>
                </#if>
                <input type="hidden" value="<#if transportRegistrationForm??>${transportRegistrationForm.id!"null or missing"}</#if>"
                       name="transportRegistrationFormId">
<#--                transportRegistrationFormId-->
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-primary">Сохранить</button>
            </form>
            <form action="/transportRegistrationForm/transportRegistrationForm/${transportRegistrationForm.id}" method="post">
                <input id="delButton" class="btn btn-danger" type="submit" value="Удалить">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            </form>
            <#if isAdmin>
                <div class="userInfo">
                    <ul class="list-group">
                        <li class="list-group-item">Имя: ${transportRegistrationForm.user.username}</li>
                        <li class="list-group-item">Фамилия: ${transportRegistrationForm.user.surname}</li>
                        <li class="list-group-item">Отчество: ${transportRegistrationForm.user.patronymic}</li>
                        <li class="list-group-item">Номер паспорта: ${transportRegistrationForm.user.passportSeriesNumber}</li>
                        <li class="list-group-item">Адрес прописки: ${transportRegistrationForm.user.registrationAddress}</li>
                        <li class="list-group-item">Дата рождения: ${transportRegistrationForm.user.dateOfBirth}</li>
                    </ul>
                </div>
            <#else>
            </#if>
        </div>
        <#else>
            <script>
                window.location.replace("http://localhost:8080/404");
            </script>
        </#if>
        </@c.page>
    </div>
</div>