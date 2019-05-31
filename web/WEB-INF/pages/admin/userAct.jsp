<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Активация пользователя</h2>
                <p class="info">${info}</p>
                <a class="button btn btn-outline-success"  href="user_notactive"><i class="fas fa-backward"></i>Назад</a>
                
            </div>
            <form action="actuser?idUserActivate=${actUser.id}" method="POST">
                <div class="form-group"><input hidden name="cat_id" value="${actUser.id}"><label for="name">Логин</label><input class="form-control item" type="text"  name="login" id="name" value="${actUser.login}" required="" readonly=""></div>
                <div class="form-group"><label for="name">Имя</label><input class="form-control item" type="text"  name="name" id="name" value="${actUser.name}" required="" readonly=""></div>
                <div class="form-group"><label for="surname">Фамилия</label><input class="form-control item" type="text"  name="surname" id="name" value="${actUser.surname}" required="" readonly=""></div>
                <div class="form-group"><label for="phone">Телефон</label><input class="form-control item" type="number"  name="phone" id="name" value="${actUser.phone}" required="" readonly=""></div>
                <div class="form-group"><label for="email">Е-майл</label><input class="form-control item" type="email"  name="email" id="name" value="${actUser.email}" required="" readonly=""></div>
                
                    <button class="btn btn-primary btn-block" type="submit">Активировать</button></form>
            </div>
        </section>

    <jsp:include page="/footer.jsp" />
