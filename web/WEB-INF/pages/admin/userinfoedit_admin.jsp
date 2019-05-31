<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Редактирование данных пользователя</h2>
                <p class="info">${info}</p>
                <a class="button btn btn-outline-success"  href="userinfo?useri=${regUser.id}"><i class="fas fa-backward"></i>Назад</a>

            </div>
            <form action="editu?euId=${regUser.id}" method="POST">
                <div class="form-group"><input hidden name="${regUser.id}" value="${regUser.id}"><label for="user-name">Имя</label><input class="form-control item" type="text" maxlength="25" name="name" id="user-name" value="${regUser.name}" required="" autofocus></div>
                <div class="form-group"><label for="user-surname">Фамилия</label><input class="form-control item" type="text" maxlength="25" name="surname" id="user-surname" value="${regUser.surname}" required=""></div>
                <div class="form-group"><label for="user-phone">Телефон</label><input class="form-control item" type="tel" pattern="(\+?\d[- .]*){7,13}" title="Международный, государственный или местный телефонный номер" name="phone" id="user-phone" value="${regUser.phone}" required=""></div>
                <div class="form-group"><label for="user-email">Е-майл</label><input class="form-control item" type="email" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" maxlength="25" name="email"  value="${regUser.email}" required=""></div>
                <div class="form-group"><label for="user-email">Новый пароль (или старый пароль, если не хотите менять)</label><input class="form-control item" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  title="Не менее восьми символов, содержащих хотя бы одну цифру и символы из верхнего и нижнего регистра" minlength="8" name="password01" id="user-surname" required=""></div>

                <button class="btn btn-primary btn-block" type="submit">Обновить запись</button></form>
        </div>
    </section>

    <jsp:include page="/footer.jsp" />
