<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Деактивация записи</h2>
                <p><b><i>${info} ${info2}</i></b></p>
                <a class="button btn btn-outline-success"  href="appointments"><i class="fas fa-backward"></i>Назад</a>

            </div>
            <form action="delappointment?app_id=${delAppointment.id}" method="POST">
                <div class="form-group"><input hidden name="app_id" value="${delAppointment.id}"><label for="name">Имя</label><input class="form-control item" type="text" maxlength="25" name="name" id="name" value="${delAppointment.service.name}" required="" readonly=""></div>
                <div class="form-group"><label for="serv-price">Цена</label><input class="form-control item" type="text"  name="price" name="surname" id="user-surname" value="${delAppointment.service.price}" required="" readonly=""></div>
                <div class="form-group"><label for="serv-price">Клиент</label><input class="form-control item" type="text"  name="price" name="phone" id="user-surname" value="${delAppointment.user.name} ${delAppointment.user.surname}" required="" readonly=""></div>
                <div class="form-group"><label for="serv-price">Дата</label><input class="form-control item" type="text"  name="price" name="email" id="user-surname" value="${delAppointment.userdate}" required="" readonly=""></div>
                <button class="btn btn-primary btn-block" type="submit">Деактивировать</button></form>
        </div>
    </section>

    <jsp:include page="/footer.jsp" />

