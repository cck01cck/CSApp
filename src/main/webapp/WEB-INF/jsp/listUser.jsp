<!DOCTYPE html>
<html>
<style>
    #customers {
        font-family: Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 80%;
    }

    #customers td, #customers th {
        border: 1px solid #ddd;
        padding: 8px;
    }

    #customers tr:nth-child(even){background-color: #f2f2f2;}

    #customers tr:hover {background-color: #ddd;}

    #customers th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color: #04AA6D;
        color: white;
    }
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<head><title>User Management</title></head>
<body>
<div class="w3-top">
    <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
        <a href="${pageContext.request.contextPath}/ticket/list" class="w3-bar-item w3-button">Photo Blog</a>
        <!-- Right-sided navbar links. Hide them on small screens -->

        <div class="w3-right w3-hide-small">
            <a href="<c:url value="/user/create" />" class="w3-bar-item w3-button">Create a User</a>
            <a href="<c:url value="/ticket" />" class="w3-bar-item w3-button">Return to list tickets</a>
            <a href="#" class="w3-bar-item w3-button"><c:url var="logoutUrl" value="/logout"/>
                <form action="${logoutUrl}" method="post">
                    <input type="submit" value="Log out" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form></a>
        </div>
    </div>
</div>

<br/><br/>


<h2>Users</h2>

<br/><br/>

<c:choose>
    <c:when test="${fn:length(ticketUsers) == 0}">
        <i>There are no users in the system.</i>
    </c:when>
    <c:otherwise>
<center>
        <table id="customers" >
            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Roles</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${ticketUsers}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>${fn:substringAfter(user.password, '{noop}')}</td>
                    <td>
                        <c:forEach items="${user.roles}" var="role" varStatus="status">
                            <c:if test="${!status.first}">, </c:if>
                            ${role.role}
                        </c:forEach>
                    </td>
                    <td>
                        [<a href="<c:url value="/user/delete/${user.username}" />">Delete</a>]
                        [<a href="<c:url value="/user/edit/${user.username}" />">Edit</a>]
                    </td>
                </tr>
            </c:forEach>
        </table>
    </center>
    </c:otherwise>
</c:choose>
</body>
</html>
