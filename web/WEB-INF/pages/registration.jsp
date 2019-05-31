<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/header.jsp" />

<main class="page registration-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Регистрация</h2>
                <p>Зарегистрируйтесь у нас на сайте или <a href="loginpage">войдите</a> под существующей учетной записью <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Регистрация" data-html="true" data-content="Пожалуйста заполните все поля для регистрации."><i class="far fa-question-circle"></i></a></p>
                <p><b><i>${info} ${info2}</i></b></p>
                
            </div>
            <form action="register" method="POST">
                <div class="form-group"><label for="user-name">Имя</label><input class="form-control item" type="text" maxlength="25" name="name" id="user-name" value="${name}" required="" autofocus></div>
                <div class="form-group"><label for="user-surname">Фамилия</label><input class="form-control item" type="text" maxlength="25" name="surname" id="user-surname" value="${surname}" required=""></div>
                <div class="form-group"><label for="user-surname">Е-майл</label><input class="form-control item" type="email" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" name="email" id="user-surname" value="${email}" required=""></div>
                <div class="form-group"><label for="user-phone">Телефон</label><input class="form-control item" type="tel" pattern="(\+?\d[- .]*){7,13}" title="Международный, государственный или местный телефонный номер" name="phone" id="user-phone" value="${phone}" required=""></div>
                <div class="form-group"><label for="user-login">Логин</label><input class="form-control item" type="text" maxlength="25" name="login" id="user-login" value="${login}" required=""></div>
                <div class="form-group"><label for="user-password1">Пароль</label><input class="form-control item" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  title="Не менее восьми символов, содержащих хотя бы одну цифру и символы из верхнего и нижнего регистра" minlength="8"  name="password1" id="user-password1" required=""></div>
                <div class="form-group"><label for="user-password2">Повторите пароль</label><input class="form-control item" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  title="Не менее восьми символов, содержащих хотя бы одну цифру и символы из верхнего и нижнего регистра" minlength="8" name="password2" id="user-password2" required=""></div>
                <button class="btn btn-primary btn-block" type="submit">Зарегистрироваться</button></form>
        </div>
    </section>
    <jsp:include page="/footer.jsp" />
    