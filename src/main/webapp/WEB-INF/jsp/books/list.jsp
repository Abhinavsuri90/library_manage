<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Books - Library Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">📚 Library Management System</div>
        <div class="navbar-menu">
            <a href="${pageContext.request.contextPath}/" class="nav-link">Dashboard</a>
            <a href="${pageContext.request.contextPath}/authors" class="nav-link">Authors</a>
            <a href="${pageContext.request.contextPath}/books" class="nav-link active">Books</a>
        </div>
    </div>
    
    <div class="container">
        <div class="page-header">
            <h1>Books Management</h1>
            <a href="${pageContext.request.contextPath}/books/new" class="btn btn-primary">
                ➕ Add New Book
            </a>
        </div>
        
        <div class="search-box">
            <form action="${pageContext.request.contextPath}/books/search" method="GET" class="search-form">
                <input type="text" name="keyword" placeholder="Search books by title..." class="form-control" value="${keyword}">
                <button type="submit" class="btn btn-secondary">Search</button>
                <a href="${pageContext.request.contextPath}/books" class="btn btn-light">Clear</a>
            </form>
        </div>
        
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        
        <c:if test="${empty books}">
            <div class="alert alert-info">
                No books found. <a href="${pageContext.request.contextPath}/books/new">Add one now</a>
            </div>
        </c:if>
        
        <c:if test="${not empty books}">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>ISBN</th>
                        <th>Author</th>
                        <th>Publication Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${books}">
                        <tr>
                            <td>${book.id}</td>
                            <td>${book.title}</td>
                            <td>${book.isbn}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty book.author}">
                                        ${book.author.name}
                                    </c:when>
                                    <c:otherwise>
                                        N/A
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <fmt:formatDate value="${book.publicationDate}" pattern="dd/MM/yyyy"/>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${book.availability}">
                                        <span class="badge badge-success">Available</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge badge-danger">Not Available</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/books/edit/${book.id}" class="btn btn-sm btn-info">
                                    Edit
                                </a>
                                <form action="${pageContext.request.contextPath}/books/${book.id}/delete" method="POST" class="inline-form">
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
