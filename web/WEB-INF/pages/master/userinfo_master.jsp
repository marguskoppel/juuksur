<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/pages/master/header_master.jsp" />
<main class="page contact-us-page">
    
    <section class="clean-block clean-pricing">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Личные данные</h2>
                <p> Просмотр и изменение личных данных <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Изменение личных данных" data-html="true" data-content="Вы находитесь на странице управления личными данными. <br><br>Изменить личные данные можно нажав на кнопку <b>'Изменить'</b>"><i class="far fa-question-circle"></i></a></p>
                <p><b><i>${info} ${info2}</i></b></p>

            </div>
            <div class="table-responsive">
                <table class="table table-hover" style="margin-bottom: 50px">
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
                                <td><a href="userinfoedit?eu=${userinfo.id}"><i class="far fa-edit"></i></a></td>

                            </tr>
                        
                        
                    </tbody>
                </table>
            </div>
        </div>
    </section>


    <jsp:include page="/footer.jsp" />
