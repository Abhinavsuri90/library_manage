<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error - Library Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">📚 Library Management System</div>
        <div class="navbar-menu">
            <a href="${pageContext.request.contextPath}/" class="nav-link">Dashboard</a>
            <a href="${pageContext.request.contextPath}/authors" class="nav-link">Authors</a>
            <a href="${pageContext.request.contextPath}/books" class="nav-link">Books</a>
        </div>
    </div>
    
    <div class="container">
        <div class="error-page">
            <div class="error-icon">⚠️</div>
            <h1>Oops! Something went wrong</h1>
            
            <div class="error-message">
                <p><strong>Error:</strong> ${errorMessage}</p>
                <p><strong>Status:</strong> ${status}</p>
                <p><strong>Timestamp:</strong> ${timestamp}</p>
            </div>
            
            <div class="error-actions">
                <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                    Go to Dashboard
                </a>
                <a href="javascript:history.back()" class="btn btn-secondary">
                    Go Back
                </a>
            </div>
            
            <p class="error-hint">
                If this problem persists, please contact the administrator or try again later.
            </p>
        </div>
    </div>
</body>
</html>
