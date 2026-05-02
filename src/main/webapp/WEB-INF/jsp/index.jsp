<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Library Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">📚 Library Management System</div>
        <div class="navbar-menu">
            <a href="${pageContext.request.contextPath}/" class="nav-link active">Dashboard</a>
            <a href="${pageContext.request.contextPath}/authors" class="nav-link">Authors</a>
            <a href="${pageContext.request.contextPath}/books" class="nav-link">Books</a>
        </div>
    </div>
    
    <div class="container">
        <div class="dashboard-header">
            <h1>Library Dashboard</h1>
            <p>Welcome to the Library Management System</p>
        </div>
        
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon">👥</div>
                <div class="stat-content">
                    <div class="stat-number">${totalAuthors}</div>
                    <div class="stat-label">Total Authors</div>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon">📖</div>
                <div class="stat-content">
                    <div class="stat-number">${totalBooks}</div>
                    <div class="stat-label">Total Books</div>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon">✅</div>
                <div class="stat-content">
                    <div class="stat-number">${availableBooks}</div>
                    <div class="stat-label">Available Books</div>
                </div>
            </div>
        </div>
        
        <div class="quick-actions">
            <h2>Quick Actions</h2>
            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/authors/new" class="action-btn">
                    ➕ Add Author
                </a>
                <a href="${pageContext.request.contextPath}/books/new" class="action-btn">
                    ➕ Add Book
                </a>
                <a href="${pageContext.request.contextPath}/authors" class="action-btn">
                    👁️ View Authors
                </a>
                <a href="${pageContext.request.contextPath}/books" class="action-btn">
                    👁️ View Books
                </a>
            </div>
        </div>
    </div>
</body>
</html>
