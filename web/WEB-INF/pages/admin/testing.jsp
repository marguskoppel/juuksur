<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />


<main class="page registration-page">
    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Статистика</h2>
                <p>Работники || Записи || Услуги <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Статистика" data-html="true" data-content="Вы находитесь на странице статистики. <br>На данной странице находится списки работников, записей и услуг. <br><br>Нажав на кнопку <b>'Статистика'</b> можно посмотреть статистику каждого отдельного работника."><i class="far fa-question-circle"></i></a></p>
                <p><b><i>${info} ${info2}</i></b></p>

            </div>


            <!-- <div id="reportrange3"
                  style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
                 <i class="fa fa-calendar"></i>&nbsp;
                 <span></span> <i class="fa fa-caret-down"></i>
             </div>-->
            <div id="reportrange33" class="btn btn-success btn-lg">
                <span></span> <b class="caret"></b>
            </div>
            <hr>
            <br>




            <div class="table-responsive">
                <table id="example33" display table table-hover table-striped">
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
                                <!--<td><fmt:formatDate value="${app.userdate}" pattern="dd-MM-YYYY" /></td>-->
                                 <td>30-05-2019</td>
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



            <div id="reportrange3" class="btn btn-success btn-lg datepick">
                <span></span> <b class="caret"></b>
            </div>
            <hr>
            <br>
            <table id="example3">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Client</th>
                        <th>Worker</th>
                    </tr>
                </thead>
                <tbody>
                    <!--<tr>
                        <th>1</th>
                        <th>Bob</th>
                        <th>2018-04-20</th>
                    </tr>
                    <tr>
                        <th>2</th>
                        <th>Jane</th>
                        <th>2019-05-30</th>
                    </tr>
                    <tr>
                        <th>3</th>
                        <th>Jill</th>
                        <th>2018-02-15</th>
                    </tr>
                    <tr>
                        <th>4</th>
                        <th>Joe</th>
                        <th>2019-08-06</th>
                    </tr>-->
                    <c:forEach var="app" items="${listAppointments}">
                            <tr>

                                <td>${app.service.name}</td>
                                <td>${app.service.price} </td>
                                <td><fmt:formatDate value="${app.userdate}" pattern="dd-MM-YYYY" /></td>
                                 <!--<td>30-05-2019</td>-->
                                <td><fmt:formatDate value="${app.userdate}" pattern="HH:mm" /></td>

                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Клиент" data-html="true" data-content="Имя/Фамилия: <b>${app.user.name} ${app.user.surname}</b> <br><br> Телефон: <b>${app.user.phone}</b><br><br> Е-майл: <b>${app.user.email}</b>">${app.user.name} ${app.user.surname}</a></td>     

                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${app.worker.name} ${app.worker.surname}</b> <br><br> Телефон: <b>${app.worker.phone}</b><br><br> Е-майл: <b>${app.worker.email}</b>">${app.worker.name} ${app.worker.surname}</a></td>     


                            </tr>

                        </c:forEach>
                </tbody>
            </table>
            
            
            <p id="date_filter">
    <span id="date-label-from" class="date-label">From: </span><input class="date_range_filter date" type="text" id="datepicker_from" />
    <span id="date-label-to" class="date-label">To:<input class="date_range_filter date" type="text" id="datepicker_to" />
</p>
    <table width="100%" class="display" id="datatable">
      <thead>
        <tr>
          <th>Col1</th>
          <th>Col2</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            03/03/2016
          </td>
          <td>5</td>
        </tr>
        <tr>
          <td>
            03/04/2017
          </td>
          <td>4</td>
        </tr>
        <tr>
          <td>
             03/05/2017
          </td>
          <td>2</td>
        </tr>
        <tr>
          <td>
            03/06/2016
          </td>
          <td>17</td>
        </tr>
        <tr>
          <td>
            03/07/2017
          </td>
          <td>10</td>
        </tr>
      </tbody>
    </table>
  </body>


            <jsp:include page="/footer.jsp" />
