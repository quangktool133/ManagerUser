<%@page import="manager.webapp.model.Role"%>
<%@page import="manager.webapp.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma" , "no-cache");
  response.setHeader("Expires" , "0");
  
  if (session.getAttribute("admin-username") == null){
	  response.sendRedirect(request.getContextPath() + "/admin/login");
  }
  	
  %>
  
  <!-- Start header section -->
  <jsp:include page = "./header/header.jsp" flush = "true" />
    <div class="content-wrapper">
      <div class="container-fluid">
        <!--End Row-->


        <div class="row">
          <div class="col-lg-12">
            <button class="add-catalog"><a href="<%=request.getContextPath()%>/admin/role/add">Add role</a></button>
          </div>
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">User List</h5>
                <div class="table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Role</th>
                        <th scope="col">Description</th>
                        <th scope="col">Action</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                    
                  			<% 
                  			ArrayList<Role> listRole = (ArrayList<Role>)request.getAttribute("roleList");
                  			if(listRole.size()>0 && listRole!=null){
                	  		for(Role item: listRole){
                	  		if(!"admin".equals(item.getRole())){
                		 %>
                  
                      <tr>
                        <td scope="row"><%=item.getId()%></td>
                        <td><%=item.getRole()%></td>
                        <td><%=item.getDescriptions()%></td>
        				
        				 <td>
                          	<button class="btn btn-success"><a href="<%=request.getContextPath()%>/admin/role/edit?id=<%=item.getId()%>">Edit</a></button>
                         	<button class="btn btn-danger"><a href="<%=request.getContextPath()%>/admin/role/del?id=<%=item.getId()%>" onclick="return confirm('Do you want to delete a record?')">Delete</a></button>
                         
                        </td>
                     </tr>
                    <%}}}else{ %>
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
 
    <jsp:include page = "./footer/footer.jsp" flush = "true" />