<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>인덱스</title>
</head>
<body>
<form action="/user/auth.jsp" method="post">
    아이디: <input type ="text" name="username"> <br/>
    비밀번호: <input type="password" name="password"> <br/>
    <hr>
    <input type="submit" value="로그인">

</form>
<hr>
<a href="/user/register.jsp">회원 가입하기</a>
</body>
</html>
