<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page contact-us-page dark">

    <section class="clean-block clean-form">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Активация услуг</h2>
                <p>Активируйте услуги <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Активирование услуги" data-html="true" data-content="Вы находитесь на странице активации услуг. <br>Для <b>'активации' услуги нажмите на кнопку <b>'Активировать' у соответствующей услуги в таблице.</b></b>"><i class="far fa-question-circle"></i></a></p>
                <p>${info}</p>
                <a class="button btn btn-outline-primary"  href="addservices"><i class="far fa-arrow-alt-circle-left"></i>Активированные услуги</a>

            </div>
            <div class="table-responsive">
                <table class="table table-hover sortable table-striped" style="margin-bottom: 50px">
                    <thead style="background-color: #5295dc;">
                        <tr>
                            <th scope="col" style="width:80%;">Услуга</th>
                            <th scope="col">Цена</th>
                            <th class="sorttable_nosort" scope="col">Активировать</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="serv" items="${services}">
                            <tr>
                                <td>${serv.name}</td>
                                <td>${serv.price}</td>
                                <td><a title='Активировать' href="activateservice?serv_id=${serv.id}"><i class="fas fa-power-off"></i></a> 
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>

        </div>
    </section>


    <jsp:include page="/footer.jsp" />