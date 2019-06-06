<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/user/header_user.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Редактирование данных пользователя ${editUser.login}</h2>
                <p class="info">${info}</p>
                <a class="button btn btn-outline-success"  href="userinfo?useri=${editUser.id}"><i class="fas fa-backward"></i>Назад</a>

            </div>
            <form action="editu?euId=${editUser.id}" method="POST">
                <div class="form-group"><input hidden name="${editUser.id}" value="${editUser.id}"><label for="user-name">Имя</label><input class="form-control item" type="text" maxlength="25" name="name" id="user-name" value="${editUser.name}" required="" autofocus></div>
                <div class="form-group"><label for="user-surname">Фамилия</label><input class="form-control item" type="text" maxlength="25" name="surname" id="user-surname" value="${editUser.surname}" required=""></div>
                <div class="form-group"><label for="user-phone">Телефон</label><input class="form-control item" type="tel" onkeypress='validate(event)' maxlength="11" name="phone" id="user-phone" value="${editUser.phone}" required=""></div>
                <div class="form-group"><label for="user-email">Е-майл</label><input class="form-control item" type="text" maxlength="25" name="email"  value="${editUser.email}" required=""></div>
                <div class="form-group"><label for="user-email">Новый пароль (или старый пароль, если не хотите менять)</label><input class="form-control item" type="password" maxlength="25" name="password01" id="user-surname" required=""></div>

                <button class="btn btn-primary btn-block" type="submit">Обновить запись</button></form>
        </div>
    </section>

    <jsp:include page="/footer.jsp" />
