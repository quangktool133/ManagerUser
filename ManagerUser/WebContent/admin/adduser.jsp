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
						<div class="card-title">Add User</div>
						<%
								String msg = request.getParameter("msg");
							if ("1".equals(msg)) {
							%>

							<div class="alert alert-danger" role="alert">username already exists!</div>

							<%
								} 

								
								
							%>
						<hr>
						<form action="<%=request.getContextPath()%>/admin/user/add"
							method="post" enctype="multipart/form-data">

							<div class="form-group">
								<label for="input-1">Full name</label> <input type="text"
									class="form-control" id="input-2" placeholder="Nhập họ tên"
									name="user-name" required="required">
							</div>
							<div class="form-group">
								<label for="input-2">Email</label> <input type="text"
									class="form-control" id="input-3"
									placeholder="Nhập địa chỉ Email" name="user-email">
							</div>
							<div class="form-group">
								<label for="input-3">Phone</label> <input type="text"
									class="form-control" id="input-4"
									placeholder="Nhập số điện thoại" name="user-phone">
							</div>
							<div class="form-group">
								<label for="input-3">Image</label> <input type="file"
									class="form-control" id="input-5" placeholder=""
									name="user-image">
							</div>
							<div class="form-group">
								<label for="input-3">User name</label> <input type="text"
									class="form-control" id="input-5" placeholder="Nhập User Name"
									name="user-userName" required="required">
							</div>
							<div class="form-group">
								<label for="input-4">Password</label> <input type="password"
									class="form-control" id="myinput" placeholder="Nhập mật khẩu"
									name="user-password" required="required"> <input type="checkbox"
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
							<label for="input-3">Role</label> 
								<select name="user-role" class="form-control" required="required">
									<%
									ArrayList<Role> cate = (ArrayList<Role>) request.getAttribute("listRole");
									if(cate.size() > 0 && cate != null){
										for(Role item : cate){
									%>
									<option value="<%=item.getId()%>"><%=item.getRole()%></option>
									<%}}%>
									
								</select>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-light px-5">
									<i class="icon-lock"></i> Add
								</button>
							</div>
						</form>
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