<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/master/header_master.jsp" />







<main class="page registration-page">
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Статистика</h2>
                <p>Работники || Записи || Услуги <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Статистика" data-html="true" data-content="Вы находитесь на странице статистики. <br>На данной странице находится списки работников, записей и услуг. <br><br>Нажав на кнопку <b>'Статистика'</b> можно посмотреть статистику каждого отдельного работника."><i class="far fa-question-circle"></i></a></p>
                <p><b><i>${info} ${info2}</i></b></p>

            </div>

            <!--TABS / PILLS-->


            <ul class="nav nav-tabs nav-justified">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#workers" title="Статистика работников">Работники</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#appointments" title="Статистика записей">Записи</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#services" title="Статистика услуг">Услуги</a>
                </li>
            </ul>



            <div class="tab-content">
                <div id="workers" class="container tab-pane active"><br>
                    <div class="table-responsive">
                        <table id="statistics_admin_workers" class="display table table-hover table-striped">
                            <thead style="background-color: #5295dc;">
                                <tr>

                                    <th scope="col">Работник</th>
                                    <th scope="col">Телефон</th>
                                    <th scope="col">Емайл</th>

                                    <th class="sorttable_nosort" scope="col">Управление</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="worker" items="${listWorkers}">
                                    <tr>

                                        <td>${worker.user.name} ${worker.user.surname}</td>
                                        <td>${worker.user.phone}</td>
                                        <td>${worker.user.email}</td>

                                        <td><a class="btn btn-primary" href="stat?worker_id=${worker.user.id}">Статистика</a></td>     


                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div> <!--id="workers" END-->
                <div id="appointments" class="container tab-pane fade"><br>


                    <div class="table-responsive">
                        <table id="workerstat_admin_appointments" class="display table table-hover table-striped">
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
                                <c:forEach var="app" items="${listAppointments}">
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
                    <div class="container">
                        <div class="block-heading">
                            <h2 class="text-info">Выборка по дате(от и до)</h2>
                            <p><b><i>${info} ${info2}</i></b></p>


                        </div>
                        <form action="showStatistics" method="POST">
                            <div class="form-group" align="center">
                                Период от:${dateFrom} День:
                                <select style="text-align-last:center;" name="fromDay">
                                    
                                    
                                    <c:forEach begin="1" end="31" var="i">
                                        <option value="${i}" <c:if test="${i eq fromDay}">selected</c:if>>${i}</option> 
                                    </c:forEach>
                                </select>
                                Месяц:
                                <select style="text-align-last:center;" name="fromMonth">
                                    
                                    <c:forEach begin="1" end="12" var="i">
                                        <option value="${i}" <c:if test="${i eq fromMonth}">selected</c:if>>${i}</option>
                                    </c:forEach>
                                </select>
                                Год:
                                <select style="text-align-last:center;" name="fromYear">
                                    
                                    <c:forEach begin="2014" end="2019" var="i">
                                        <option value="${i}" <c:if test="${i eq fromYear}">selected</c:if>>${i}</option>
                                    </c:forEach>
                                </select>


                            </div>
                            <!--<div class="form-group"><button name="delRoleButton" class="btn btn-danger btn-block" type="submit">Удалить роль</button></div>-->
                            <div class="form-group" align="center">
                                Период до: ${dateTo} День:
                                <select style="text-align-last:center;" name="toDay">
                                    
                                    <c:forEach begin="1" end="31" var="i">
                                        <option value="${i}" <c:if test="${i eq toDay}">selected</c:if>>${i}</option>
                                    </c:forEach>
                                </select>
                                Месяц:
                                <select style="text-align-last:center;" name="toMonth">
                                    
                                    <c:forEach begin="1" end="12" var="i">
                                        <option value="${i}" <c:if test="${i eq toMonth}">selected</c:if>>${i}</option>
                                    </c:forEach>
                                </select>
                                Год:
                                <select style="text-align-last:center;" name="toYear">
                                    
                                    <c:forEach begin="2014" end="2019" var="i">
                                        <option value="${i}" <c:if test="${i eq toYear}">selected</c:if>>${i}</option>
                                    </c:forEach>
                                </select>

                            </div>
                            <div class="form-group"><button name="timeRange" class="btn btn-primary btn-block" type="submit">Показать</button></div>
                        </form>
                        

                        
                        </div>
                    

                </div> <!--id="appointments" END-->


                <div id="services" class="container tab-pane fade"><br>

                    <div class="table-responsive">
                        <table id="workerstat_admin_services" class="display table table-hover table-striped">
                            <thead style="background-color: #5295dc;">
                                <tr>

                                    <th scope="col">Услуга</th>
                                    <th scope="col">Цена &euro;</th>
                                    <th scope="col">Рейтинг</th>



                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="entry" items="${sortedMapServicesRate}" varStatus="count">
                                    <tr>

                                        <td>${entry.key.name}</td>
                                        <td>${entry.key.price}</td>
                                        <td>${entry.value}</td>

                                    </tr>

                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th>



                                </tr>
                            </tfoot>
                        </table>
                    </div>

                </div> <!--id="services" END-->


            </div> <!--TAB END-->
        </div>
    </section>


    <jsp:include page="/footer.jsp" />
