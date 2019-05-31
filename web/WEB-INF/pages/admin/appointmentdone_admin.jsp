<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Отметить запись как выполненную</h2>
                <p><b><i>${info} ${info2}</i></b></p>
                <p></p>
                <a class="button btn btn-outline-success"  href="appointments"><i class="fas fa-backward"></i>Назад</a>
            </div>
            <form action="finishAppointment?id_app=${appointmentDone.id}" method="POST">

                <div class="form-group"><label for="user-name">Клиент</label>
                    <input class="form-control item" type="text" name="username" id="user-name" value="${appointmentDone.user.name} ${appointmentDone.user.surname} ${appointmentDone.user.phone}" readonly=""></div>
                <div class="form-group"><label for="user-name">Работник</label>
                    <input class="form-control item" type="text" name="username" id="user-name" value="${appointmentDone.worker.name} ${appointmentDone.worker.surname}" readonly=""></div>
                <div class="form-group"><label for="user-name">Услуга</label>
                    <input class="form-control item" type="text" name="category" id="user-name" value="${appointmentDone.service.name}   Цена: ${appointmentDone.service.price} €" readonly=""></div>
                <div class="form-group"><label for="user-name">Дата</label>
                    <input class="form-control item" type="text" name="userdate" id="user-name" value="${appointmentDone.userdate}" readonly=""></div>

                <button class="btn btn-primary btn-block" type="submit">Выполнить</button></form>
        </div>
    </section>


    <jsp:include page="/footer.jsp" />
