<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page contact-us-page">

    <section class="clean-block clean-pricing dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Личные данные, записи и отзывы</h2>
                <p> Измените личные данные. Оставьте отзыв по выполненной услуге <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Личные данные, записи, отзывы" data-html="true" data-content="Вы находитесь на странице управления личными данными, просмотру записей к мастеру, а также здесть можно оставить отзыв по выполненной услуге.<br><br>Статус <b>'В обработке'</b> означает что все хорошо, запись принята и в скором времени будет назначен работник. <br>Статус <b>'Отменен'</b> означает что Ваша запись отменена. Для выявления причин - контактная информация на странице 'Контакты'. <br><br>Изменить личные данные можно нажав на кнопку <b>'Изменить'</b><br><br>Оставить отзыв можно нажав на кнопку <b>'Оставить отзыв'</b> "><i class="far fa-question-circle"></i></a></p>
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
                            <td><a title='Изменить' href="userinfoedit?eu=${userinfo.id}"><button type="button" class="btn btn-outline-primary btn-sm"><i class="fas fa-edit"></i>Изменить</button></a></td>

                        </tr>


                    </tbody>
                </table>
            </div>

        </div>
    </section>
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Мои записи к мастеру / Не завершенные</h2>

            </div>
            <div class="table-responsive">
                <table id="userinfo_admin" class="table table-hover display table-striped">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col">Услуги</th>
                            <th scope="col">Цена</th>
                            <th scope="col">Дата</th>
                            <th scope="col">Время</th>
                            <th scope="col">Работник</th>
                            <th scope="col">Статус</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="app" items="${userAppInfonotfinished}">
                            <tr>

                                <td>${app.service.name}</td>
                                <td>${app.service.price} €</td>
                                <td><fmt:formatDate value="${app.userdate}" pattern="dd-MM-yyyy" /></td>
                                <td><fmt:formatDate value="${app.userdate}" pattern="HH:mm" /></td>

                                <c:choose>
                                    <c:when test="${app.worker == null}">
                                        <td><i>Не назначен</i></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${app.worker.name} ${app.worker.surname}</b> <br><br> Телефон: <b>${app.worker.phone}</b><br><br> Е-майл: <b>${app.worker.email}</b>">${app.worker.name} ${app.worker.surname}</a></td>  
                                    </c:otherwise>


                                </c:choose>
                                <c:choose>
                                    <c:when test="${app.active == false}">
                                        <td><i>Отменен</i></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><i>В обработке</i></td>  
                                    </c:otherwise>


                                </c:choose>

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
                <h2 class="text-info">Завершенные услуги / Оставьте отзыв</h2>

            </div>
            <div class="table-responsive">
                <table id="userinfo_admin2" class="table table-hover display table-striped">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col">Услуги</th>

                            <th scope="col">Клиент</th>

                            <th scope="col">Работник</th>
                            <th class="sorttable_nosort" scope="col">Отзыв</th>
                            <th class="sorttable_nosort" scope="col">Управление</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="app" items="${userAppInfofinished}">
                            <tr>

                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Услуга" data-html="true" data-content="Услуга: <b>${app.service.name}</b> <br><br> Цена: <b>${app.service.price} &euro;</b><br><br> Дата: <b><fmt:formatDate value="${app.userdate}" pattern="dd-MM-yyyy" /></b> <br><br> Время: <b><fmt:formatDate value="${app.userdate}" pattern="HH:mm" /></b>">${app.service.name}</a></td>
                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Клиент" data-html="true" data-content="Имя/Фамилия: <b>${app.user.name} ${app.user.surname}</b> <br><br> Телефон: <b>${app.user.phone}</b><br><br> Е-майл: <b>${app.user.email}</b>">${app.user.name} ${app.user.surname}</a></td>


                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${app.worker.name} ${app.worker.surname}</b> <br><br> Телефон: <b>${app.worker.phone}</b><br><br> Е-майл: <b>${app.worker.email}</b>">${app.worker.name} ${app.worker.surname}</a></td>
                                <c:choose>
                                    <c:when test = "${app.review == null}">
                                        <td><i>Нет отзыва</i></td>
                                        <td><a class="btn btn-primary" href="reviewcreate?app_id=${app.id}">Оставить отзыв</a></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Оценка: ${app.review.count}" data-content="${app.review.text}">Отзыв</a></td>
                                        <td>Нет действия</td>
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
