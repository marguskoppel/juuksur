<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page contact-us-page">



    <section class="clean-block clean-pricing dark">
        <div class="container">
            <div class="block-heading">

                <h2 class="text-info">Данные пользователей</h2>


                <p>Управление пользователями <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Управление пользователями" data-html="true" data-content="Вы находитесь на странице управления пользователями. <br>На данной странице можно посмотреть и <b>изменить</b> данные пользователей. Также можно <b>деактивировать</b> аккаунт пользователя.<br><br>Для редактирования данных пользователя, нажмите на кнопку <b>'Изменить'</b> у соответствующего пользователя.<br> Для деактивации аккаунта, нажмите на кнопку <b>'Деактивировать'</b> у соответствующего пользователя.<br><br><b>Деактивированные пользователи</b><br>Посмотреть список можно нажав на кнопку <b>'Деактивированные пользователи'.</b> Там же можно обратно <b>'активировать' аккаунт. Деактивированный пользователь <b>не сможет авторизироваться</b> на сайте."><i class="far fa-question-circle"></i></a></p>
                <p><b><i>${info} ${info2}</i></b></p>
                <a class="button btn btn-outline-primary"  href="user_notactive"><i class="far fa-share-square"></i>Деактивированные пользователи</a>
                <h2 class="text-info">Мастерa</h2>
            </div>
            <div class="table-responsive">
                <table id="users_admin" class="table table-hover display table-striped" style="margin-bottom: 50px">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col">Логин</th>
                            <th scope="col">Данные пользователь</th>
                            <th class="sorttable_nosort" scope="col">Роль</th>
                            <th class="sorttable_nosort" scope="col">Управление</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="master" items="${listMasters}">
                            <tr>

                                <td>${master.user.login}</td>
                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${master.user.name} ${master.user.surname}</b> <br><br> Телефон: <b>${master.user.phone}</b><br><br> Е-майл: <b>${master.user.email}</b>">${master.user.name} ${master.user.surname}</a></td>
                                <td>${master.role.name}</td>

                                <td><a title='Изменение' href="edituser?user_id=${master.user.id}"><i class="fas fa-edit"></i></a> <a title='Деактивирование' href="deleteuser?user_id=${master.user.id}"><i class="far fa-trash-alt"></i></a></td>

                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>



    <section class="clean-block clean-pricing">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Работники</h2>


            </div>
            <div class="table-responsive">
                <table id="users_admin2" class="table table-hover display table-striped" style="margin-bottom: 50px">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col">Логин</th>
                            <th scope="col">Данные пользователь</th>
                            <th class="sorttable_nosort" scope="col">Роль</th>
                            <th class="sorttable_nosort" scope="col">Управление</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="worker" items="${listWorkers}">
                            <tr>

                                <td>${worker.user.login}</td>
                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${worker.user.name} ${worker.user.surname}</b> <br><br> Телефон: <b>${worker.user.phone}</b><br><br> Е-майл: <b>${worker.user.email}</b>">${worker.user.name} ${worker.user.surname}</a></td>
                                <td>${worker.role.name}</td>

                                <td><a title='Изменение' href="edituser?user_id=${worker.user.id}"><i class="fas fa-edit"></i></a> <a title='Деактивирование' href="deleteuser?user_id=${worker.user.id}"><i class="far fa-trash-alt"></i></a></td>

                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <section class="clean-block clean-pricing dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Пользователи</h2>


            </div>
            <div class="table-responsive">
                <table id="users_admin3" class="table table-hover display table-striped" style="margin-bottom: 50px">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col">Логин</th>
                            <th scope="col">Данные пользователь</th>
                            <th class="sorttable_nosort" scope="col">Роль</th>
                            <th class="sorttable_nosort" scope="col">Управление</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${listUsers2}">
                            <tr>

                                <td>${user.user.login}</td>
                                <td><a tabindex="0" data-toggle="popover" data-trigger="focus" title="Работник" data-html="true" data-content="Имя/Фамилия: <b>${user.user.name} ${user.user.surname}</b> <br><br> Телефон: <b>${user.user.phone}</b><br><br> Е-майл: <b>${user.user.email}</b>">${user.user.name} ${user.user.surname}</a></td>
                                <td>${user.role.name}</td>

                                <td><a title='Изменение' href="edituser?user_id=${user.user.id}"><i class="fas fa-edit"></i></a> <a title='Деактивирование' href="deleteuser?user_id=${user.user.id}"><i class="far fa-trash-alt"></i></a></td>

                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>




    <jsp:include page="/footer.jsp" />
