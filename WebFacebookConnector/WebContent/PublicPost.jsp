<%@page import="java.io.FileOutputStream"%>
<%@page import="com.restfb.types.User"%>
<%@page import="com.restfb.Parameter"%>
<%@page import="com.restfb.types.Post"%>
<%@page import="com.restfb.Connection"%>
<%@page import="com.restfb.DefaultFacebookClient"%>
<%@page import="com.restfb.FacebookClient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Public Post of the user</title>
</head>
<h2>
Following are the public post of the user
</h2>
<body>
<%
String username=request.getParameter("facebookuser");
FacebookClient publicOnlyFacebookClient  = new DefaultFacebookClient();
Connection<Post> publicSearch = publicOnlyFacebookClient .fetchConnection("Search",Post.class,Parameter.with("q",username),Parameter.with("type","post"));
out.println("Public search: " + publicSearch.getData().get(0).getLikesCount());

/*FileOutputStream fos = new FileOutputStream("F:\\Java\\Facebook files\\Sample.txt", true);

fos.write((publicSearch.getData().get(0).getMessage().getBytes()));*/
//fors.write((user.getPhone() + "|" + user.getCompany() + "|" + user.getWebinar() + "|" + user.getDate()).getBytes());

/*FacebookClient facebookClient = new DefaultFacebookClient("");
User user = facebookClient.fetchObject("me", User.class);
out.println("User name: " + user.getName());*/

%>

</body>
</html>