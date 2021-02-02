<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	<ul id="menu_content" class="navbar-nav">
		<li class="nav-item"><a class="nav-link"
			href="<%=application.getContextPath() %>">HOME</a></li>
		<li class="nav-item dropdown">
			<a class="nav-link dropbtn" href="<%=application.getContextPath() %>/item_list/default?page=1">SHOP</a>
			<div class="dropdown-content">
				<%-- <a href="<%=application.getContextPath() %>/item_list/newitems?page=1">NEW</a> --%>
				<a href="<%=application.getContextPath() %>/item_list/bestitems?page=1">BEST</a>
			</div>
		</li>
		<c:if test="${loginStatus.id == 'admin'}">
		<li class="nav-item"><a class="nav-link" href="<%=application.getContextPath() %>/product_manage/product_content">ADD</a></li>
		</c:if>
	</ul>

	<div id="icon_content">
		<div id="mySearchBox">
			<input type="text" placeholder="Search.." id="myInput" onkeyup="searching()">
		</div>
		<i onclick="searchBar()" id="mySearch" style="margin-right: 30px"
			class="fas fa-search"></i>
		<div id="searchResult">
		</div>
	</div>
	

	<script type="text/javascript">
	
		let toggle = true;
		const searchBar = () =>{
			if(toggle){
				document.getElementById("mySearchBox").style.display = "inline";
				toggle = !toggle;
			}else{
				document.getElementById("mySearchBox").style.display = "none";
				document.getElementById("searchResult").style.display = "none";
				toggle = !toggle;
			}	
		};
	
		const searching = () =>{
			var search = $("#myInput").val();
			console.log(search);
			$.ajax({
				url:"/teamproject/search",
				method:"get",
				data: {search : search},
				success: (data) => {
					console.log("성공");
					if(search.length == 0){
						console.log("검색어 없음");
						$("#searchResult").css("display","none");
					}else{
						console.log("검색어 있음");
						$("#searchResult").css("display","block");
					}
					$("#searchResult").html(data);
				}
			});
		}
		
	</script>
	
		<a href="<%=application.getContextPath() %>/login/">
		<i class="fas fa-user"></i>
		</a>
</nav>