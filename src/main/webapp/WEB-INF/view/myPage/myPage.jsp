<%@ page import="java.time.LocalDateTime"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>마이페이지</title>
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>마이페이지</title>
<!-- bootstrap -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/memberBootstrap.css">

<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
.table{
 /*  border-collapse: separate;  
    margin: auto;
    color: #666;
       text-align: center;
    
    font-size: 12px;
    text-shadow: 1px 1px 0px #fff;
    border-radius: 10px;
    box-shadow: 0 1px 2px #d1d1d1; */
    width: 1000px;
    height:100%;
    font-size: 15px;
    margin-left: 30%;
    }
    
</style>
	
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
		<c:if test="${empty authInfo}"> 
			<jsp:include page="/WEB-INF/view/myPage/include/loginplz.jsp"/>
		</c:if>
	</header>
	<!-- end header -->
		<div id="myPage">
	<section id ="maPage">
	
			<c:if test="${!empty authInfo}">
						<!-- 상단 등급 바 -->
				<table id="tbl_maGrade"> 
					<tr id="tr_myGrade">
						<td><h2>${member.memberName }[${member.memberId}]님의 멤버십 등급은 ${member.grade}입니다.	</h2>
							<article id="myGrade_detail">
								<a href="${contextPath}/admin/board/mainNoticeDetail?boardCode=6">등급별 혜택 보기 〉</a>
								포인트 〉 <a id="myPoint"> ${member.point }점 </a>
							</article>
						</td>
					</tr>
				</table>
			<!-- 좌측 메뉴 -->
				<article id="my_menu">
				<h3>회원정보</h3>
				<a href="${contextPath}/myPage/myPageSel/${member.memberId}">-회원정보 조회 / 변경</a><br>
				<a href="${contextPath}/myPage/quitMember/${member.memberId}">-회원탈퇴</a>

				<h3>나의 쇼핑정보</h3>			
				<a href="${contextPath}/myPage/myOrder/${member.memberId}">-주문내역</a><br>
				<a href="${contextPath}/myPage/myCancelOrder/${member.memberId}">-취소내역</a><br>
				<a href="${contextPath}/cartList">-장바구니</a>
			
				<h3>나의 후기</h3>			
				<a href="${contextPath}/myPage/myReview/${member.memberId}">-작성완료 후기 내역</a><br>
				<a href="${contextPath}/myPage/myReviewPlz/${member.memberId}">-미작성 후기 내역</a><br>
			
				<h3>나의 문의</h3>
				<a href="${contextPath}/myPage/myProductQnA/${member.memberId}">-상품문의내역</a><br>
				<a href="${contextPath}/myPage/myNormalQnA/${member.memberId}">-일반문의내역</a><br>
				
				
				</article>
			
				<!-- ------------------------------회원정보 테이블   -------------------------------------------------- -->
			
		
				<h4 style="text-align: center;">나의 정보 </h4>
				<br>
				<br>
			<div class="container my-3">
				<form:form action="modify" modelAttribute="memberDetail">
				<form:errors/>
				<table  class="table" >
					<tr>
						<td style="width: 20%;">회원아이디 - </td><td style="text-align: left;">${member.memberId }</td>				
					</tr>
					<tr>
						<td >비밀번호  </td>		<td style="text-align: left;">********</td><%-- <td>${member.memberPwd }</td> --%>
					</tr>
				<tr>
						<td >회원이름  </td>		<td style="text-align: left;"> ${member.memberName }</td>
					</tr>
					<tr>
						<td >성별  </td>		<td style="text-align: left;">${member.gender }</td>
					</tr>
					<tr>
						<td >생년월일  </td>		<td style="text-align: left;">${member.birthday }</td>
					</tr>
					<tr>
						<td >이메일  </td>		<td style="text-align: left;">${member.email }</td>
					</tr>
					<tr>
						<td >연락처  </td>		<td style="text-align: left;">${member.tel }</td>
					</tr>
					<tr>
						<td >우편번호  </td>		<td style="text-align: left;">${member.zipCode }</td>
					</tr>
					<tr>
						<td >주소  </td>		<td style="text-align: left;">${member.address }</td>
					</tr>
					<tr>
						<td >상세주소 </td>		<td style="text-align: left;">${member.detailAddress }</td>
					</tr>
					<tr>
						<td>포인트  </td>		<td style="text-align: left;" >${member.point }</td>
					</tr>
					<tr>
						<td >누적구매금액  </td>	<td style="text-align: left;">${member.cumulativeBuyAmount }</td>
					</tr>
					<tr>
						<td >등급  </td>		<td style="text-align: left;">${member.grade }</td>
					</tr>
					<tr>
						<td >가입일  </td>		<td style="text-align: left;"><tf:formatDateTime value="${member.signUpDate }" pattern="yyyy-MM-dd:mm"/>
					</td>
				
						
		 <%-- 	<c:forEach var="MyPageSelectCommend" items="${MyPageSelectCommend}">  --%>
				
			
		<%--  	</c:forEach>  --%>
		
		</table>
		
				</form:form>
				
				</div>
			<article style="text-align: center;">
				<a href="${contextPath}/myPage/${authInfo.memberId}">회원정보 변경</a>
				<a style="color: gray;">     |     </a>
				<a href="${contextPath}/myPage/quitMember/${member.memberId}">회원탈퇴</a>
			</article>
			
				
				
			</c:if>

	
	
	</section>
</div>
	
	<section>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>