<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/pages/worker/header_worker.jsp" />
<main class="page contact-us-page">

    <section class="clean-block clean-pricing">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Личные данные, работы и отзывы</h2>
                <p> Измените личные данные. Просмотр будущих и выполненных работ <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Личные данные, работы" data-html="true" data-content="Вы находитесь на странице управления личными данными, просмотру будущих и выполненных работ. <br><br>Изменить личные данные можно нажав на кнопку <b>'Изменить'</b> "><i class="far fa-question-circle"></i></a></p>
                <p><b><i>${info} ${info2}</i></b></p>

            </div>
            <div class="table-responsive">
                <table class="table table-hover table-striped" style="margin-bottom: 50px">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col">Логин</th>
                            <th scope="col">Имя</th>
                            <th scope="col">Фамилия</th>
                            <th scope="col">Е-майл</th>
                            <th scope="col">Телефон</th>
                            <th scope="col">Управление</th>

                        </tr>
                    </thead>
                    <tbody>

                        <tr>

                            <td>${userinfo.login}</td>
                            <td>${userinfo.name}</td>
                            <td>${userinfo.surname}</td>
                            <td>${userinfo.email}</td>
                            <td>${userinfo.phone}</td>                               
                            <td><a title="Изменить" href="userinfoedit?eu=${userinfo.id}"><button type="button" class="btn btn-outline-primary btn-sm"><i class="fas fa-edit"></i>Изменить</button></a></td>

                        </tr>


                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Мои работы / Не завершенные</h2>

            </div>
            <div class="table-responsive">
                <table id="userinfo_worker" class="table table-hover display table-striped">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col">Услуги</th>
                            <th scope="col">Цена</th>
                            <th scope="col">Дата</th>
                            <th scope="col">Время</th>
                            <th scope="col">Клиент</th>
                            <th scope="col">Работник</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="app" items="${userAppInfonotfinished}">
                            <tr>

                                <td>${app.service.name}</td>
                                <td>${app.service.price} €</td>
                                <td><fmt:formatDate value="${app.userdate}" pattern="dd-MM-yyyy" /></td>
                                <td><fmt:formatDate value="${app.userdate}" pattern="HH:mm" /></td>
                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Клиент" data-html="true" data-content="Имя/Фамилия: <b>${app.user.name} ${app.user.surname}</b> <br><br> Телефон: <b>${app.user.phone}</b><br><br> Е-майл: <b>${app.user.email}</b>">${app.user.name} ${app.user.surname}</a></td>     

                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${app.worker.name} ${app.worker.surname}</b> <br><br> Телефон: <b>${app.worker.phone}</b><br><br> Е-майл: <b>${app.worker.email}</b>">${app.worker.name} ${app.worker.surname}</a></td>

                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Завершенные работы / Отзывы</h2>

            </div>
            <div class="table-responsive">
                <table id="userinfo_worker2" class="table table-hover display table-striped">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col">Услуги</th>
                            <th scope="col">Клиент</th>
                            <th class="sorttable_nosort" scope="col">Отзыв</th>



                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="app" items="${userAppInfofinished}">
                            <tr>

                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Услуга" data-html="true" data-content="Услуга: <b>${app.service.name}</b> <br><br> Цена: <b>${app.service.price} &euro;</b><br><br> Дата: <b><fmt:formatDate value="${app.userdate}" pattern="dd-MM-yyyy" /></b> <br><br> Время: <b><fmt:formatDate value="${app.userdate}" pattern="HH:mm" /></b>">${app.service.name}</a></td>
                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Клиент" data-html="true" data-content="Имя/Фамилия: <b>${app.user.name} ${app.user.surname}</b> <br><br> Телефон: <b>${app.user.phone}</b><br><br> Е-майл: <b>${app.user.email}</b>">${app.user.name} ${app.user.surname}</a></td>

                                <c:choose>
                                    <c:when test = "${app.review == null}">
                                        <td><i>Нет отзыва</i></td>

                                    </c:when>
                                    <c:otherwise>
                                        <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Оценка: ${app.review.count}" data-content="${app.review.text}">Отзыв</a></td>

                                    </c:otherwise>
                                </c:choose>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>



    <jsp:include page="/footer.jsp" />
