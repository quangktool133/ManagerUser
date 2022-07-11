<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value = "/view/admin/assets" var="url"/>
    <div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
      <div class="brand-logo">
        <a href="%=request.getContextPath() %>/admin">
          <img src="<%=request.getContextPath() %>/admin/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
          <h5 class="logo-text">Admin Page</h5>
        </a>
      </div>
      <ul class="sidebar-menu do-nicescrol">
        <li class="sidebar-header">MENU ADMIN</li>
       
        
         <li>
          <a href="<%=request.getContextPath()%>/admin/user">
            <i class="zmdi zmdi-accounts"></i> <span>User management</span>
          </a>
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/admin/role">
           <i class="zmdi zmdi-account-box"></i>  <span>Role Management</span>
          </a>
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/admin/promotion">
            <i class="zmdi zmdi-widgets"></i> <span>Promotion Management</span>
          </a>
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/admin/promotion-history">
           <i class="zmdi zmdi-grid"></i>  <span>Promotion History</span>
          </a>
        </li>
        
      </ul>
    </div>