<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value = "/admin/assets" var="url"/>

  <jsp:include page = "./right-sidebar.jsp" flush = "true" />
 <script src="<%=request.getContextPath()%>/admin/assets/js/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/admin/assets/js/popper.min.js"></script>
  <script src="<%=request.getContextPath()%>/admin/assets/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath()%>/admin/assets/plugins/simplebar/js/simplebar.js"></script>
  <script src="<%=request.getContextPath()%>/admin/assets/js/sidebar-menu.js"></script>
  <script src="<%=request.getContextPath()%>/admin/assets/js/jquery.loading-indicator.js"></script>
  <script src="<%=request.getContextPath()%>/admin/assets/js/app-script.js"></script>
  <script src="<%=request.getContextPath()%>/admin/assets/plugins/Chart.js/Chart.min.js"></script>
  <script src="<%=request.getContextPath()%>/admin/assets/js/index.js"></script>
  <script src="<%=request.getContextPath()%>/admin/assets/plugins/summernote/dist/summernote-bs4.min.js"></script>
</body>

</html>