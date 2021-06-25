<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){
	$('#cancel').on("click", function(e) {
		location.href="${contextPath}/admin/product/brandReg";
	});
		
	var jsonData = JSON.parse('${brandList}');
	for(var i = 0; i < jsonData.length; i++) {		
		var sCont = "";
			sCont += "<tr>";
			sCont += "<td>" + jsonData[i].brandCode + "</td>";
			sCont += "<td>" + jsonData[i].brandName + "</td>";
			sCont += "<td>" + jsonData[i].brandEngName + "</td>";
			sCont += "<td><button type='button'><a href='${contextPath}/admin/product/brandMod?brandCode=" + jsonData[i].brandCode + "'>관리</a></button>";
			sCont += "</tr>";		
		$("#load:last-child").append(sCont);	
	}	
});
</script>
</head>
<body class="main-layout">

	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->

	<section>
		<div class="d-flex" id="wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />
		    
		    <!-- Page content wrapper-->
		    <div id="page-content-wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/productMenu.jsp" />
		        
		        <!-- Page content-->
		        <div class="container-fluid">
		            <table style="width:100%">
						<tr>
							<td colspan="7" class="td_title"><h1 class="mt-4">브랜드 목록</h1></td>
						</tr>

						<tr style="background-color: lightgrey; text-align: center">
							<td>브랜드코드</td>
							<td>브랜드명</td>
							<td>브랜드영어명</td>
							<td>관리</td>
						</tr>
						
						<tr>
							<tbody id="load"/>
						</tr>
					</table>
		
					<h1 class="mt-4">브랜드 추가</h1>
					<div class="admin_content_wrap">
						<div class="admin_content_main">
							<form id="productRegForm" method="post" autocomplete="off">
			
								<div class="form_section">
									<div class="form_section_title">
										<label>브랜드 코드</label>
									</div>
									<div class="form_section_content">
										<input name="brandCode" value="">
									</div>
								</div>
			
								<div class="form_section">
									<div class="form_section_title">
										<label>브랜드명</label>
									</div>
									<div class="form_section_content">
										<input name="brandName" value="">
									</div>
								</div>
								
								<div class="form_section">
									<div class="form_section_title">
										<label>브랜드영어명</label>
									</div>
									<div class="form_section_content">
										<input name="brandEngName" value="">
									</div>
								</div>
								
								<div class="btn_section">
									<button type="submit" id="new">추가</button>
									<button type="button" id="cancel">취소</button>
								</div>
			
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>

	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>