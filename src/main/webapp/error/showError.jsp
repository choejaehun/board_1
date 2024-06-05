<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 24. 6. 5.
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>에러</title>
</head>
<body>
<%
    String errorCode = request.getParameter("code");

    String message = "";

    if(errorCode.equalsIgnoreCase("duplicated")) {
        message = "중복된 아이디로는 가입하실 수 없습니다.";
    }
%>
<h1>
    <%=message%>
</h1>
<a href="/">인덱스 화면으로</a>
</body>
</html>
