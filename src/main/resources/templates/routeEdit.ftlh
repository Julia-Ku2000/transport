<#import "parts/commons.ftlh" as c>
<#include "parts/security.ftlh">
<style type="text/css">
    <#include "css/style.css">
</style>
<div class="body">
    <@c.page>
    <div class="editBody">
        <div class="editForm">
            <#if route.user.id = id && !route.confirmed || isAdmin>
                Редактор договора.
                <form action="/route/saveRoute" method="post">
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
                            <option selected="selected">${route.typeOfTransport}</option>
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
                        <select class="custom-select" name="numberOfStops" id="inputGroupSelect01">
                            <option selected="selected">${route.numberOfStops}</option>
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
                            <option selected="selected">${route.startPoint}</option>
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
                            <option selected="selected">${route.direction}</option>
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
                            <option selected="selected">${route.endPoint}</option>
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
                    <#if isAdmin>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Замечания для исправлений</label>
                            <textarea class="form-control ${(remarkError??)?string('is-invalid', '')}" name="remark"
                                      id="exampleFormControlTextarea1" rows="3"
                                      placeholder="Для внесения замечаний"
                            ><#if route??>${route.remark!}</#if></textarea>
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
                                   name="confirmed" <#if route.confirmed>checked</#if>>
                            <label class="form-check-label" for="flexSwitchCheckChecked">Договор подтвержден</label>
                        </div>
                    <#else>
                    </#if>
                    <input type="hidden" value="${route.id}" name="routeId">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn btn-primary">Сохранить</button>
                </form>
                <form action="/route/route/${route.id}" method="post">
                    <input id="delButton" class="btn btn-danger" type="submit" value="Удалить">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
            <#else>
                <script>
                    window.location.replace("http://localhost:8080/404");
                </script>
            </#if>
        </div>
        </@c.page>
        <#if isAdmin>
            <div class="userInfoTravel">
                <ul class="list-group">
                    <li class="list-group-item">Имя: ${route.user.username}</li>
                    <li class="list-group-item">Фамилия: ${route.user.surname}</li>
                    <li class="list-group-item">Отчество: ${route.user.patronymic}</li>
                    <li class="list-group-item">Номер
                        паспорта: ${route.user.passportSeriesNumber}</li>
                    <li class="list-group-item">Адрес
                        прописки: ${route.user.registrationAddress}</li>
                    <li class="list-group-item">Дата рождения: ${route.user.dateOfBirth}</li>
                </ul>
            </div>
        <#else>
        </#if>
    </div>
</div>