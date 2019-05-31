<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />

<main class="page registration-page">
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Записаться</h2>
                <p><b><i>${info} ${info2}</i></b></p>

            </div>
            <form action="addNewAppointment" method="POST">
                <div class="form-group"><label for="choose-category">Выберите услугу</label>
                    <select class="form-control" name="selectService" id="choose-category" required="">
                        <c:forEach var="service" items="${services}">
                            <option value="${service.id}">${service.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="user-date">Выберите дату</label>
                    <input type="date" class="form-control" name="userdate" id="datepicker" placeholder="" value="${date}" required="">
                </div>
                <div class="form-group">
                    <label for="user-time">Выберите время</label>
                    <select class="form-control" name="usertime" id="user-time" value="${time}" required="">
                        <option value="08:30">08:30</option>
                        <option value="09:00">09:00</option>
                        <option value="09:30">09:30</option>
                        <option value="10:00">10:00</option>
                        <option value="10:30">10:30</option>
                        <option value="11:00">11:00</option>
                        <option value="11:30">11:30</option>
                        <option value="12:00">12:00</option>
                        <option value="12:30">12:30</option>
                        <option value="13:00">13:00</option>
                        <option value="13:30">13:30</option>
                        <option value="14:00">14:00</option>
                        <option value="14:30">14:30</option>
                    </select>
                </div>
                <button class="btn btn-primary btn-block" type="submit">Записаться</button></form>
        </div>
    </section>

    <jsp:include page="/footer.jsp" />
