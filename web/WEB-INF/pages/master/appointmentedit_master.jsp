<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/master/header_master.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Назначение работника</h2>
                <p class="info">${info}</p>
                <p></p>
                <a class="button btn btn-outline-success"  href="appointments"><i class="fas fa-backward"></i>Назад</a>
            </div>
            <form action="changeAppointment?id_app=${appointmentEdit.id}" method="POST">
                <div class="form-group"><input hidden name="app_id" value="${appointmentEdit.id}"><label for="choose-worker">Назначте работника</label>
                    <select class="form-control" name="workerSetToApp">
                        <c:forEach var="worker" items="${listWorkers}">
                            <option value="${worker.user.id}">${worker.user.name} ${worker.user.surname}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group"><label for="user-name">Клиент</label>
                    <input class="form-control item" type="text" maxlength="25" name="username" id="user-name" value="${appointmentEdit.user.name} ${appointmentEdit.user.surname} ${appointmentEdit.user.phone}" readonly=""></div>
                <div class="form-group"><label for="user-name">Услуга</label>
                    <input class="form-control item" type="text" name="category" id="user-name" value="${appointmentEdit.service.name}" readonly=""></div>
                <div class="form-group"><label for="user-name">Дата</label>
                    <input class="form-control item" type="text" name="userdate" id="user-name" value="${appointmentEdit.userdate}" readonly=""></div>
                
                    <button class="btn btn-primary btn-block" type="submit">Назначить</button></form>
            </div>
        </section>


    <jsp:include page="/footer.jsp" />
