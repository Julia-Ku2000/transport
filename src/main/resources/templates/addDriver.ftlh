<#import "parts/commons.ftlh" as c>
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
        <div class="form">
    <form action="/driver/addDriver" method="post" style="margin-top: 20px; margin-left: 20px">
        <p class="fs-2">Заполните данные для оформления водителя</p>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label"> ФИО:</label>
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
            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" name="noExperience">
            <label class="form-check-label" for="flexSwitchCheckDefault">Без стажа</label>
        </div>
        <div class="form-check form-switch">
            <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked"
                   name="experienceFromOneToThree">
            <label class="form-check-label" for="flexSwitchCheckChecked">Стаж от 1 до 3 лет</label>
        </div>
        <div class="form-check form-switch">
            <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked"
                   name="experienceMoreThanThree">
            <label class="form-check-label" for="flexSwitchCheckChecked">Стаж болле 3 лет</label>
        </div>
        <#if errorOptions??>
            <div class="alert alert-danger" role="alert">
                ${errorOptions}
            </div>
        </#if>

        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Добавить водителя</button>
    </form>
   </div>
</@c.page>
</div>