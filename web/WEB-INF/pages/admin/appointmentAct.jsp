<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Активация записи</h2>
                <p><b><i>${info} ${info2}</i></b></p>
                <a class="button btn btn-outline-success"  href="appointment_notactive"><i class="fas fa-backward"></i>Назад</a>

            </div>
            <form action="actappointment?idAppointmentActivate=${actAppointment.id}" method="POST">
                <div class="form-group"><input hidden name="app_id" value="${actAppointment.id}"><label for="name">Имя</label><input class="form-control item" type="text" maxlength="25" name="name" id="name" value="${actAppointment.service.name}" required="" readonly=""></div>
                <div class="form-group"><label for="serv-price">Цена</label><input class="form-control item" type="text"  name="price" name="surname" id="user-surname" value="${actAppointment.service.price} &euro;" required="" readonly=""></div>
                <div class="form-group"><label for="serv-price">Клиент</label><input class="form-control item" type="text"  name="price" name="phone" id="user-surname" value="${actAppointment.user.name} ${actAppointment.user.surname}" required="" readonly=""></div>
                <div class="form-group"><label for="serv-price">Дата</label><input class="form-control item" type="text"  name="price" name="email" id="user-surname" value="${actAppointment.userdate}" required="" readonly=""></div>

                <button class="btn btn-primary btn-block" type="submit">Активировать</button></form>
        </div>
    </section>

    <jsp:include page="/footer.jsp" />
