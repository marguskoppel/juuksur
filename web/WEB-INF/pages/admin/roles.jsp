<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page contact-us-page">
    <section class="clean-block clean-form ">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Администрирование пользователей</h2>
                
                <p>Управление ролями <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Управление Ролями" data-html="true" data-content="Вы находитесь на странице управления ролями. <br> Выберите пользователя и роль из списков и нажмите кнопку 'Назначить роль' - выбранному пользователю назначится выбранная роль. <br><br> Роли служат для распределения прав. <br> Можно назначать 3 роли: <b>USER(зарегистрированный пользователь) - клиент, обычный пользователь. <br><i>Права: запись на выполнение услуги, просмотр и изменение личных данных, написание отзыва.</i> <br><br>WORKER(работник). <br><i>Права: просмотр услуг, назначенных данному работнику; просмотр и изменение личных данных.</i> <br><br>MASTER(управляющий). <br><i>Права: управление записями на услуги, просмотр и изменение личных данных.</i>"><i class="far fa-question-circle"></i></a></p>
                <p><b><i>${info} ${info2}</i></b></p>
            </div>
            <form action="setRole" method="POST">
                <div class="form-group" align="center">
                    <select style="text-align-last:center;" name="userSetRole">
                        <option value="" disabled selected hidden>Пользователи</option>
                        <c:forEach var="entry" items="${mapUsers}">
                            <option value="${entry.key.id}">Логин: ${entry.key.login} || Роль: ${entry.value}</option> 
                        </c:forEach>
                    </select></div>
                <!--<div class="form-group"><button name="delRoleButton" class="btn btn-danger btn-block" type="submit">Удалить роль</button></div>-->
                <div class="form-group" align="center">
                    <select style="text-align-last:center;" name="roleSetToUser">
                        <option value="" disabled selected hidden>Роли</option>
                        <c:forEach var="role" items="${listRoles}">
                            <option value="${role.id}">Назначить роль: ${role.name}</option>
                        </c:forEach>
                    </select></div>
                <div class="form-group"><button name="setRoleButton" class="btn btn-primary btn-block" type="submit">Назначить роль</button></div>
            </form>
        </div>
    </section>
                




    <jsp:include page="/footer.jsp" />
