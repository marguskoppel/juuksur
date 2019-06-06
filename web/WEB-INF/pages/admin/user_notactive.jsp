<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page contact-us-page">
    <section class="clean-block clean-form">
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
                        <th scope="col">Пользователь</th>
                        
                        <th scope="col">Роль</th>
                        <th class="sorttable_nosort" scope="col">Активировать</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users_notactive}">
                        <c:if test="${user.user.active == false}">
                        <tr>
                            <td>${user.user.login}</td>
                            <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${user.user.name} ${user.user.surname}</b> <br><br> Телефон: <b>${user.user.phone}</b><br><br> Е-майл: <b>${user.user.email}</b>">${user.user.name} ${user.user.surname}</a></td>
                            <td>${user.role.name}</td>
                            <td><a title='Активировать' href="activateuser?user_id=${user.user.id}"><button type="button" class="btn btn-outline-primary btn-sm"><i class="fas fa-power-off"></i>Активировать</button></a></i></a> 
                        </tr>
                        </c:if>
                    </c:forEach>

                </tbody>
            </table>
</div>
        </div>
    </section>
    
    <jsp:include page="/footer.jsp" />