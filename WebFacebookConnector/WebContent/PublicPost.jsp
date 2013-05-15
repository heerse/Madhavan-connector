<%@page import="com.restfb.exception.FacebookException"%>
<%@page import="com.restfb.exception.FacebookResponseStatusException"%>
<%@page import="com.restfb.exception.FacebookGraphException"%>
<%@page import="com.restfb.exception.FacebookOAuthException"%>
<%@page import="com.restfb.exception.FacebookNetworkException"%>
<%@page import="com.restfb.exception.FacebookJsonMappingException"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.introviz.FqlUser"%>
<%@page import="java.util.List"%>
<%@page import="com.restfb.*"%>
<%@page import="com.restfb.types.Page"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.restfb.types.User"%>
<%@page import="com.restfb.Parameter"%>
<%@page import="com.restfb.types.Post"%>
<%@page import="com.restfb.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.restfb.DefaultFacebookClient"%>
<%@page import="com.restfb.FacebookClient"%>
<%@page import="com.restfb.*"%>
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
try {
String username=request.getParameter("facebookuser");
FacebookClient publicOnlyFacebookClient  = new DefaultFacebookClient("");
Connection<Page> publicSearch = publicOnlyFacebookClient .fetchConnection("Search",Page.class,Parameter.with("q",username),Parameter.with("type","page"));
/*while (publicSearch.iterator().hasNext()){
int i=0;
out.println("Public search: " + publicSearch.getData().get(i).getAbout() +"... ");
i++;
}*/



//String query = "SELECT uid, name FROM user WHERE uid=220439 or uid=7901103";

	String query = "SELECT members, description FROM page WHERE page_id="+username;

//String query ="SELECT message FROM stream WHERE source_id in( SELECT page_id FROM page WHERE page_id="+username +")";

List<FqlUser> users=  publicOnlyFacebookClient.executeFqlQuery(query,FqlUser.class );

out.println("Users: " + users);

}catch (FacebookJsonMappingException e) {
	out.println("Jason Mapping error");
	  // Looks like this API method didn't really return a list of users
	} catch (FacebookNetworkException e) {
	  // An error occurred at the network level
	  out.println("API returned HTTP status code " + e.getHttpStatusCode());
	} catch (FacebookOAuthException e) {
	  // Authentication failed - bad access token?  
		out.println("Authorization failed!");
	} catch (FacebookGraphException e) {
	  // The Graph API returned a specific error
	  out.println("Call failed. API says: " + e.getErrorMessage());
	} catch (FacebookResponseStatusException e) {
	  // Old-style Facebook error response.
	  // The Graph API only throws these when FQL calls fail.
	  // You'll see this exception more if you use the Old REST API
	  // via LegacyFacebookClient.
	  out.println("Resonse status exception!");
	  if (e.getErrorCode() == 200)
	    out.println("Permission denied!");
	} catch (FacebookException e) {
		out.println("Facebook Exception");
	  // This is the catchall handler for any kind of Facebook exception

	}
/*FileOutputStream fos = new FileOutputStream("F:\\Java\\Facebook files\\Sample.txt", true);

fos.write((publicSearch.getData().get(0).getMessage().getBytes()));*/
//fors.write((user.getPhone() + "|" + user.getCompany() + "|" + user.getWebinar() + "|" + user.getDate()).getBytes());

/*FacebookClient facebookClient = new DefaultFacebookClient("");
User user = facebookClient.fetchObject("me", User.class);
out.println("User name: " + user.getName());*/
	
%>

</body>
</html>