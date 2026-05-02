<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Authors - Library Management System</title>
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
        <div class="page-header">
            <h1>Authors Management</h1>
            <a href="${pageContext.request.contextPath}/authors/new" class="btn btn-primary">
                ➕ Add New Author
            </a>
        </div>
        
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        
        <c:if test="${empty authors}">
            <div class="alert alert-info">
                No authors found. <a href="${pageContext.request.contextPath}/authors/new">Add one now</a>
            </div>
        </c:if>
        
        <c:if test="${not empty authors}">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Country</th>
                        <th>Birth Year</th>
                        <th>Books Count</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="author" items="${authors}">
                        <tr>
                            <td>${author.id}</td>
                            <td>${author.name}</td>
                            <td>${author.email}</td>
                            <td>${author.country}</td>
                            <td>${author.birthYear}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty author.books}">
                                        ${author.books.size()}
                                    </c:when>
                                    <c:otherwise>
                                        0
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/authors/edit/${author.id}" class="btn btn-sm btn-info">
                                    Edit
                                </a>
                                <form action="${pageContext.request.contextPath}/authors/${author.id}/delete" method="POST" class="inline-form">
                                    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</body>
</html>
