<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Деактивация услуги</h2>
                <p class="info">${info}</p>
                <a class="button btn btn-outline-success"  href="addservices"><i class="fas fa-backward"></i>Назад</a>
                
            </div>
            <form action="delservice?idServDelete=${delService.id}" method="POST">
                <div class="form-group"><input hidden name="cat_id" value="${delService.id}"><label for="name">Название услуги</label><input class="form-control item" type="text" maxlength="25" name="name" id="name" value="${delService.name}" required="" readonly=""></div>
                <div class="form-group"><label for="name">Цена</label><input class="form-control item" type="text" maxlength="25" name="name" id="name" value="${delService.price}" required="" readonly=""></div>
                
                    <button class="btn btn-primary btn-block" type="submit">Деактивировать</button></form>
            </div>
        </section>

    <jsp:include page="/footer.jsp" />
