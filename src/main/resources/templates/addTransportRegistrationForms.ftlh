<#import "parts/commons.ftlh" as c>
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
       <div class="form">
           <form action="/transportRegistrationForm/addTransportRegistrationForm" method="post" style="margin-top: 20px; margin-left: 20px">
            <p class="fs-2">Заполните данные для оформления транспорта</p>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label"> Дата привоза в атопарк :</label>
                <div class="col-sm-6">
                    <input type="date" name="dateOfConclusion"
                           class="form-control ${(dateOfConclusionError??)?string('is-invalid', '')}"
                           value="<#if transportRegistrationForm??>${transportRegistrationForm.dateOfConclusion!"null or missing"}</#if>"
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
                           value="<#if transportRegistrationForm??>${transportRegistrationForm.сarBrand}</#if>" placeholder="Марка автомобиля"/>
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
                           value="<#if transportRegistrationForm??>${transportRegistrationForm.winNumber}</#if>" placeholder="Номер кузова"/>
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
                           value="<#if transportRegistrationForm??>${transportRegistrationForm.driverLicenseNumber}</#if>"
                           placeholder="Номер водительского"/>
                    <#if driverLicenseNumberError??>
                        <div class="invalid-feedback">
                            ${driverLicenseNumberError}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label"> Дата первой поездки :</label>
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
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-primary">Зарегистрировать привоз транспорта</button>
        </form>
       </div>
    </@c.page>
</div>