<%@ page import="connector.MysqlConnector" %>
<%@ page import="controller.BoardController" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.UserDTO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>게시글 목록보기</title>
</head>
<body>
<%
    UserDTO logIn = (UserDTO) session.getAttribute("logIn");

    MysqlConnector connector = new MysqlConnector();
    BoardController boardController = new BoardController(connector);
    ArrayList<BoardDTO> list = boardController.selectAll();
%>
<form action="showInsert.jsp" method="post">
    <input type="submit" value="게시글추가">

</form>
<table>
    <tr>
        <td>글 번호</td>
        <td> 제목 </td>
        <td> 작성자 </td>
        <td> 작성일 </td>
    </tr>
    <%

    for(BoardDTO b : list) {

    %>
    <tr>
        <td><%=b.getId()%>
        </td>
        <td>
            <a href="/board/showOne.jsp?id=<%=b.getId()%>"><%=b.getTitle()%>
            </a>
            <a href="/board/showInsert_action.jsp<%=b.getId()%>"><%=b.getContent()%>
            </a>
        </td>
        <td><%=b.getNickname()%>
        </td>
        <td><%=b.getEntrydate()%>
        </td>
    </tr>
    <%
        }
    %>


</table>

</body>
</html>
