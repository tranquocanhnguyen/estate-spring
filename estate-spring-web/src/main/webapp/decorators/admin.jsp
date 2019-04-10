<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Star Admin Free Bootstrap Admin Dashboard Template</title>
    <!-- plugins:css -->
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <script
            src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
    <script src="<c:url value='/template/paging/jquery.twbsPagination.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/template/vendors/iconfonts/mdi/css/materialdesignicons.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/vendors/css/vendor.bundle.base.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/vendors/css/vendor.bundle.addons.css'/>">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="<c:url value='/template/css/style.css'/>">
    <!-- endinject -->
    <link rel="shortcut icon" href="<c:url value='/template/images/favicon.png'/>" />
    <link rel="stylesheet" href="<c:url value='/template/global/css/mycss.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <%@include file="/common/header.jsp"%>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <%@include file="/common/menu.jsp"%>
        <!-- partial -->
        <div class="main-panel">
            <dec:body />
            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <%@include file="/common/footer.jsp"%>
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->


<!-- container-scroller -->

<!-- plugins:js -->
<script src="<c:url value='/template/vendors/js/vendor.bundle.base.js'/>"></script>
<script src="<c:url value='/template/vendors/js/vendor.bundle.addons.js'/>"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="<c:url value='/template/js/off-canvas.js'/>"></script>
<script src="<c:url value='/template/js/misc.js'/>"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="<c:url value='/template/js/dashboard.js'/>"></script>
<!-- End custom js for this page-->
<%--<script src="jquery.twbsPagination.js"></script>--%>
<script src="<c:url value='/template/paging/jquery.twbsPagination.js'/>"></script>

</body>
</html>
