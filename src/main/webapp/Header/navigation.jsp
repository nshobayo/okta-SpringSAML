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

<%@ page import="org.springframework.security.saml.SAMLCredential" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
  <%-- this is what makes the "hamburger" icon --%>
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<c:url value="/"/>">Spring Security Saml Example</a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-right">
        <%-- Display logout option if user is logged in --%>
        <c:if test="${SecurityContextHolder.getContext().getAuthentication() != null}"> 
          <c:if test="${SecurityContextHolder.getContext().getAuthentication().isAuthenticated()}">
            <li>
                <form class="left" action="<c:url value="/saml/logout"/>" method="get">
                <input type="hidden" name="local" value="true"/>
                <input style="border-width:0px" type="submit" value="Logout" class="button btn-link navbar-brand"/>
                </form>
            </li>
          </c:if>
        </c:if>
      </ul>
    </div><%--nav-collapse --%>
  </div>
</nav>
