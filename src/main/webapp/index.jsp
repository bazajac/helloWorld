<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <title>SDA</title>
    </head>
<body>

<c:set value="10" var="counter"/>
<c:out value="${counter}"/>

<c:forEach begin="1" end="10">
    ${counter = counter + 1}<br/>
</c:forEach>
    <h1>
        <% out.print("Hello World!");%>
        <%= request.getParameter("test")%>
    </h1>
    <h1>
        <%@include file="footer.jsp"%>
    </h1>
    <%!
        private long visitCount = 0;
    %>
    <h2>
        Visits: <%= ++ visitCount%>
    </h2>

<c:set var="books">
    <books>
        <book>
            <name>Wiedzmin</name>
            <author>Andrzej Sapkowski</author>
            <price>200</price>
        </book>
        <book>
            <name>Red Rising</name>
            <author>Pierce Brown</author>
            <price>300</price>
        </book>
    </books>
</c:set>

<x:parse xml="${books}" var="output"/>
<x:forEach select="$output//book" var="item">
<x:if select="$item//price=200">
    <p>Price = 200</p>
</x:if>
<x:choose>
    <x:when select="$item/author = 'Andrzej Sapkowski'">
        <p>Andrzej</p>
    </x:when>
    <x:otherwise>
        <p>Nie Andrzej</p>
    </x:otherwise>
</x:choose>
</x:forEach>

<form action="hello" method="POST">
    First name: <input type="text" name="firstname" /><br>
    Last name: <input type="text" name="lastname" /><br>
    <input type="submit" value="Submit">
</form>

</body>
</html>