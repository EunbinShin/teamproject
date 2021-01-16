<%@ page contentType="text/html; charset=UTF-8"%>
<header onclick="Home()" style="color: white">
	<img id="sagi_logo" src="<%=application.getContextPath() %>/resources/img/logo/logo_white.png">
	SAGI
	<script type="text/javascript">
		const Home = () => {
			var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			location.href = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
		};
	</script>
</header>