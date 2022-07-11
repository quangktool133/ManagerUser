<%@page import="manager.webapp.model.User"%>
<%@page import="manager.webapp.model.Role"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");

if (session.getAttribute("admin-username") == null) {
	response.sendRedirect(request.getContextPath() + "/admin/login");
}
%>

<!-- Start header section -->
<jsp:include page="./header/header.jsp" flush="true" />
<div class="content-wrapper">
	<div class="container-fluid">
		<!--End Row-->


		<div class="row">
		<div class="col-lg-12 d-flex justify-content-end">
			<div class="col-lg-3 ">
				<form action="<%=request.getContextPath()%>/admin/search"
							method="post" class="input-group rounded">
								
					<input type="text" class="form-control rounded"
						placeholder="Search" aria-label="Search"
						aria-describedby="search-addon"   name="searchIpnut" /> 
						<button type="submit" class="btn btn-light px-5"> <i
						class="fa fa-search"></i>
					</button>
				</form>
			</div>
			</div>
			<div class="col-lg-12">
				<button class="add-catalog">
					<a href="<%=request.getContextPath()%>/admin/user/add">Add user</a>
				</button>
			</div>
			<%
								String msg = request.getParameter("msg");
							if ("1".equals(msg)) {
							%>

							<div class="alert alert-success" role="alert">added user successfully!</div>

							<%
								} 

								
								
							%>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">User List</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Fullname</th>
										<th scope="col">Username</th>
										<th scope="col">Image</th>
										<th scope="col">Email</th>
										<th scope="col">Phone</th>
										<th scope="col">Role</th>
										<th scope="col">Status</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>

									<%
										ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");
									User userCurrent = (User) session.getAttribute("userCurrent");
									if (listUser.size() > 0 && listUser != null) {
										for (int i = 0; i < listUser.size(); i++) {
											if (listUser.get(i).getId() != userCurrent.getId()) {
									%>

									<tr>
										<td scope="row"><%=listUser.get(i).getId()%></td>
										<td><%=listUser.get(i).getFullname()%></td>
										<td><%=listUser.get(i).getUsername()%></td>
										<td><img
											style="width: 110px; height: 67px; object-fit: cover; border: 1px solid #fff;"
											src="<%=request.getContextPath()%>/file/<%=listUser.get(i).getImage()%>"></td>
										<td><%=listUser.get(i).getEmail()%></td>
										<td><%=listUser.get(i).getPhone()%></td>
										<td><%=listUser.get(i).getRole().getRole()%></td>
										<td>
											<%
												if (listUser.get(i).getStatus() == 1) {
											%>
											<button class="btn btn-success">
												<a
													href="<%=request.getContextPath()%>/admin/user/change?id=<%=listUser.get(i).getId()%>" onclick="return confirm('Do you want to inactive this user?')">Active</a>
											</button> <%
 	} else {
 %>
											<button class="btn btn-danger">
												<a
													href="<%=request.getContextPath()%>/admin/user/change?id=<%=listUser.get(i).getId()%>" onclick="return confirm('Do you want to active this user?')">Inactive</a>
											</button> <%
 	}
 %>
										</td>
										<td>
										<% if(!"admin".equals(listUser.get(i).getRole().getRole())){ %>
										<a
											href="<%=request.getContextPath()%>/admin/user/edit?id=<%=listUser.get(i).getId()%>">Edit</a>
											<%} %>
											</td>
									</tr>
									<%
										}
									}
									} else {
									%>
									<tr>
										<td colspan="9" align="center">Chưa có danh mục nào!</td>
									</tr>
									<%}%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="./footer/footer.jsp" flush="true" />