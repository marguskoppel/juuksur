<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Редактирование услуги</h2>
                <p class="info">${info}</p>
                <a class="button btn btn-outline-success"  href="addservices"><i class="fas fa-backward"></i>Назад</a>
                
            </div>
            <form action="changeService?id_serv=${editService.id}" method="POST">
                <div class="form-group"><input hidden name="serv_id" value="${editService.id}"><label for="name">Название услуги</label><input class="form-control item" type="text" maxlength="25" name="name" id="name" value="${editService.name}" required=""></div>
                <div class="form-group"><label for="serv-price">Цена</label><input class="form-control item" type="number" step="0.01" max="100" name="price" name="price" id="user-surname" value="${editService.price}" required=""></div>
                    <button class="btn btn-primary btn-block" type="submit">Обновить запись</button></form>
            </div>
        </section>

    <jsp:include page="/footer.jsp" />

