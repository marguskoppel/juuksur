<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Деактивация пользователя</h2>
                <p class="info">${info}</p>
                <a class="button btn btn-outline-success"  href="roles"><i class="fas fa-backward"></i>Назад</a>
                
            </div>
            <form action="deluser?user_id=${delUser.id}" method="POST">
                <div class="form-group"><input hidden name="user_id" value="${delUser.id}"><label for="name">Имя</label><input class="form-control item" type="text" maxlength="25" name="name" id="name" value="${delUser.name}" required="" readonly=""></div>
                <div class="form-group"><label for="serv-price">Фамилия</label><input class="form-control item" type="text"  name="price" name="surname" id="user-surname" value="${delUser.surname}" required="" readonly=""></div>
                <div class="form-group"><label for="serv-price">Телефон</label><input class="form-control item" type="number"  name="price" name="phone" id="user-surname" value="${delUser.phone}" required="" readonly=""></div>
                <div class="form-group"><label for="serv-price">Е-майл</label><input class="form-control item" type="email"  name="price" name="email" id="user-surname" value="${delUser.email}" required="" readonly=""></div>
                    <button class="btn btn-primary btn-block" type="submit">Деактивировать</button></form>
            </div>
        </section>

    <jsp:include page="/footer.jsp" />

