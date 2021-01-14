<%@ page contentType="text/html; charset=UTF-8"%>

<nav class="navbar navbar-expand-sm bg-light sticky-top">
	<i id="barIcon" onclick="fun1()" class="fas fa-bars"></i>
	<script type="text/javascript">
		const fun1 = () =>{
			document.getElementById("mySidenav").style.width = "250px";
		};
		
		const closeNav = () =>{
			document.getElementById("mySidenav").style.width = "0";
		};
	</script>

	<ul class="navbar-nav mx-auto">
		<li class="nav-item"><a class="nav-link"
			href="/html_css_javaspring/index.html">HOME</a></li>
		<li class="nav-item dropdown">
			<a class="nav-link dropbtn" href="<%=application.getContextPath() %>/item_list/default">SHOP</a>
			<div class="dropdown-content">
				<a href="<%=application.getContextPath() %>/item_list/newitems">NEW</a>
				<a href="<%=application.getContextPath() %>/item_list/bestitems">BEST</a>
			</div>
		</li>
		<li class="nav-item"><a class="nav-link" href="<%=application.getContextPath() %>/add/add">ADD</a></li>
		<li class="nav-item"><a class="nav-link" href="#">EDIT</a></li>
		<li class="nav-item"><a class="nav-link" href="#">DELETE</a></li>
	</ul>

	<div class="dropdown">
		<div id="myDropdown" class="search-dropdown-content">
			<input type="text" placeholder="Search.." id="myInput"
				onkeyup="filterFunction()">
		</div>
		<i onclick="searchBar()" id="mySearch" style="margin-right: 30px"
			class="fas fa-search"></i>
	</div>

	<script type="text/javascript">
				let toggle = true;
				
				const searchBar = () =>{
					if(toggle){
						document.getElementById("myDropdown").style.display = "inline";
						toggle = !toggle;
					}else{
						document.getElementById("myDropdown").style.display = "none";
						toggle = !toggle;
					}
						
				};
	
			</script>
	<a style="margin-right: 10px" href="<%=application.getContextPath() %>/login/">
		<i class="fas fa-user"></i>
	</a>
</nav>
