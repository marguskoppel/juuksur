<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/worker/header_worker.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Написать отзыв</h2>
                <p>Пожлауйста, оцените работу, поставив оценку от 1(очень плохо) до 5(превосходно), и оставив маленький комментарий</p>
                <p class="info">${info}</p>
                <a class="button btn btn-outline-success"  href="userinfo?useri=${regUser.id}"><i class="fas fa-backward"></i>Назад</a>
                
            </div>
            <form action="createReview?app_id=${appReview.id}" method="POST" id="createReview">
              <div class="form-group"><input hidden name="app_id" value="${appReview.id}><label for="name">Отценка</label><input class="form-control item" type="number"  name="count" min="1" max="5" value="5" id="name" required=""></div>
                
                <div class="form-group"><textarea form="createReview" name="text" placeholder="Комментарий" style="width:100%;" required=""></textarea></div>
                    <button class="btn btn-primary btn-block" type="submit">Выполнить</button></form>
                    
            </div>
        </section>

    <jsp:include page="/footer.jsp" />

