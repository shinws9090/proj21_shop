<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<jsp:include page="/WEB-INF/view/admin/include/boardMenu.jsp" />
				<div class="container-fluid">
					<table style="width: 80%; text-align: center">
						<thead>
						<tr>
							<td colspan="7" class="td_title"><h1 class="mt-4">공지사항</h1></td>
						</tr>			
							<tr style="background-color: lightgrey; text-align: center">
								<td>번호</td>
								<td>제목</td>						
								<td>작성자</td>		
								<td>작성일</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticeList}" var="noticeList">
							<tr>
								<td>${noticeList.boardCode}</td>
								<td><a href="detail?boardCode=${noticeList.boardCode}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${noticeList.title}" /></a></td>
								<td>${noticeList.employee.empName}</td>
								<td>${noticeList.registDate}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div>
						<ul>
						    <c:if test="${pageMaker.prev}">
						      <li id="page"><a href="notice${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						      <li id="page"><a href="notice${pageMaker.makeSearch(idx)}">[${idx}]</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						      <li id="page"><a href="notice${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
						    </c:if> 
						</ul>						
						<div class="search">
						    <select name="searchType">
						      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
						      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						    </select>
						
						    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
						
						    <button id="searchBtn" type="button">검색</button>
						    
						    <script  type="text/javascript">
						      $(function(){
						        $('#searchBtn').click(function() {
						          self.location = "notice" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
						        });
						      });   
						    </script>
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