<%@ page import="model.UserDTO" %>
<%@ page import="connector.MysqlConnector" %>
<%@ page import="controller.UserController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    UserDTO userDTO = new UserDTO();
    userDTO.setUsername(username);
    userDTO.setPassword(password);

    MysqlConnector connector = new MysqlConnector();
    UserController userController = new UserController(connector);

    UserDTO result = userController.auth(userDTO);


    if(result != null) {
        // 로그인 성공
        // 현재 로그인을 성공한 정보를 어디서든 불러올 수 있는 곳에 저장한다.
        session.setAttribute("logIn", result);
        // 게시판으로 이동한다.
        // 우리가 특정 JSP 페이지에서 다른 페이지로 강제로 이동시킬 때에는
        // response.sendRedirect("위치") 를 사용하게 된다.
        // 단, sendRedirect 이후에 다른 sendRedirect()를 실행시킬 수 없다.
        response.sendRedirect("/board/showList.jsp");

    } else {
        // 로그인 실패
        // 인덱스 화면으로 이동한다.
        response.sendRedirect("/");
    }
%>


</body>
</html>
