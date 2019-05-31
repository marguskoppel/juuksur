

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />

<main class="page landing-page">
    <section class="clean-block clean-hero" style="background-image:url(&quot;assets/img/index_bg.jpg&quot;);color:rgba(9, 162, 255, 0.85);">
        <div class="text">
            
            <h2>Ваша красота - наше призвание!</h2>
            <p>В Ида-Вирумааском центре профессионального образования открыт парикмахерский салон.</p><button  class="btn btn-outline-light btn-lg" type="button"><a href="services">К нашим услугам</a></button></div>
    </section>


    <section class="clean-block about-us">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Что Мы можем Вам предложить?</h2>
                <p>Наш салон может предложить вам следующие услуги:</p>
            </div>
            <div id="box_services" class="row justify-content-center" style="padding-bottom: 30px">
                <div id="boxes" class="col-sm-6 col-lg-4">
                    <div class="card clean-card text-center"><img class="card-img-top w-100 d-block" src="assets/img/avatars/avatar6.jpg">
                        <div class="card-body info">
                            <h4 class="card-title">Стрижка</h4>
                            <p class="card-text">Мужские, женские, а также детские стрижки</p>

                        </div>
                    </div>
                </div>
                <div id="boxes" class="col-sm-6 col-lg-4">
                    <div class="card clean-card text-center"><img class="card-img-top w-100 d-block" src="assets/img/avatars/avatar5.jpg">
                        <div class="card-body info">
                            <h4 class="card-title">Укладка</h4>
                            <p class="card-text">Делаем повседневные и вечерние укладки</p>

                        </div>
                    </div>
                </div>
                <div id="boxes" class="col-sm-6 col-lg-4">
                    <div class="card clean-card text-center"><img class="card-img-top w-100 d-block" src="assets/img/avatars/avatar3.jpg">
                        <div class="card-body info">
                            <h4 class="card-title">Окрашивание</h4>
                            <p class="card-text">Мелирование и окрашивание волос</p>

                        </div>
                    </div>
                </div>

            </div>
            <div id="box_services" class="row justify-content-center">
                <div id="boxes" class="col-sm-6 col-lg-4">
                    <div class="card clean-card text-center"><img class="card-img-top w-100 d-block" src="assets/img/avatars/avatar4.jpg">
                        <div class="card-body info">
                            <h4 class="card-title">Химическая завивка</h4>
                            <p class="card-text">Делаем химическую завивку волос</p>

                        </div>
                    </div>
                </div>
                <div id="boxes" class="col-sm-6 col-lg-4">
                    <div class="card clean-card text-center"><img class="card-img-top w-100 d-block" src="assets/img/avatars/avatar8.jpg">
                        <div class="card-body info">
                            <h4 class="card-title">Уход за волосами</h4>
                            <p class="card-text">Предлагаем профессиональный уход за волосами</p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp" />

