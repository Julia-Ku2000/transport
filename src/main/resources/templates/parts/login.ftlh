<#macro login path>
    <form action="${path}" method="post">
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label"> Электронная почта :</label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control"/>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label"> Пароль :</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Войти</button>
    </form>
    <#if RequestParameters.error??>
        <div class="alert alert-danger" align="center">
            <strong>Ошибка!</strong><br>Неверный email или пароль
        </div>
    </#if>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Выйти</button>
    </form>
</#macro>