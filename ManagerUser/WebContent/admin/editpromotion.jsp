<%@page import="manager.webapp.model.Promotion"%>
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
						<div class="card-title">Edit Promotion</div>
						<hr>
							<%
								Promotion user = (Promotion) request.getAttribute("promotionCurrent");
							if (user != null) {
							%>
						<form action="<%=request.getContextPath()%>/admin/promotion/edit?id=<%=user.getId()%>"
							method="post">
							<div class="form-group">
								<label for="input-3">Username</label> <input type="text"
									class="form-control" id="input-5"
									value="<%=user.getUser().getUsername()%>" name="user-userName"
									readonly="readonly">
							</div>
							<div class="form-group">
								<input type="text"
									class="form-control" id="input-5"
									value="<%=user.getUser().getId()%>" name="userID"
									hidden="hidden">
							</div>
							<div class="form-group">
								<label for="input-3">Choose Promotion:</label> <select
									name="user-promotion" class="form-control" required="required">
									<%
										for (int i = 1; i <= 10; i++) {
										if (i == user.getRank()) {
									%>
									<option value="<%=i%>" selected="selected"><%=i%></option>
									<%
										} else {
									%>
									<option value="<%=i%>" ><%=i%></option>
									<%
										}
									}
									%>

								</select>
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