<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!-- Sidebar-->
<div class="border-end bg-white" id="sidebar-wrapper">
    <div class="sidebar-heading border-bottom bg-light"><a href="${contextPath}/admin/adminMain">관리자홈</a></div>
    <div class="list-group list-group-flush">
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${contextPath}/admin/memberMgt">회원관리</a>
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${contextPath}/admin/productMgt">상품관리</a>
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${contextPath}/admin/orderMgt">주문관리</a>
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${contextPath}/admin/board/notice">게시판관리</a>
    </div>
</div>