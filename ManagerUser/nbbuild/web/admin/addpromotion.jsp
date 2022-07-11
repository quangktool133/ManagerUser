<%@page import="manager.webapp.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.webapp.model.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Start header section -->
<jsp:include page="./header/header.jsp" flush="true" />

<div class="content-wrapper">

	<div class="container-fluid">
		<%
			User userCurrent = (User) session.getAttribute("userCurrent");
		%>
		<div class="row mt-3">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="card-title">Add User</div>
						<hr>

						<form action="<%=request.getContextPath()%>/admin/promotion/add"
							method="post">

							<div class="form-group">
								<label for="input-3">Choose username:</label> <select
									name="user-choose" class="form-control" required="required">
									<%
										ArrayList<User> user = (ArrayList<User>) request.getAttribute("listUser");
									if (user.size() > 0 && user != null) {
										for (User item : user) {
											if (userCurrent.getId() != item.getId()) {
									%>
									<option value="<%=item.getId()%>"><%=item.getUsername()%></option>
									<%
										}
									}
									}
									%>

								</select>
							</div>
							<%
								String msg = request.getParameter("msg");
							if ("1".equals(msg)) {
							%>

							<div class="alert alert-danger" role="alert">Account
								already exist!</div>

							<%
								}
							%>
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