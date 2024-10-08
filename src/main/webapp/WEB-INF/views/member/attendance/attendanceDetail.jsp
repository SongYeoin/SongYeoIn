<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>송파여성인력개발센터</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
/* CSS Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html, body {
    height: 100%;
}

body {
    font-family: Arial, sans-serif;
    display: flex;
    flex-direction: column;
}

main {
    flex: 1;
    margin-left: 300px;
    margin-top: 110px;
    overflow-y: auto;
    padding: 20px;
    height: calc(100% - 130px); 
}

.title-container {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.title-container h1 {
    margin-right: 20px;
    font-weight: bold;
}

.select-box {
    position: relative;
    display: inline-block;
    width: 250px;
}

.select-box select {
    width: 100%;
    padding: 10px;
    font-size: 1em;
    border: 1px solid #ddd;
    border-radius: 5px;
    background: #f8f8f8;
}

/* Layout with flexbox */
.content-container {
    display: flex;
    gap: 100px; 
}

/* 수강생 정보 박스 스타일 */
.student-info-box {
    border: 1px solid #ddd;
    padding: 20px;
    margin-bottom: 20px;
    background-color: #f9f9f9;
    border-radius: 5px;
}

.student-info-content {
    display: flex; /* Flexbox로 왼쪽과 오른쪽 나누기 */
    justify-content: space-between; /* 양쪽으로 정렬 */
}

.student-info-left,
.student-info-right {
    width: 48%; /* 각 부분의 너비 설정 */
}

.student-info-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
}

.student-info-detail {
    margin-bottom: 8px;
    font-size: 14px;
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 10px;
    text-align: center;
}

th {
    background-color: #f4f4f4;
    font-weight: bold;
}

td {
    font-size: 1em;
    color: #333;
    white-space: nowrap; /* 줄바꿈 방지 */
}

</style>
</head>
<body>

    <!-- 메뉴바 연결 -->
    <%@ include file="../../common/header.jsp"%>

    <!-- 사이드바 연결 -->
    <%@ include file="../aside.jsp"%>

    <c:set var="now" value="<%= new java.util.Date() %>" />

    <main>
 	<!-- Main content -->
        <div class="content">
            <h2>출석 조회</h2>
            
            <!-- 수강생 정보 박스 -->
            <div class="student-info-box">
                <div class="student-info-title">수강반 정보</div>
                <div class="student-info-content">
                    <!-- 왼쪽 정보 -->
                    <div class="student-info-left">
                        <div class="student-info-detail">반 명: ${syclass.className}</div>
                        <div class="student-info-detail">담당자: ${syclass.managerName}</div>
                        <div class="student-info-detail">강사: ${syclass.teacherName}</div>
                    </div>
                    
                    <!-- 오른쪽 정보 -->
                    <div class="student-info-right">
                        <div class="student-info-detail"></div>
                        <div class="student-info-detail"></div>
                    </div>
                </div>
            </div>
            
            <!-- 출석 정보 테이블 -->
            <table>
                <thead>
                    <tr>
                        <th>날짜</th>
                        <th>교시</th>
                        <th>교시 별 출석</th>
                        <th>최종출석</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="date" items="${attendanceDates}">
                        <c:set var="finalKey" value="${student.memberNo}-${date}" />
                        <c:set var="finalStatusDisplayed" value="false" />
                        <tr>
                            <td rowspan="${fn:length(periods) + 1}">${date}</td> <!-- 날짜 정보는 교시 수 + 1만큼 rowspan -->
                            <td colspan="4"></td> <!-- 첫 행은 비워둠 -->
                        </tr>
                        <c:forEach var="period" items="${periods}">
                            <tr>
                                <td>${period.periodName}</td> <!-- 교시 정보 -->

								<c:set var="dateStr" value="${date.toString()}" />
								
								<c:set var="key" value="${student.memberNo}-${dateStr}" />
								
								<td>
								<!-- 교시별 출석 상태를 추적하는 플래그 -->
    							<c:set var="foundAttendance" value="false" />
								    <c:forEach var="attendance" items="${studentAttendanceMap[key]}">
								        <c:if test="${attendance.periodNo == period.periodNo}">
								            <c:choose>
								                <c:when test="${attendance.attendanceStatus == '지각'}">△</c:when>
								                <c:when test="${attendance.attendanceStatus == '출석'}">◯</c:when>
								                <c:when test="${attendance.attendanceStatus == '결석'}">✕</c:when>
								                <c:when test="${attendance.attendanceStatus == '조퇴'}">/</c:when>
								                <c:otherwise>-</c:otherwise>
								            </c:choose>
								            <!-- 출석 상태가 발견된 경우 플래그를 true로 설정 -->
            									<c:set var="foundAttendance" value="true" />
								        </c:if>
								    </c:forEach>
								    <!-- attendance가 없을 경우 대체 표시를 출력 -->
								    <c:if test="${!foundAttendance}">
								        -
								    </c:if>
								</td>

                                <td>
                                    <c:if test="${!finalStatusDisplayed}">
                                        ${finalAttendanceMap[finalKey]}
                                        <c:set var="finalStatusDisplayed" value="true" />
                                    </c:if>
                                </td> <!-- 최종 출석은 날짜별로 한 번만 출력 -->
                                <td>
                                    <c:forEach var="attendance" items="${studentAttendanceMap[key]}">
                                        <c:if test="${attendance.periodNo == period.periodNo}">
                                            <c:out value="${attendance.memo}" />
                                        </c:if>
                                    </c:forEach>
                                </td> <!-- 비고 -->
                            </tr>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>
            
        </div>
    </main>

    <!-- 푸터 연결 -->
    <%@ include file="../../common/footer.jsp"%>
    
<script>

</script>

</body>
</html>
