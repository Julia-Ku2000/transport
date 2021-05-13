<#import "parts/commons.ftlh" as c>
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
        <div class="form">
            <form action="/route/addRoute" method="post"
                  style="margin-top: 20px; margin-left: 20px">
                <p class="fs-2">Заполните данные для регистрации маршрута</p>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Дата установки маршрута :</label>
                    <div class="col-sm-6">
                        <input type="date" name="dateOfSetupRoute"
                               class="form-control ${(dateOfSetupRoute??)?string('is-invalid', '')}"
                               value="<#if route??>${route.dateOfSetupRoute!"null or missing"}</#if>"
                               placeholder="Дата заключения"/>
                        <#if dateOfSetupRoute??>
                            <div class="invalid-feedback">
                                ${dateOfSetupRoute}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"> Дата последних изменений :</label>
                    <div class="col-sm-6">
                        <input type="date" name="lastChangeDate"
                               class="form-control ${(lastChangeDate??)?string('is-invalid', '')}"
                               value="<#if route??>${route.lastChangeDate!"null or missing"}</#if>"
                               placeholder="Действует по"/>
                        <#if lastChangeDate??>
                            <div class="invalid-feedback">
                                ${lastChangeDate}
                            </div>
                        </#if>
                    </div>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupSelect01">Тип транспорта</label>
                    </div>
                    <select class="custom-select" name="typeOfTransport" id="inputGroupSelect01">
                        <option value="Автобус">
                            Автобус
                        </option>
                        <option value="Троллейбус">
                            Троллейбус
                        </option>
                        <option value="Трамвай">
                            Трамвай
                        </option>
                    </select>
                </div>


                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text " for="inputGroupSelect01">Количество остановок</label>
                    </div>
                    <select class="custom-select ${(numberOfStops??)?string('is-invalid', '')}" name="numberOfStops"
                            id="inputGroupSelect01">
                        <option value="10">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                        <option value="25">25</option>
                    </select>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupSelect01">Начальная точка</label>
                    </div>
                    <select class="custom-select" name="startPoint" id="inputGroupSelect01">
                        <option value="Бельского">
                            Бельского
                        </option>
                        <option value="Рафиева">
                            Рафиева
                        </option>
                        <option value="Громова">
                            Громова
                        </option>
                        <option value="Мельникайте">
                            Мельникайте
                        </option>
                        <option value="Бобруйская">
                            Бобруйская
                        </option>
                    </select>
                </div>



                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupSelect01">Направление поездки</label>
                    </div>
                    <select class="custom-select" name="direction" id="inputGroupSelect01">
                        <option value="Фрунзенское">
                            Фрунзенское
                        </option>
                        <option value="Советское">
                                Советское
                        </option>
                        <option value="Центральное">
                            Центральное
                        </option>
                        <option value="Заводское">
                            Заводское
                        </option>
                        <option value="Первомйское">
                            Первомйское
                        </option>
                        <option value="Московское">
                            Московское
                        </option>
                    </select>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupSelect01">Конечная точка</label>
                    </div>
                    <select class="custom-select" name="endPoint" id="inputGroupSelect01">
                        <option value="Бельского">
                            Бельского
                        </option>
                        <option value="Рафиева">
                            Рафиева
                        </option>
                        <option value="Громова">
                            Громова
                        </option>
                        <option value="Мельникайте">
                            Мельникайте
                        </option>
                        <option value="Бобруйская">
                            Бобруйская
                        </option>
                    </select>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-primary">Добавить маршрут</button>
            </form>
        </div>
    </@c.page>
</div>