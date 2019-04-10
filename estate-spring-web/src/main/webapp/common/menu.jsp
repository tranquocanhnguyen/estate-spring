<!-- partial:partials/_sidebar.html -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item nav-profile">
            <div class="nav-link">
                <div class="user-wrapper">
                    <div class="profile-image">
                        <img src="<c:url value="/template/images/faces/face1.jpg"/>" alt="profile image">
                    </div>
                    <div class="text-wrapper">
                        <p class="profile-name">${USER_MODEL.userName}</p>
                        <div>
                            <small class="designation text-muted">Manager</small>
                            <span class="status-indicator online"></span>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <i class="menu-icon mdi mdi-content-copy"></i>
                <span class="menu-title">Building manage</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                    <c:url var="listBuilding" value="">
                        <c:param name="type" value="list"/>
                        <c:param name="page" value="1"/>
                        <c:param name="maxPageItem" value="2"/>
                        <c:param name="sortName" value="name"/>
                        <c:param name="sortBy" value="desc"/>
                    </c:url>
                    <li class="nav-item">
                        <a class="nav-link" href="${listBuilding}">List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-building?type=edit&action=add">Add</a>
                    </li>
                </ul>
            </div>
        </li>

    </ul>
</nav>
<!-- partial -->