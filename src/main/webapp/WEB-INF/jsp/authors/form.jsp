<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Author Form - Library Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">📚 Library Management System</div>
        <div class="navbar-menu">
            <a href="${pageContext.request.contextPath}/" class="nav-link">Dashboard</a>
            <a href="${pageContext.request.contextPath}/authors" class="nav-link active">Authors</a>
            <a href="${pageContext.request.contextPath}/books" class="nav-link">Books</a>
        </div>
    </div>
    
    <div class="container">
        <div class="form-header">
            <h1>
                <c:choose>
                    <c:when test="${author.id != null}">
                        Edit Author
                    </c:when>
                    <c:otherwise>
                        Add New Author
                    </c:otherwise>
                </c:choose>
            </h1>
        </div>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        
        <form:form action="${pageContext.request.contextPath}/authors" method="POST" modelAttribute="author" class="form-container">
            <c:if test="${author.id != null}">
                <input type="hidden" name="id" value="${author.id}">
            </c:if>
            
            <div class="form-group">
                <label for="name">Author Name *</label>
                <form:input path="name" id="name" class="form-control" placeholder="Enter author name" required="true"/>
            </div>
            
            <div class="form-group">
                <label for="email">Email *</label>
                <form:input path="email" id="email" type="email" class="form-control" placeholder="Enter email address" required="true"/>
            </div>
            
            <div class="form-group">
                <label for="country">Country</label>
                <form:input path="country" id="country" class="form-control" placeholder="Enter country of origin"/>
            </div>
            
            <div class="form-group">
                <label for="birthYear">Birth Year</label>
                <form:input path="birthYear" id="birthYear" type="number" class="form-control" placeholder="Enter birth year" min="1000" max="2024"/>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <c:choose>
                        <c:when test="${author.id != null}">
                            Update Author
                        </c:when>
                        <c:otherwise>
                            Add Author
                        </c:otherwise>
                    </c:choose>
                </button>
                <a href="${pageContext.request.contextPath}/authors" class="btn btn-secondary">
                    Cancel
                </a>
            </div>
        </form:form>
    </div>
</body>
</html>
