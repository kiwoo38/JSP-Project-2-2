<%--
  Created by IntelliJ IDEA.
  User: gimgiu
  Date: 2025. 11. 23.
  Time: AM 7:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>자유 게시판</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      margin: 0;
      background-color: #f5f5f5;
    }

    /* 상단바 */
    .site-header {
      background-color: #d8a210;
      padding: 18px 40px;
    }

    .site-header-inner {
      max-width: 1200px;
      margin: 0 auto;
      display: flex;
      align-items: center;
    }

    .site-logo {
      width: 70px;
      height: 70px;
      object-fit: cover;
      margin-right: 20px;
      border-radius: 8px;
    }

    .site-title {
      color: #ffffff;
      font-size: 2.2rem;
      font-weight: 800;
      letter-spacing: 0.05em;
    }
  </style>
</head>

<body>

<header class="site-header">
  <div class="site-header-inner">
    <img src="images/logo.png" alt="Logo" class="site-logo">
    <div class="site-title">자유게시판</div>
  </div>
</header>
<div class="container mt-4">