<%@page import="manager.webapp.model.Promotion"%>
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
            <button class="add-catalog"><a href="<%=request.getContextPath()%>/admin/promotion/add">Add Promotion</a></button>
          </div>
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Promotion List</h5>
                <%
								String msg = request.getParameter("msg");
							if ("1".equals(msg)) {
							%>

							<div class="alert alert-success" role="alert">added user successfully!</div>

							<%
								} else if("2".equals(msg)) {
									%>

									<div class="alert alert-success" role="alert">edited completed!</div>

									<%
										}else if("3".equals(msg)) {
											%>

											<div class="alert alert-success" role="alert">deleted completed!</div>

											<%
												}
								
							%>
                <div class="table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Full name</th>
                        <th scope="col">Username</th>
                        <th scope="col">Image</th>
                        <th scope="col">Promotion</th>
                        <th scope="col">Action</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                    
                  			<% 
                  			ArrayList<Promotion> listPromotion = (ArrayList<Promotion>)request.getAttribute("promotionList");
                  			if(listPromotion.size()>0 && listPromotion!=null){
                	  		for(Promotion item : listPromotion){
                	  		
                		 %>
                  
                      <tr>
                        <td scope="row"><%=item.getId()%></td>
                        <td><%=item.getUser().getFullname()%></td>
                        <td><%=item.getUser().getUsername()%></td>
                        <td><img style="width: 110px;height: 67px; object-fit: cover;border: 1px solid #fff;" src="<%=request.getContextPath()%>/file/<%=item.getUser().getImage()%>"></td>
                        <td><%=item.getRank()%></td>
        				
        				 <td>
                          	<button class="btn btn-success"><a href="<%=request.getContextPath()%>/admin/promotion/edit?id=<%=item.getId()%>">Edit</a></button>
                         	<button class="btn btn-danger"><a href="<%=request.getContextPath()%>/admin/promotion/del?id=<%=item.getId()%>" onclick="return confirm('Do you want to delete a record?')">Delete</a></button>
                         
                        </td>
                     </tr>
                    <%}}else{ %>
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