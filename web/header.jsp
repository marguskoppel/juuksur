

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en-GB">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JuukslaIVKHK</title>
        
        
       <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">-->

        <!-- for FF, Chrome, Opera -->
        <link rel="icon" type="image/png" href="/assets/favicons/favicon-16x16.png" sizes="16x16">
        <link rel="icon" type="image/png" href="/assets/favicons/favicon-32x32.png" sizes="32x32">

        <!-- for IE -->
        <link rel="icon" type="image/x-icon" href="/assets/favicons/favicon.ico" >
        <link rel="shortcut icon" type="image/x-icon" href="/assets/favicons/favicon.ico"/>

        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Barrio">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Berkshire+Swash">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bevan">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=BioRhyme">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=BioRhyme+Expanded">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bubblegum+Sans">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Caesar+Dressing">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Chau+Philomene+One">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Delius+Unicase">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <script src="assets/js/sorttable.js"></script>
        <!--<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">




        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap2.min.css">
        
        <script type="text/javascript" language="javascript" src="https:////cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
        <script type="text/javascript" language="javascript" src="https:////cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>
        
        <link rel="stylesheet" href="assets/bootstrap/css/style.css">
        <script type="text/javascript" class="init" src="assets/js/style.js"></script>

    </head>
    <body>

        <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar" id="my_navbar">
            <div class="container"><a class="navbar-brand logo" href="index"><img width="30" height="30" class="d-inline-block align-top" src="assets/img/logo.png">JuukslaIVKHK</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse"
                     id="navcol-1">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item" role="presentation" ><a class="nav-link" href="services">Услуги</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="addappointment" >Запись к мастеру</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="contact" >Контакты</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="loginpage" ><i class="fas fa-sign-in-alt"></i> Вход</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="registration" ><i class="far fa-user"></i> Регистрация</a></li>
                    </ul>
                </div>
            </div>
        </nav>
