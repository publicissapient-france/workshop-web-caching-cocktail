<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.*" %>
<!-- <%=new java.sql.Timestamp(System.currentTimeMillis())%> -->
<!-- <%=System.currentTimeMillis()%> -->

<%@page import="java.net.InetAddress" %>
<%@page import="java.util.Map.Entry" %>
<%@ page import="com.google.common.collect.Lists" %>
<HTML>
<HEAD>
    <TITLE>Servlet's information</TITLE>
</HEAD>
<BODY>
<h1>Request information</h1>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Value</th>
    </tr>
    <tr>
        <td>Protocol</td>
        <td><%=request.getProtocol()%>
        </td>
    </tr>
    <tr>
        <td>ContentType</td>
        <td><%=request.getContentType()%>
        </td>
    </tr>
    <tr>
        <td>RemoteAddr</td>
        <td><%=request.getRemoteAddr()%>
        </td>
    </tr>
    <tr>
        <td>RemoteHost</td>
        <td><%=request.getRemoteHost()%>
        </td>
    </tr>
    <tr>
        <td>Scheme</td>
        <td><%=request.getScheme()%>
        </td>
    </tr>
    <tr>
        <td>ServerName</td>
        <td><%=request.getServerName()%>
        </td>
    </tr>
    <tr>
        <td>ServerPort</td>
        <td><%=request.getServerPort()%>
        </td>
    </tr>
    <tr>
        <th colspan="2">Http request information</th>
    </tr>
    <tr>
        <th>Name</th>
        <th>Value</th>
    </tr>
    <tr>
        <td>AuthType</td>
        <td><%=request.getAuthType()%>
        </td>
    </tr>
    <tr>
        <td>ContextPath</td>
        <td><%=request.getContextPath()%>
        </td>
    </tr>
    <tr>
        <td>Method</td>
        <td><%=request.getMethod()%>
        </td>
    </tr>
    <tr>
        <td>PathInfo</td>
        <td><%=request.getPathInfo()%>
        </td>
    </tr>
    <tr>
        <td>PathTranslated</td>
        <td><%=request.getPathTranslated()%>
        </td>
    </tr>
    <tr>
        <td>QueryString</td>
        <td><%=request.getQueryString()%>
        </td>
    </tr>
    <tr>
        <td>RemoteUser</td>
        <td><%=request.getRemoteUser()%>
        </td>
    </tr>
    <tr>
        <td>RequestedSessionId</td>
        <td><%=request.getRequestedSessionId()%>
        </td>
    </tr>
    <tr>
        <td>RequestURI</td>
        <td><%=request.getRequestURI()%>
        </td>
    </tr>
    <tr>
        <td>RequestURL</td>
        <td><%=request.getRequestURL()%>
        </td>
    </tr>
    <tr>
        <td>ServletPath</td>
        <td><%=request.getServletPath()%>
        </td>
    </tr>
    <tr>
        <td>ServerName</td>
        <td><%=request.getServerName()%>
        </td>
    </tr>
    <tr>
        <td>ServerPort</td>
        <td><%=request.getServerPort()%>
        </td>
    </tr>
    <tr>
        <td>ServletPath</td>
        <td><%=request.getServletPath()%>
        </td>
    </tr>
    <tr>
        <td>isRequestedSessionIdFromCookie</td>
        <td><%=request.isRequestedSessionIdFromCookie()%>
        </td>
    </tr>
    <tr>
        <td>isRequestedSessionIdFromURL</td>
        <td><%=request.isRequestedSessionIdFromURL()%>
        </td>
    </tr>
    <tr>
        <td>isRequestedSessionIdValid</td>
        <td><%=request.isRequestedSessionIdValid()%>
        </td>
    </tr>
    <tr>
        <td>isSecure</td>
        <td><%=request.isSecure()%>
        </td>
    </tr>
</table>
<br>

<h1>Request headers</h1>
<table border='1'>
    <%
        out.println("<tr><th>Name</th><th>Value</th></tr>");
        Enumeration<?> headers = request.getHeaderNames();
        while (headers.hasMoreElements()) {
            String header = (String) headers.nextElement();
            out.println("<tr><td>" + header + "</td><td>" + request.getHeader(header) + "</td></tr>");
        }

        out.println("</table>");
    %>
</table>

<h1>Request cookies</h1>
<%
    out.println("<table border='1'>");
    out.println("<tr><th>Name</th><th>Value</th></tr>");
    Cookie[] cookies = request.getCookies();
    if (null != cookies) {
        for (Cookie cookie : cookies) {
            out.println("<tr><td>" + cookie.getName() + "</td><td>" + cookie.getValue() + "</td></tr>");
        }
    }
    out.println("</table>");
%>
<br>

<h1>Request attributes</h1>
<%
    out.println("<table border='1'>");
    out.println("<tr><th>Name</th><th>Value</th></tr>");
    List<String> attributeNames = Collections.list((Enumeration<String>) request.getAttributeNames());
    Collections.sort(attributeNames);
    for (String attribute : attributeNames) {
        out.println("<tr><td>" + attribute + "</td><td>" + request.getAttribute(attribute) + "</td></tr>");
    }
    out.println("</table>");
%>

<h1>Request parameters</h1>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Value</th>
        <th># of values</th>
    </tr>
    <%
        for (String parameter : Collections.list((Enumeration<String>) request.getParameterNames())) {
    %>
    <tr>
        <td><%=parameter%>
        </td>
        <td><%=request.getParameter(parameter)%>
        </td>
        <td><%=request.getParameterValues(parameter).length%>
        </td>
    </tr>
    <%
        }
    %>
</table>

<br>

<h1>Session information</h1>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Value</th>
    </tr>
    <tr>
        <td>MaxInactiveInterval (min)</td>
        <td><%=(session.getMaxInactiveInterval() / 60)%>
        </td>
    </tr>
    <tr>
        <td>ID</td>
        <td><%=session.getId()%>
        </td>
    </tr>
    <tr>
        <td>LastAccessedTime</td>
        <td><%=new Date(session.getLastAccessedTime())%>
        </td>
    </tr>
</table>
<h2>Attributes</h2>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Value</th>
    </tr>
    <%
        for (String attribute : Collections.list((Enumeration<String>) session.getAttributeNames())) {
            out.println("<tr><td>" + attribute + "</td><td>" + session.getAttribute(attribute) + "</td></tr>");
        }
    %>
</table>
<br>

<h1>Application information</h1>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Value</th>
    </tr>
    <tr>
        <td>ServletContextName</td>
        <td><%=application.getServletContextName()%>
        </td>
    </tr>
    <tr>
        <td>MajorVersion</td>
        <td><%=application.getMajorVersion()%>
        </td>
    </tr>
    <tr>
        <td>MinorVersion</td>
        <td><%=application.getMinorVersion()%>
        </td>
    </tr>
    <tr>
        <td>ServerInfo</td>
        <td><%=application.getServerInfo()%>
        </td>
    </tr>
    <tr>
        <td>ResourceUrlForSlash</td>
        <td><%=application.getResource("/")%>
        </td>
    </tr>
</table>
<br/>

<h1>InitialContext</h1>
<%
    try {
        InitialContext initialContext = new InitialContext(new Properties());
%>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Value</th>
    </tr>
    <tr>
        <td>initialContext.nameInNamespace</td>
        <td><%=initialContext.getNameInNamespace()%>
        </td>
    </tr>
</table>
<%
    } catch (Throwable e) {
        out.write("<pre>");
        PrintWriter printWriter = new PrintWriter(out);
        e.printStackTrace(printWriter);
        out.write("</pre>");
        printWriter.close();
    }
%>
<h1>System information</h1>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Value</th>
    </tr>
    <tr>
        <td>Working directory</td>
        <td><%=new java.io.File(".").getAbsolutePath()%>
        </td>
    </tr>

    <%
        InetAddress localhost = InetAddress.getLocalHost();
    %>
    <tr>
        <td>InetAddress.getLocalHost()</td>
        <td><%=localhost.getHostName() + ", " + localhost.getCanonicalHostName() + ", " + localhost.getHostAddress()%>
        </td>
    </tr>
    <tr>
        <td>InetAddress.getAllByName(null)</td>
        <td>
            <%
                for (InetAddress address : InetAddress.getAllByName(null)) {
                    out.println(address.getHostName() + ", " + address.getCanonicalHostName() + ", " + address.getHostAddress() + "<br/>");
                }
            %>
        </td>
    </tr>
</table>
<br>

<h1>Memory</h1>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Value</th>
    </tr>
    <tr>
        <td>Total Memory</td>
        <td><%=Runtime.getRuntime().totalMemory()%>
        </td>
    </tr>
    <tr>
        <td>Free Memory</td>
        <td><%=Runtime.getRuntime().freeMemory()%>
        </td>
    </tr>

</table>
</BODY>
</HTML>

