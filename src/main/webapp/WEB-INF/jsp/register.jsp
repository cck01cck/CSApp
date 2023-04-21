<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
        <title><spring:message code="label.title"/></title>
        <style>@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
        *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
        }
        html,body{
                display: grid;
                height: 100%;
                width: 100%;
                place-items: center;
                background: #f2f2f2;
                /* background: linear-gradient(-135deg, #c850c0, #4158d0); */
        }
        ::selection{
                background: #4158d0;
                color: #fff;
        }
        .wrapper{
                width: 380px;
                background: #fff;
                border-radius: 15px;
                box-shadow: 0px 15px 20px rgba(0,0,0,0.1);
        }
        .wrapper .title{
                font-size: 35px;
                font-weight: 600;
                text-align: center;
                line-height: 100px;
                color: #fff;
                user-select: none;
                border-radius: 15px 15px 0 0;
                background: linear-gradient(-135deg, #c850c0, #4158d0);
        }
        .wrapper form{
                padding: 10px 30px 50px 30px;
        }
        .wrapper form .field{
                height: 50px;
                width: 100%;
                margin-top: 20px;
                position: relative;
        }
        .wrapper form .field input{
                height: 100%;
                width: 100%;
                outline: none;
                font-size: 17px;
                padding-left: 20px;
                border: 1px solid lightgrey;
                border-radius: 25px;
                transition: all 0.3s ease;
        }
        .wrapper form .field input:focus,
        form .field input:valid{
                border-color: #4158d0;
        }
        .wrapper form .field label{
                position: absolute;
                top: 50%;
                left: 20px;
                color: #999999;
                font-weight: 400;
                font-size: 17px;
                pointer-events: none;
                transform: translateY(-50%);
                transition: all 0.3s ease;
        }
        form .field input:focus ~ label,
        form .field input:valid ~ label{
                top: 0%;
                font-size: 16px;
                color: #4158d0;
                background: #fff;
                transform: translateY(-50%);
        }
        form .content{
                display: flex;
                width: 100%;
                height: 50px;
                font-size: 16px;
                align-items: center;
                justify-content: space-around;
        }
        form .content .checkbox{
                display: flex;
                align-items: center;
                justify-content: center;
        }
        form .content input{
                width: 15px;
                height: 15px;
                background: red;
        }
        form .content label{
                color: #262626;
                user-select: none;
                padding-left: 5px;
        }
        form .content .pass-link{
                color: "";
        }
        form .field input[type="submit"]{
                color: #fff;
                border: none;
                padding-left: 0;
                margin-top: -10px;
                font-size: 20px;
                font-weight: 500;
                cursor: pointer;
                background: linear-gradient(-135deg, #c850c0, #4158d0);
                transition: all 0.3s ease;
        }
        form .field input[type="submit"]:active{
                transform: scale(0.95);
        }
        form .signup-link{
                color: #262626;
                margin-top: 20px;
                text-align: center;
        }
        form .pass-link a,
        form .signup-link a{
                color: #4158d0;
                text-decoration: none;
        }
        form .pass-link a:hover,
        form .signup-link a:hover{
                text-decoration: underline;
        }
        .navbar {
                overflow: hidden;
                background-color: #333;
        }
        .navbar a {
                float: left;
                font-size: 16px;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
        }
        .dropdown {
                float: left;
                overflow: hidden;
        }
        .dropdown .dropbtn {
                font-size: 16px;
                border: none;
                outline: none;
                color: white;
                padding: 14px 16px;
                background-color: inherit;
                font-family: inherit;
                margin: 0;
        }
        .navbar a:hover, .dropdown:hover .dropbtn {
                background-color: red;
        }
        .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
        }
        .dropdown-content a {
                float: none;
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                text-align: left;
        }
        .dropdown-content a:hover {
                background-color: #ddd;
        }
        .dropdown:hover .dropdown-content {
                display: block;
        }
        </style>
</head>
<body>

<div class="navbar">
        <a href="#home"><spring:message code="label.MainPage"/></a>
        <a href="#news"><spring:message code="label.LoginPage"/></a>
        <div class="dropdown">
                <button class="dropbtn"><spring:message code="label.language"/>
                        <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/register?lang=en">English</a>
                        <a href="${pageContext.request.contextPath}/register?lang=fr">France</a>
                        <a href="${pageContext.request.contextPath}/register?lang=zh_TW">Chinese Traditional</a>
                </div>
        </div>
</div>
<c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
</c:if>

<c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
</c:if>

<div class="wrapper">
        <div class="title"><spring:message code="label.Register"/></div>
<form name="register2" method="GET" action="register2">
        <div class="form-group"><div class="field">

                <input type="text" class="form-control" id="username" name="username">
                <label for="username"><spring:message code="label.userName"/></label>
        </div>
        </div>
        <div class="form-group"><div class="field">

                <input type="text" class="form-control" id="email" name="email">
                <label for="email">Email</label>
        </div>
        </div>
        <div class="form-group"><div class="field">

                <input type="text" class="form-control" id="description" name="description">
                <label for="description"><spring:message code="label.description"/></label>
        </div>
        </div>
        <div class="form-group"><div class="field">

                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
                <label for="phoneNumber"><spring:message code="label.phoneNumber"/></label>
        </div>
        </div>
        <div class="form-group"><div class="field">

                <input type="password" class="form-control" id="password" name="password">
                <label for="password"><spring:message code="label.password"/></label>
        </div></div>
        <div class="field">
                <input type="submit" value=<spring:message code="label.Register"/>>
        </div>
</form>
</div>
</body>
</html>