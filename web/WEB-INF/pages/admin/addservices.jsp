<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/admin/header_admin.jsp" />
<main class="page contact-us-page">

    <section class="clean-block clean-form dark">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Добавление услуги</h2>
                <p>Введите название услуги и цену <a tabindex="0" data-toggle="popover" data-trigger="focus" title="Добавление, деактивирование и изменение услуг" data-html="true" data-content="Вы находитесь на странице управления услугами. <br>На данной странице можно добавить новую услугу. Также можно <b>изменить</b> данные услуги, и <b>'деактивировать' услугу.</b>.<br><br>Для добавление услуги введите название и назначте цену, и нажмите на кнопку <b>'Добавить'. Добавленная услуга появиться в таблице ниже. Если добавляемая услуга уже существует(названия совпадают), то новая услуга не добавиться. Вы увидите сообщение об этом.</b><br><br>Для <b>изменения</b> данных услуги(название и цена), надмите на кнопку <b>'Изменить'.</b> На новой странице измените название или цену.<br><br><b>Деактивированные услуги.</b><br>Деактивированные услуги <b>не будут</b> показываться на странице 'услуг'. Также <b>нельзя записаться</b> на деактивированную услугу.<br>Для <b>'деактивации'</b> услуги нажмите на кнопку деактивировать у соответствующей услуги в таблице.<br>ПОсмотреть список деактивированных услуг можно нажав на кнопку <b>'Деактивированные услуги'.</b> Тамже можно активировать услугу."><i class="far fa-question-circle"></i></a></p>
                <p><b><i>${info} ${info2}</i></b></p>


            </div>
            <form action="addnewservice" method="POST">
                <div class="form-group"><label for="new-service">Новая услуга</label><input class="form-control" size="65" type="text" name="newservice" id="new-service" value="" required="" /></div>

                <div class="form-group"><label for="service-price">Цена услуги</label><input class="form-control" size="65" type="number" step="0.01" max="100" name="price" id="service-price" value="0.05" required=""/></div>
                <div class="form-group"><button class="btn btn-primary btn-block" type="submit">Добавить</button></div>
            </form>
        </div>
    </section>
    <section class="clean-block clean-pricing">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Услуги и цены</h2>
                <p>${info2}</p>
                <a class="button btn btn-outline-primary"  href="cat_serv_notactive"><i class="far fa-share-square"></i>Деактивированные услуги</a>

            </div>

            <table id="addbewservice_admin" class="display table table-hover table-striped" style="margin-bottom: 50px">
                <thead style="background-color: #5295dc;">
                    <tr>
                        <th scope="col">Услига</th>
                        <th scope="col">Цена</th>
                        <th class="sorttable_nosort" scope="col" style="width:28%;">Управление</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="serv" items="${services}">
                        <tr>

                            <td>${serv.name}</td>
                            <td>${serv.price} €</td><!---->
                            <td><a title='Изменить' href="editservice?serv_id=${serv.id}"><button type="button" class="btn btn-outline-primary btn-sm"><i class="fas fa-edit"></i>Изменить</button></a> <a title='Деактивировать' href="deleteservice?serv_id=${serv.id}"><button type="button" class="btn btn-outline-danger btn-sm"><i class="far fa-trash-alt"></i>Деактивировать</button></a></td>

                        </tr>
                    </c:forEach>

                </tbody>
            </table>

        </div>
    </section>

    <jsp:include page="/footer.jsp" />