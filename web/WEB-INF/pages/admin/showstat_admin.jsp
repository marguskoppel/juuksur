<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />







<main class="page registration-page">
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info"></h2>
                <p>Записи в период от ${fromDay}-${fromMonth}-${fromYear} до ${toDay}-${toMonth}-${toYear} <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Статистика" data-html="true" data-content="Выберите диапазон дат для филтрации записей."><i class="far fa-question-circle"></i></a></p>
                <p><b><i>${info} ${info2}</i></b></p>
                <a class="button btn btn-outline-success"  href="statistics"><i class="fas fa-backward"></i>Назад</a>

            </div>


            <form action="showStatistics" method="POST">
                <div class="form-group" align="center">
                    <select style="text-align-last:center;" name="fromDay">
                        <option value="" disabled selected hidden>Период от:${dateFrom} День:</option>
                        <c:forEach begin="1" end="31" var="i">
                            <option value="${i}" <c:if test="${i eq fromDay}">selected</c:if>>${i}</option> 
                        </c:forEach>
                    </select>
                    <select style="text-align-last:center;" name="fromMonth">
                        <option value="" disabled selected hidden>Месяц:</option>
                        <c:forEach begin="1" end="12" var="i">
                            <option value="${i}" <c:if test="${i eq fromMonth}">selected</c:if>>${i}</option>
                        </c:forEach>
                    </select>
                    <select style="text-align-last:center;" name="fromYear">
                        <option value="" disabled selected hidden>Год:</option>
                        <c:forEach begin="2014" end="2019" var="i">
                            <option value="${i}" <c:if test="${i eq fromYear}">selected</c:if>>${i}</option>
                        </c:forEach>
                    </select>


                </div>
                <!--<div class="form-group"><button name="delRoleButton" class="btn btn-danger btn-block" type="submit">Удалить роль</button></div>-->
                <div class="form-group" align="center">
                    <select style="text-align-last:center;" name="toDay">
                        <option value="" disabled selected hidden>Период до: ${dateTo} День:</option>
                        <c:forEach begin="1" end="31" var="i">
                            <option value="${i}" <c:if test="${i eq toDay}">selected</c:if>>${i}</option>
                        </c:forEach>
                    </select>
                    <select style="text-align-last:center;" name="toMonth">
                        <option value="" disabled selected hidden>Месяц:</option>
                        <c:forEach begin="1" end="12" var="i">
                            <option value="${i}" <c:if test="${i eq toMonth}">selected</c:if>>${i}</option>
                        </c:forEach>
                    </select>
                    <select style="text-align-last:center;" name="toYear">
                        <option value="" disabled selected hidden>Год:</option>
                        <c:forEach begin="2014" end="2019" var="i">
                            <option value="${i}" <c:if test="${i eq toYear}">selected</c:if>>${i}</option>
                        </c:forEach>
                    </select>

                </div>
                <div class="form-group"><button name="timeRange" class="btn btn-primary btn-block" type="submit">Показать</button></div>
            </form>
            

            <div class="table-responsive">
                <table id="workerstat_admin_appointments_range" class="display table table-hover table-striped">
                    <thead style="background-color: #5295dc;">
                        <tr>

                            <th scope="col">Услуга</th>
                            <th scope="col">Цена &euro;</th>
                            <th scope="col">Дата</th>
                            <th scope="col">Время</th>
                            <th scope="col">Клиент</th>
                            <th scope="col">Работник</th>


                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="app" items="${listAppointmentsRange}">
                            <tr>

                                <td>${app.service.name}</td>
                                <td>${app.service.price} </td>
                                <td><fmt:formatDate value="${app.userdate}" pattern="dd-MM-YYYY" /></td>

                                <td><fmt:formatDate value="${app.userdate}" pattern="HH:mm" /></td>

                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Клиент" data-html="true" data-content="Имя/Фамилия: <b>${app.user.name} ${app.user.surname}</b> <br><br> Телефон: <b>${app.user.phone}</b><br><br> Е-майл: <b>${app.user.email}</b>">${app.user.name} ${app.user.surname}</a></td>     

                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${app.worker.name} ${app.worker.surname}</b> <br><br> Телефон: <b>${app.worker.phone}</b><br><br> Е-майл: <b>${app.worker.email}</b>">${app.worker.name} ${app.worker.surname}</a></td>     


                            </tr>

                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="2"></th>
                            <th colspan="3" style="text-align:right"></th>
                            <th></th>


                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>


        </div>
    </section>


    <jsp:include page="/footer.jsp" />
