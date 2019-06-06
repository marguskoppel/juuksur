<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/master/header_master.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Редактирование лимита</h2>
                <p class="info">${info} ${info2}</p>
                <a class="button btn btn-outline-success"  href="limits"><i class="fas fa-backward"></i>Назад</a>
                
            </div>
            <form action="changeLimit?id_limit=${limitedit.id}" method="POST">
                <div class="form-group"><input hidden name="serv_id" value="${limitedit.id}"><label for="name">Число(дата)</label><input class="form-control item" type="text"  name="limit_userdate" id="name" value="<fmt:formatDate value="${limitedit.userdate}" pattern="dd-MM-yyyy" />" readonly=""></div>
                <div class="form-group"><label for="serv-price">Лимит</label><input class="form-control item" type="number" step="1" min="1" max="1000" name="limit_count" id="user-surname" value="${limitedit.count}" required=""></div>
                    <button class="btn btn-primary btn-block" type="submit">Обновить запись</button></form>
            </div>
        </section>
                    

    <jsp:include page="/footer.jsp" />

