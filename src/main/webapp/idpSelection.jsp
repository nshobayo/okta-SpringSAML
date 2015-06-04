<%--
/* -*- coding: utf-8 -*-
 * Copyright 2015 Okta, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
--%>

<%@ page import="org.springframework.security.saml.metadata.MetadataManager" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="java.util.Set" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr"> 
    <!--Head--> 
    <jsp:include page="/Header/head.jsp" />
    <body style="padding-top: 60px">
        <!-- Navbar --> 
        <jsp:include page="/Header/navigation.jsp" />
        <div class="container">
            <p class="lead">Select the IdP you want to use to authenticate:</p>
            <%
                //stores available IDPs  
                WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(
                    getServletConfig().getServletContext());
                MetadataManager mm = context.getBean("metadata", MetadataManager.class);
                Set<String> idps = mm.getIDPEntityNames();
                pageContext.setAttribute("idps", idps);
            %>
            <!-- IDP Selection -->
            <form action="<c:url value="${requestScope.idpDiscoReturnURL}"/>" method="GET">
                <c:forEach var="idp" items="${idps}">
                    <input type="radio" name="${requestScope.idpDiscoReturnParam}" id="idp_<c:out value="${idp}"/>" value="<c:out value="${idp}"/>"/> Okta 
                    <br>
                </c:forEach>
                <br>
                <input class="btn btn-default" type="submit" value="Start single sign-on"/>
            </form>
        </div>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>    
        <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js"></script>
    </body>
</html>