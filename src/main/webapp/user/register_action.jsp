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
        String nickname = request.getParameter("nickname");

        UserDTO attempt = new UserDTO();
        attempt.setUsername(username);
        attempt.setPassword(password);
        attempt.setNickname(nickname);

        MysqlConnector connector = new MysqlConnector();
        UserController userController = new UserController(connector);

        boolean result = userController.register(attempt);

        if(result) {
                response.sendRedirect("/");
        } else {
                response.sendRedirect("/error/showError.jsp?code=duplicated");
        }
%>
</body>
</html>
