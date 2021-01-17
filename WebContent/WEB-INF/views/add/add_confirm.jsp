<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> SAGI </title>
	
	<link rel="icon" href="<%=application.getContextPath() %>/resource/img/logo/logo_fapicon.png">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/add.css?after" type="text/css"> 
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/header.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/menu_bar.css?after" type="text/css">
	<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/footer.css?after" type="text/css">
	
	<script type="text/javascript">
		const gotoHome = () => {
			location.href = "/html_css_javaspring/index.html";
		}	
	</script>
	
</head>

<body>
	<jsp:include page="/WEB-INF/views/include/sideNav.jsp"/>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
	<div id="wrapper">
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
	
	<div class="add">
	<form class="form-horizontal">
	<h3>상품을 등록을 완료했습니다</h3>
	<div>
	
		<h5>등록된 상품</h5>
		<div>
			<script type="text/javascript">
			$(()=>{
				$.ajax({
					url: "add_photolist",
					method: "get",
					success: (data) => {
						$("#add_photolist").html(data);
					}
				});
			});
			</script>
		</div>
		<div id="add_photolist" style="margin-top:10px;"></div>	
	</div>

	<div style="margin-top:30px;">
	<a href="<%=application.getContextPath() %>/add/add" class="btn btn-secondary">추가</a>
	<a href="<%=application.getContextPath() %>"class="btn btn-secondary">홈페이지</a>	
	</div>
	</form>
	</div> <!-- /add -->
		
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</div> <!-- wrapper -->	
</body>
</html>