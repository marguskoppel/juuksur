<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page contact-us-page">
    



    <section class="clean-block clean-form dark">
        <div class="container">
           
            <div class="block-heading">
                <c:set var ="worker" value = "${workerApp}"/>
                <h2 class="text-info">Статистика работника <b><i>${worker.name} ${worker.surname}</i></b></h2>
                <p>Все выполненные услуги работника <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Статистика работника" data-html="true" data-content="Вы находитесь на странице статистики конкретного работника. <br><br>На странице представлены подсчеты выполненных услуг и оценки от клиентов для работника. "><i class="far fa-question-circle"></i></a></p>
                <p><b><i>${info} ${info2}</i></b></p>
                <a class="button btn btn-outline-success"  href="statistics"><i class="fas fa-backward"></i>Назад</a>
            </div>

            <div class="table-responsive">
                <table id="workerstat_admin" class="display table table-hover table-striped">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col">Услуги</th>

                            <th scope="col">Клиент</th>

                            <th scope="col">Работник</th>
                            <th class="sorttable_nosort" scope="col">Отзыв</th>
                            <th class="sorttable_nosort" scope="col">Оценка</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="app" items="${workerStats}">
                            <tr>

                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Услуга" data-html="true" data-content="Услуга: <b>${app.service.name}</b> <br><br> Цена: <b>${app.service.price} &euro;</b><br><br> Дата: <b><fmt:formatDate value="${app.userdate}" pattern="dd-MM-yyyy" /></b> <br><br> Время: <b><fmt:formatDate value="${app.userdate}" pattern="HH:mm" /></b>">${app.service.name}</a></td>
                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Клиент" data-html="true" data-content="Имя/Фамилия: <b>${app.user.name} ${app.user.surname}</b> <br><br> Телефон: <b>${app.user.phone}</b><br><br> Е-майл: <b>${app.user.email}</b>">${app.user.name} ${app.user.surname}</a></td>

                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${app.worker.name} ${app.worker.surname}</b> <br><br> Телефон: <b>${app.worker.phone}</b><br><br> Е-майл: <b>${app.worker.email}</b>">${app.worker.name} ${app.worker.surname}</a></td>
                                <c:choose>
                                    <c:when test = "${app.review == null}">
                                        <td><i>Нет отзыва</i></td>

                                    </c:when>
                                    <c:otherwise>
                                        <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Оценка: ${app.review.count}" data-content="${app.review.text}">Отзыв</a></td>

                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test = "${app.review == null}">
                                        <td class="notinteger">нет записи</td>

                                    </c:when>
                                    <c:otherwise>
                                        <td>${app.review.count}</td>

                                    </c:otherwise>
                                </c:choose>




                            </tr>

                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>

                            <th colspan="4" style="text-align:right"></th>
                            <th></th>


                        </tr>
                    </tfoot>
                </table>
            </div>

        </div>
    </section>
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Статистика работника <b><i>${worker.name} ${worker.surname}</i></b></h2>
                <p>Выполненные услуги с оценками</p>
                <p><b><i>${info} ${info2}</i></b></p>
            </div>

            <div class="table-responsive">
                <table id="workerstat_admin2" class="display table table-hover table-striped">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col">Услуги</th>

                            <th scope="col">Клиент</th>

                            <th scope="col">Работник</th>
                            <th class="sorttable_nosort" scope="col">Отзыв</th>
                            <th class="sorttable_nosort" scope="col">Оценка</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="app" items="${workerStatsReview}">
                            <tr>

                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Услуга" data-html="true" data-content="Услуга: <b>${app.service.name}</b> <br><br> Цена: <b>${app.service.price} &euro;</b><br><br> Дата: <b><fmt:formatDate value="${app.userdate}" pattern="dd-MM-yyyy" /></b> <br><br> Время: <b><fmt:formatDate value="${app.userdate}" pattern="HH:mm" /></b>">${app.service.name}</a></td>
                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Клиент" data-html="true" data-content="Имя/Фамилия: <b>${app.user.name} ${app.user.surname}</b> <br><br> Телефон: <b>${app.user.phone}</b><br><br> Е-майл: <b>${app.user.email}</b>">${app.user.name} ${app.user.surname}</a></td>

                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${app.worker.name} ${app.worker.surname}</b> <br><br> Телефон: <b>${app.worker.phone}</b><br><br> Е-майл: <b>${app.worker.email}</b>">${app.worker.name} ${app.worker.surname}</a></td>
                                <c:choose>
                                    <c:when test = "${app.review == null}">
                                        <td><i>Нет отзыва</i></td>

                                    </c:when>
                                    <c:otherwise>
                                        <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Оценка: ${app.review.count}" data-content="${app.review.text}">Отзыв</a></td>

                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test = "${app.review == null}">
                                        <td class="notinteger">нет записи</td>

                                    </c:when>
                                    <c:otherwise>
                                        <td>${app.review.count}</td>

                                    </c:otherwise>
                                </c:choose>




                            </tr>

                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            
                            <th colspan="3" style="text-align:right"></th>
                            <th></th>
                            <th></th>


                        </tr>
                    </tfoot>
                </table>
            </div>

        </div>
    </section>



    <jsp:include page="/footer.jsp" />