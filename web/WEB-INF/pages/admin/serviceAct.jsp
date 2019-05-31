<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Активация услуги</h2>
                <p class="info">${info}</p>
                <a class="button btn btn-outline-success"  href="cat_serv_notactive"><i class="fas fa-backward"></i>Назад</a>
                
            </div>
            <form action="actservice?idServActivate=${actService.id}" method="POST">
                <div class="form-group"><input hidden name="cat_id" value="${actService.id}"><label for="name">Название услиги</label><input class="form-control item" type="text" maxlength="25" name="name" id="name" value="${actService.name}" required="" readonly=""></div>
                <div class="form-group"><label for="name">Цена</label><input class="form-control item" type="text" maxlength="25" name="price" id="name" value="${actService.price}" required="" readonly=""></div>
                
                    <button class="btn btn-primary btn-block" type="submit">Активировать</button></form>
            </div>
        </section>

    <jsp:include page="/footer.jsp" />
