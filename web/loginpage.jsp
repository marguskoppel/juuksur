<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/header.jsp" />
<main class="page login-page">
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Вход</h2>
                <p>Войдите под своей учетной записью или <a href="registration">зарегистрируйтесь</a></p>
                <p><b><i>${info} ${info2}</i></b></p>
                    </div>

                
            </div>
            <form action="login" method="POST">
                <div class="form-group"><label for="user-login">Логин</label><input class="form-control item" type="text" maxlength="25" name="login" id="user-login" value="${login}" required="required" autofocus=""/></div>
                <div class="form-group"><label for="user-password">Пароль</label><input class="form-control" type="password" minlength="6" maxlength="15" name="password" id="user-password" required="required" /></div>
                <div class="form-group">
                </div>
                <button class="btn btn-primary btn-block" type="submit">Войти</button></form>
        </div>
    </section>
    <jsp:include page="/footer.jsp" />
