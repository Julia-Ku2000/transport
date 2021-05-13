<#import "parts/commons.ftlh" as c>
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
        <div class="form">
            <form method="post" style="margin-top: 20px; margin-left: 20px">
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Имя:</label>
                    <div class="col-sm-6">
                        <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                               class="form-control ${(usernameError??)?string('is-invalid', '')}"
                               placeholder="Имя"/>
                        <#if usernameError??>
                            <div class="invalid-feedback">
                                ${usernameError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Фамилия:</label>
                    <div class="col-sm-6">
                        <input type="text" name="surname" value="<#if user??>${user.surname}</#if>"
                               class="form-control ${(surnameError??)?string('is-invalid', '')}"
                               placeholder="Фамилия"/>
                        <#if surnameError??>
                            <div class="invalid-feedback">
                                ${surnameError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Отчество:</label>
                    <div class="col-sm-6">
                        <input type="text" name="patronymic" value="<#if user??>${user.patronymic}</#if>"
                               class="form-control ${(patronymicError??)?string('is-invalid', '')}"
                               placeholder="Отчество"/>
                        <#if patronymicError??>
                            <div class="invalid-feedback">
                                ${patronymicError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Пароль:</label>
                    <div class="col-sm-6">
                        <input type="password" name="password"
                               class="form-control ${(passwordError??)?string('is-invalid', '')}"
                               placeholder="Пароль"/>
                        <#if passwordError??>
                            <div class="invalid-feedback">
                                ${passwordError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Дата рождения:</label>
                    <div class="col-sm-6">
                        <input type="date" name="dateOfBirth"
                               class="form-control ${(dateOfBirthError??)?string('is-invalid', '')}"
                               value="<#if user??>${user.dateOfBirth!"null or missing"}</#if>"
                               placeholder="Дата рождения"/>
                        <#if dateOfBirthError??>
                            <div class="invalid-feedback">
                                ${dateOfBirthError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Серия и номер паспорта:</label>
                    <div class="col-sm-6">
                        <input type="text" name="passportSeriesNumber"
                               value="<#if user??>${user.passportSeriesNumber}</#if>"
                               class="form-control ${(passportSeriesNumberError??)?string('is-invalid', '')}"
                               placeholder="Серия и номер паспорта"/>
                        <#if passportSeriesNumberError??>
                            <div class="invalid-feedback">
                                ${passportSeriesNumberError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Адрес прописки:</label>
                    <div class="col-sm-6">
                        <input type="text" name="registrationAddress"
                               value="<#if user??>${user.registrationAddress}</#if>"
                               class="form-control ${(registrationAddressError??)?string('is-invalid', '')}"
                               placeholder="Адрес прописки"/>
                        <#if registrationAddressError??>
                            <div class="invalid-feedback">
                                ${registrationAddressError}
                            </div>
                        </#if>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-primary">Сохранить</button>
            </form>
        </div>
    </@c.page>
</div>