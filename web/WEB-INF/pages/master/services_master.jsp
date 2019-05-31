<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/master/header_master.jsp" />

<section class="clean-block slider dark" style="padding-top: 60px">
    <div class="container">
        <div class="block-heading">
            <h2 class="text-info">Услуги</h2>
            <p>Все виды услуг выполняют ученики, будущие специалисты высокого класса, под руководством опытного педагога</p>
        </div>
        <div class="carousel slide" data-ride="carousel" id="carousel-1">
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active"><img class="w-100 d-block" src="assets/img/slider1.jpg" alt="Slide Image"></div>
                <div class="carousel-item"><img class="w-100 d-block" src="assets/img/slider2.jpg" alt="Slide Image"></div>
                <div class="carousel-item"><img class="w-100 d-block" src="assets/img/slider3.jpg" alt="Slide Image"></div>
                <div class="carousel-item"><img class="w-100 d-block" src="assets/img/slider4.jpg" alt="Slide Image"></div>
            </div>
            <div><a class="carousel-control-prev" href="#carousel-1" role="button" data-slide="prev"><span class="carousel-control-prev-icon"></span><span class="sr-only">Previous</span></a><a class="carousel-control-next" href="#carousel-1" role="button"
                                                                                                                                                                                                     data-slide="next"><span class="carousel-control-next-icon"></span><span class="sr-only">Next</span></a></div>
            <ol class="carousel-indicators">
                <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-1" data-slide-to="1"></li>
                <li data-target="#carousel-1" data-slide-to="2"></li>
                <li data-target="#carousel-1" data-slide-to="3"></li>
            </ol>
        </div>
    </div>
</section>

<section class="clean-block features">
    <div class="container">
        <div class="block-heading">
            <h2 class="text-info">Наши услуги</h2>
            <p>Предлагаем следующие услуги:</p>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-5 feature-box"><span class="icon icon-star"></span>
                <h4>Стрижка</h4>
                <p>стрижки мужские, женские и детские</p>
            </div>
            <div class="col-md-5 feature-box"><span class="icon icon-star"></span>
                <h4>Укладка</h4>
                <p>повседневные и вечерние укладки</p>
            </div>
            <div class="col-md-5 feature-box"><span class="icon icon-star"></span>
                <h4>Окрашивание</h4>
                <p>окрашивание, мелирование</p>
            </div>
            <div class="col-md-5 feature-box"><span class="icon icon-star"></span>
                <h4>Химическая завивка</h4>
                <p>химическая завивка волос</p>
            </div>
            <div class="col-md-5 feature-box"><span class="icon icon-star"></span>
                <h4>Уход за волосами</h4>
                <p>профессиональный уход за волосами</p>
            </div>
        </div>
    </div>
</section>
<section class="clean-block clean-pricing dark">
    <div class="container">
        <div class="block-heading">
            <h2 class="text-info">Услуги и цены</h2>

        </div>
        <div class="table-responsive">
            <table class="table table-hover sortable table-striped" style="margin-bottom: 50px">
                <thead style="background-color: #5295dc;">
                    <tr>
                        <th scope="col" style="width:80%;">Услуга</th>
                        <th scope="col">Цена</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="serv" items="${services}">
                        <tr>

                            <td>${serv.name}</td>
                            <td>${serv.price} €</td>

                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</section>
<jsp:include page="/footer.jsp" />
