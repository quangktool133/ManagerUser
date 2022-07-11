<%@page import="manager.webapp.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.webapp.model.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Start header section -->
<jsp:include page="./header/header.jsp" flush="true" />

<div class="content-wrapper">
	<div class="container-fluid">

		<div class="row mt-3">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="card-title">Edit User</div>
						<hr>
						<%
							User userCurrent =(User) session.getAttribute("userCurrent");
							User user = (User) request.getAttribute("user");
							if( user != null){
						%>
						<form action="<%=request.getContextPath()%>/admin/user/edit?id=<%=user.getId()%>"
							method="post" enctype="multipart/form-data">

							<div class="form-group">
								<label for="input-1">Full name</label> <input type="text"
									class="form-control" id="input-2" placeholder="Nhập họ tên"
									name="user-name" value="<%=user.getFullname()%>"
									required="required">
							</div>
							<div class="form-group">
								<label for="input-2">Email</label> <input type="text"
									class="form-control" id="input-3"
									placeholder="Nhập địa chỉ Email"
									value="<%=user.getEmail()%>" name="user-email">
							</div>
							<div class="form-group">
								<label for="input-3">Phone</label> <input type="text"
									class="form-control" id="input-4"
									placeholder="Nhập số điện thoại"
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
										var x = document
												.getElementById("myinput");
										if (x.type === "password") {
											x.type = "text";
										} else {
											x.type = "password";
										}
									}
								</script>
							</div>
							<div class="form-group">
								<label for="input-3">Role</label> <select name="user-role"
									class="form-control" required="required">
									<%
										if(user.getId() != userCurrent.getId()){
									ArrayList<Role> cate = (ArrayList<Role>) request.getAttribute("listRole");
									if(cate.size() > 0 && cate != null){
										for(Role item : cate){
											if(!"admin".equals(item.getRole())){
												if(item.getRole() == user.getRole().getRole()){
									%>
									<option value="<%=item.getId()%>" selected="selected"><%=item.getRole()%></option>
									<%}else{%>
										<option value="<%=item.getId()%>" selected="selected"><%=item.getRole()%></option>
										<%}}}}}%>
									

								</select>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-light px-5">
									<i class="icon-lock"></i> Edit
								</button>
							</div>
						</form>
						<%} %>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>
<script>
	var date = new Date();

	var day = date.getDate();
	var month = date.getMonth() + 1;
	var year = date.getFullYear();

	if (month < 10)
		month = "0" + month;
	if (day < 10)
		day = "0" + day;

	var today = year + "-" + month + "-" + day;

	document.getElementById('the-date').value = today;
</script>

<jsp:include page="./footer/footer.jsp" flush="true" />