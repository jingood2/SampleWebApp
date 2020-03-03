<%
out.println("was1 sessionid : "+request.getRequestSessionId());
session.setAttribute("userid","honggildong");
out.println("tomcat set session userid :: "+session.getAttribute("userid"));
%>
