<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="manager.webapp.model.PromotionHistory"%>
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
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Promotion History</h5>
                <div class="table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Changed by</th>
                        <th scope="col">Description</th>
                        <th scope="col">Updated date</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                    
                  			<% 
                  			ArrayList<PromotionHistory> listPromotion = (ArrayList<PromotionHistory>)request.getAttribute("promotionHistoryList");
                  			if(listPromotion.size()>0 && listPromotion!=null){
                	  		for(PromotionHistory item : listPromotion){
                	  		
                		 %>
                  
                      <tr>
                        <td scope="row"><%=item.getId()%></td>
                        <td><%=item.getUser().getFullname()%></td>
                        <td><%=item.getDecription()%></td>
                        <td><%
                        DateFormat obj = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");   
                        Date res = new Date(item.getDate_create());  
                        out.println( obj.format(res));
							%></td>
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