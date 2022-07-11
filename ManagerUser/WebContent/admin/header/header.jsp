<%@page import="manager.webapp.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/admin/assets" var="url"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Admin page</title>

  <link href="<%=request.getContextPath()%>/admin/assets/css/pace.min.css" rel="stylesheet" />
  <script src="<%=request.getContextPath()%>/admin/assets/js/pace.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/assets/plugins/summernote/dist/summernote-bs4.css"/>
  <link rel="icon" href="<%=request.getContextPath()%>/admin/assets/images/favicon.ico" type="image/x-icon">
  <link href="<%=request.getContextPath()%>/admin/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/admin/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/admin/assets/css/animate.css" rel="stylesheet" type="text/css" />
  <link href="<%=request.getContextPath()%>/admin/assets/css/icons.css" rel="stylesheet" type="text/css" />
  <link href="<%=request.getContextPath()%>/admin/assets/css/sidebar-menu.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/admin/assets/css/app-style.css" rel="stylesheet" />
  

</head>

<body class="bg-theme bg-theme1">


  <!-- start loader -->
  <div id="pageloader-overlay" class="visible incoming">
    <div class="loader-wrapper-outer">
      <div class="loader-wrapper-inner">
        <div class="loader"></div>
      </div>
    </div>
  </div>
  
 <div id="wrapper">
  <jsp:include page = "./left-sidebar.jsp" flush = "true" />
    <header class="topbar-nav">
      <nav class="navbar navbar-expand fixed-top">
        <ul class="navbar-nav mr-auto align-items-center">
          <li class="nav-item">
            <a class="nav-link toggle-menu" href="javascript:void();">
              <i class="icon-menu menu-icon"></i>
            </a>
          </li>
        </ul>
		<div class="d-flex align-items-center">
		 <div class="right-nav-link">
                      
                	 Welcome  <%=session.getAttribute("admin-username") %>!                     
            </div>
        <ul class="navbar-nav align-items-center right-nav-link">
          <li class="nav-item">
            <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown" href="<%=request.getContextPath()%>/admin/user">
              <span class="user-profile"><img src="<%=request.getContextPath()%>/admin/assets/images/avatar-admin.png" class="img-circle"
                  alt="user avatar"></span>
            </a>
            
            <ul class="dropdown-menu dropdown-menu-right">
              <li class="dropdown-item user-details">
                <a href="javaScript:void();">
                  <div class="media">
                    <div class="avatar"><img class="align-self-start mr-3" src="<%=request.getContextPath()%>/admin/assets/images/avatar-admin.png"
                        alt="user avatar"></div>
                    
                  </div>
                </a>
              </li>
            <% User userCurrent = (User) session.getAttribute("userCurrent"); %>
              <li class="dropdown-divider"></li>
			 <li class="dropdown-item"><i class="fa fa-gear fa-spin" aria-hidden="true"></i><a href="<%=request.getContextPath()%>/admin/user/edit?id=<%=userCurrent.getId()%>"> Edit profile</a></li>		
              <li class="dropdown-divider"></li>
			 <li class="dropdown-item"><i class="icon-power mr-2"></i><a href="<%=request.getContextPath()%>/admin/logout"> Log out</a></li>		
            </ul>
          </li>
        </ul>
        </div>
      </nav>
    </header>
    <div class="clearfix"></div>