<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page registration-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Управление записями клиентов на услуги</h2>
                <p>Не завершенные работы / Не назначенный работник <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Управление записями" data-html="true" data-content="Вы находитесь на странице управления записями. <br>На данной странице находятся записи клиентов на услуги. <br><br>3 таблицы: <br><br><b>1. Незавершенные записи с не назначенными работниками</b> - служит для <b>назначения и изменеие работников на конкретные записи.</b>Также для деактивации записи.<br>Чтобы <b>'назначить'</b> работника нажмите на кнопку 'Назначить'. Для <b>'деактивации'</b> - кнопку <b>'деактивироать'</b><br><br><b>2. Незавершенные записи с назначенными работнтками</b> - можно <b>'завершить'</b> и <b>'деактивировать'</b> запись. <br>Для <b>'завершения'</b> записи нажмите на кнопку <b>'Завершить'.</b> Для <b>'деактивации'</b> - кнопку <b>'деактивироать'. </b><br><b><i>Завершение записи дает возможность соответствующему пользователю оставить оценку и отзыв в личных настройках.</i></b><br><br><b>3. Завершенные записи - можно деактивировать запись.</b><br><br>Для просмотра и <b>'активации'</b> деактивированных записей нажмите на кнопку <b>'Деактивированные записи'</b>"><i class="far fa-question-circle"></i></a></p>
                <p><b><i>${info} ${info2}</i></b></p>
                <a class="button btn btn-outline-primary"  href="appointment_notactive"><i class="far fa-share-square"></i>Деактивированные записи</a>
            </div>
            <div class="table-responsive">
                <table id="appointments_admin" class="display table table-hover table-striped">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col">Услуги</th>
                            <th scope="col" style="width:10%;">Цена</th>
                            <th scope="col" style="width:10%;">Дата</th>
                            <th scope="col" style="width:10%;">Время</th>
                            <th scope="col">Клиент</th>
                            <th scope="col" style="width:14%;">Работник</th>
                            <th class="sorttable_nosort" scope="col">Назначить</th>
                            <th class="sorttable_nosort" scope="col">Управление</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="app" items="${appointmentsNotDoneActive}">
                            <tr>

                                <td>${app.service.name}</td>
                                <td>${app.service.price} &euro;</td>
                                <td><fmt:formatDate value="${app.userdate}" pattern="dd-MM-yyyy" /></td>
                                <td><fmt:formatDate value="${app.userdate}" pattern="HH:mm" /></td>
                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Клиент" data-html="true" data-content="Имя/Фамилия: <b>${app.user.name} ${app.user.surname}</b> <br><br> Телефон: <b>${app.user.phone}</b><br><br> Е-майл: <b>${app.user.email}</b>">${app.user.name} ${app.user.surname}</a></td>     

                                <td>
                                    <c:choose>

                                        <c:when test="${app.worker != null}"><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${app.worker.name} ${app.worker.surname}</b> <br><br> Телефон: <b>${app.worker.phone}</b><br><br> Е-майл: <b>${app.worker.email}</b>">${app.worker.name} ${app.worker.surname}</a></c:when>
                                        <c:otherwise><i>Не назначен</i></c:otherwise>
                                    </c:choose>
                                </td>
                                <td><a class="btn btn-primary" href="editappointment?app_id=${app.id}">Назначить</a></td>

                                <td><a title='Деактивировать' href="deleteappointment?app_id=${app.id}"><i class="far fa-trash-alt"></i></a></td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Записи с назначенным работником</h2>
                <p>Не завершенные работы / Назначенный работник</p>
            </div>
            <div class="table-responsive">
                <table id="appointments_admin2" class="display table table-hover table-striped">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col">Услуги</th>
                            <th scope="col" style="width:10%;">Цена</th>
                            <th scope="col" style="width:10%;">Дата</th>
                            <th scope="col" style="width:10%;">Время</th>
                            <th scope="col">Клиент</th>
                            <th scope="col" style="width:14%;">Работник</th>
                            <th class="sorttable_nosort" scope="col">Завершить</th>
                            <th class="sorttable_nosort" scope="col">Управление</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="app" items="${appointmentsNotFinishedActiveWorkerOn}">
                            <tr>

                                <td>${app.service.name}</td>
                                <td>${app.service.price} &euro;</td>
                                <td><fmt:formatDate value="${app.userdate}" pattern="dd-MM-yyyy" /></td>
                                <td><fmt:formatDate value="${app.userdate}" pattern="HH:mm" /></td>
                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Клиент" data-html="true" data-content="Имя/Фамилия: <b>${app.user.name} ${app.user.surname}</b> <br><br> Телефон: <b>${app.user.phone}</b><br><br> Е-майл: <b>${app.user.email}</b>">${app.user.name} ${app.user.surname}</a></td>     

                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${app.worker.name} ${app.worker.surname}</b> <br><br> Телефон: <b>${app.worker.phone}</b><br><br> Е-майл: <b>${app.worker.email}</b>">${app.worker.name} ${app.worker.surname}</a></td>
                                <td><a class="btn btn-primary" href="doneappointment?app_id=${app.id}">Завершить</a></td>

                                <td><a title='Деактивировать' href="deleteappointment?app_id=${app.id}"><i class="far fa-trash-alt"></i></a></td>
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
                <h2 class="text-info">Завершенные записи</h2>

            </div>
            <div class="table-responsive">
                <table id="appointments_admin3" class="display table table-hover table-striped">
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
                        <c:forEach var="app" items="${appointmentsFinishedActiveWorkerOn}">
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
                                <td><a title='Деактивировать' href="deleteappointment?app_id=${app.id}"><i class="far fa-trash-alt"></i></a></td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </section>

    <jsp:include page="/footer.jsp" />
