<%@page import="manager.webapp.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/view/admin/assets" var="url" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>User web</title>
<!-- loader-->
<link
	href="<%=request.getContextPath()%>/admin/assets/css/pace.min.css"
	rel="stylesheet" />
<script src="<%=request.getContextPath()%>/admin/assets/js/pace.min.js"></script>
<!--favicon-->
<link rel="icon"
	href="<%=request.getContextPath()%>/admin/assets/images/favicon.ico"
	type="image/x-icon">
<!-- Bootstrap core CSS-->
<link
	href="<%=request.getContextPath()%>/admin/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- animate CSS-->
<link href="<%=request.getContextPath()%>/admin/assets/css/animate.css"
	rel="stylesheet" type="text/css" />
<!-- Icons CSS-->
<link href="<%=request.getContextPath()%>/admin/assets/css/icons.css"
	rel="stylesheet" type="text/css" />
<!-- Custom Style-->
<link
	href="<%=request.getContextPath()%>/admin/assets/css/app-style.css"
	rel="stylesheet" />
<script
	src="<%=request.getContextPath()%>/admin/assets/js/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/admin/assets/js/popper.min.js"></script>
<script
	src="<%=request.getContextPath()%>/admin/assets/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/admin/assets/plugins/simplebar/js/simplebar.js"></script>
<script
	src="<%=request.getContextPath()%>/admin/assets/js/sidebar-menu.js"></script>
<script
	src="<%=request.getContextPath()%>/admin/assets/js/app-script.js"></script>

</head>

<body class="bg-theme bg-theme1">
 <nav class="navbar navbar-expand fixed-top">
        <ul class="navbar-nav mr-auto align-items-center">
          <li class="nav-item">
            
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
	<!-- start loader -->
	<div id="pageloader-overlay" class="visible incoming">
		<div class="loader-wrapper-outer">
			<div class="loader-wrapper-inner">
				<div class="loader"></div>
			</div>
		</div>
	</div>
	<!-- end loader -->

	<!-- Start wrapper-->
	<div id="wrapper">
<div class="card card-authentication1 mx-auto my-5">
		<div class="card-body">
		<%
		User user = (User) request.getAttribute("user");
		if (user != null) {
		%>


		<form action="<%=request.getContextPath()%>/user?id=<%=user.getId()%>"
			method="post" enctype="multipart/form-data">

			<div class="form-group">
				<label for="input-1">Full name</label> <input type="text"
					class="form-control" id="input-2" placeholder="Nhập họ tên"
					name="user-name" value="<%=user.getFullname()%>"
					required="required" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="input-2">Email</label> <input type="text"
					class="form-control" id="input-3" placeholder="Nhập địa chỉ Email"
					value="<%=user.getEmail()%>" name="user-email">
			</div>
			<div class="form-group">
				<label for="input-3">Phone</label> <input type="text"
					class="form-control" id="input-4" placeholder="Nhập số điện thoại"
					value="<%=user.getPhone()%>" name="user-phone">
			</div>
			<div class="form-group">
				<label for="input-3">Image</label> <input type="file"
					class="form-control" id="input-5" placeholder=""
					value="<%=user.getImage()%>" name="user-image">
			</div>
			<div class="form-group">
				<label for="input-3">User name</label> <input type="text"
					class="form-control" id="input-5" placeholder="Nhập User Name"
					name="user-userName" value="<%=user.getUsername()%>"
					required="required" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="input-4">Password</label> <input type="password"
					class="form-control" id="myinput" placeholder="Nhập mật khẩu"
					name="user-password" value="<%=user.getPassword()%>"
					required="required"> <input type="checkbox"
					onclick="myFunction1()">Hiển thị mật khẩu
				<script>
					function myFunction1() {
						var x = document.getElementById("myinput");
						if (x.type === "password") {
							x.type = "text";
						} else {
							x.type = "password";
						}
					}
				</script>
			</div>
			<div class="form-group">



				<input type="text" class="form-control" id="input-5"
					placeholder="Nhập User Name" name="user-role"
					value="<%=user.getRole().getId()%>" hidden="hidden">





			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-light px-5">
					<i class="icon-lock"></i> Edit
				</button>
			</div>
		</form>
		<%
			}
		%>

		<!--Start Back To Top Button-->
</div>
</div>
	</div>
</body>
</html>
