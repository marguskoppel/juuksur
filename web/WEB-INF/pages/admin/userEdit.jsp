<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Редактирование пользователя</h2>
                <p class="info">${info}</p>
                <a class="button btn btn-outline-success"  href="users"><i class="fas fa-backward"></i>Назад</a>
                
            </div>
            <form action="changeUser?user_id=${editUser.id}" method="POST">
                <div class="form-group"><input hidden name="user_id" value="${editUser.id}"><label for="name">Имя</label><input class="form-control item" type="text"  name="name" id="name" value="${editUser.name}" required=""></div>
                <div class="form-group"><label for="serv-price">Фамилия</label><input class="form-control item" type="text"  name="surname" name="surname" id="user-surname" value="${editUser.surname}" required=""></div>
                <div class="form-group"><label for="serv-price">Телефон</label><input class="form-control item" type="tel" pattern="(\+?\d[- .]*){7,13}" title="Международный, государственный или местный телефонный номер" name="phone" name="phone" id="user-surname" value="${editUser.phone}" required=""></div>
                <div class="form-group"><label for="serv-price">Е-майл</label><input class="form-control item" type="email" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" name="email" id="user-surname" value="${editUser.email}" required=""></div>
                    <button class="btn btn-primary btn-block" type="submit">Обновить запись</button></form>
            </div>
        </section>

    <jsp:include page="/footer.jsp" />

