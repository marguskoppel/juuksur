<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page contact-us-page">
    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Активирование пользователя</h2>
                <p>Деактивированные пользователи <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Управление деактивированными пользователями" data-html="true" data-content="Вы находитесь на странице управления деактивированными пользователями. <br>На данной странице можно посмотреть данные пользователей. Также можно <b>активировать</b> аккаунт пользователя.<br><br>Для активирования аккаунта пользователя нажмите на кнопку <b>'Активировать'</b> у соответствующего пользователя"><i class="far fa-question-circle"></i></a></p>
                <p>${info}</p>
                <a class="button btn btn-outline-primary"  href="users"><i class="far fa-arrow-alt-circle-left"></i>Активированные пользователи</a>

            </div>
<div class="table-responsive">
            <table id="usernotactive_admin" class="table table-hover display table-striped" style="margin-bottom: 50px">
                <thead style="background-color: #5295dc;">
                    <tr>
                        <th scope="col">Логин</th>
                        <th scope="col">Имя</th>
                        <th scope="col">Фамилия</th>
                        <th scope="col">Телефон</th>
                        <th scope="col">Е-майл</th>
                        <th class="sorttable_nosort" scope="col">Активировать</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.login}</td>
                            <td>${user.name}</td>
                            <td>${user.surname}</td>
                            <td>${user.phone}</td>
                            <td>${user.email}</td>
                            <td><a title='Активировать' href="activateuser?user_id=${user.id}"><i class="fas fa-power-off"></i></a> 
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
</div>
        </div>
    </section>
    
    <jsp:include page="/footer.jsp" />