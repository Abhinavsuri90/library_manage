<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Form - Library Management System</title>
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
        <div class="form-header">
            <h1>
                <c:choose>
                    <c:when test="${book.id != null}">
                        Edit Book
                    </c:when>
                    <c:otherwise>
                        Add New Book
                    </c:otherwise>
                </c:choose>
            </h1>
        </div>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        
        <form:form action="${pageContext.request.contextPath}/books" method="POST" modelAttribute="book" class="form-container">
            <c:if test="${book.id != null}">
                <input type="hidden" name="id" value="${book.id}">
            </c:if>
            
            <div class="form-group">
                <label for="title">Book Title *</label>
                <form:input path="title" id="title" class="form-control" placeholder="Enter book title" required="true"/>
            </div>
            
            <div class="form-group">
                <label for="isbn">ISBN *</label>
                <form:input path="isbn" id="isbn" class="form-control" placeholder="Enter ISBN" required="true"/>
            </div>
            
            <div class="form-group">
                <label for="publicationDate">Publication Date *</label>
                <form:input path="publicationDate" id="publicationDate" type="date" class="form-control" required="true"/>
            </div>
            
            <div class="form-group">
                <label for="authorId">Author *</label>
                <select name="author.id" id="authorId" class="form-control" required="true">
                    <option value="">Select Author</option>
                    <c:forEach var="author" items="${authors}">
                        <option value="${author.id}" <c:if test="${book.author.id == author.id}">selected</c:if>>
                            ${author.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-group">
                <label for="availability">Availability</label>
                <form:checkbox path="availability" id="availability"/> Available for borrowing
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <c:choose>
                        <c:when test="${book.id != null}">
                            Update Book
                        </c:when>
                        <c:otherwise>
                            Add Book
                        </c:otherwise>
                    </c:choose>
                </button>
                <a href="${pageContext.request.contextPath}/books" class="btn btn-secondary">
                    Cancel
                </a>
            </div>
        </form:form>
    </div>
</body>
</html>
