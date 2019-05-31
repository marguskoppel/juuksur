<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/master/header_master.jsp" />
<main class="page contact-us-page">

    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Установка лимита</h2>
                <p>Назначение лимита записей на конкретный день <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Лимит на записи" data-html="true" data-content="Вы находитесь на странице назначения лимитов на записи к мастеру. <br> Выбрав количество и дату, и нажав на кнопку <b>'Добавить'</b> - назначенный лимит появится в таблице ниже. <br><br> Лимит служит для контроля за работой.
                                                                   <br> Лимит на определенный день означает что <b>количество = максимальное число записей на день</b>. Если лимит иcчерпан, то больше записаться на этот день нельзя. В этом случае клиент, при записи к мастеру, увидит сообщение о лимите.<br><br>Количество лимита можно редактировать - в таблице нажав на кнопку 'Изменить' у нужного лимита. На новой странице можно назначить новое количество."><i class="far fa-question-circle"></i></a></p>
                <p><b><i>${info} ${info2}</i></b></p>


            </div>
            <form action="addnewlimit" method="POST">
                <div class="form-group"><label for="new-limit">Лимит</label><input class="form-control" size="65" type="number" name="newlimit" step="1" value="1" min="1" max="100" required="" /></div>

                <div class="form-group"><label for="limit-date">Дата</label><input class="form-control"  name="limit_date" id="service-price" type="date" required=""/></div>
                <div class="form-group"><button class="btn btn-primary btn-block" type="submit">Добавить</button></div>
            </form>
        </div>
    </section>
    <section class="clean-block clean-pricing dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Установленные лимиты записей</h2>



            </div>
            <div class="table-responsive">
                <table id="limits_master" class="table table-hover display table-striped" style="margin-bottom: 50px">
                    <thead style="background-color: #5295dc;">
                        <tr>

                            <th scope="col">Число(дата)</th>
                            <th scope="col">Допустимое количество записей</th>
                            <th class="sorttable_nosort" scope="col">Управление</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="limitApp" items="${limitApps}">
                            <tr>

                                <td><fmt:formatDate value="${limitApp.userdate}" pattern="dd-MM-yyyy" /></td>
                                <td>${limitApp.count}</td>
                                <td><a href="editlimit?limit_id=${limitApp.id}"><i class="fas fa-edit"></i></a> </td>

                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <jsp:include page="/footer.jsp" />