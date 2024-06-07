<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 24. 6. 7.
  Time: 오후 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 추가</title>
</head>
<body>
<h1>
    게시글 추가 페이지
</h1>
<form action="/board/showInsert_action.jsp" method="post">
    게시글 제목: <input type ="text" name="title"> <br/>
    게시글 내용: <input type ="text" name="context"> <br/>
    작성자 : <input type = "number" name="writer_id"> <br/>
    <input type="submit" value="게시글 추가">
</form>

</body>
</html>
