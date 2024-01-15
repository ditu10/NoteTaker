<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>NoteTaker</title>
  <%@include file="all_js_css.jsp"%>

</head>
<body>
  <%@ include file="navbar.jsp"%>
  <br>
  <div class="container">
    <h1 style="text-align: center">Welcome to <span style="color: cornflowerblue">NoteTaker</span></h1>
    <br>

    <div class="d-flex flex-row mb-3 px-5 align-items-center justify-content-between border">
      <div class="fs-4 px-5">
        <p>NoteTaker is a web-app for creating notes. It's been created using JAVA Servlet & JSP, Hibernate, MySQL and Bootstrap.
          This project is running on the Apache Tomcat server. You can add a new note with a title and note details.
          You can also delete and update your notes at any time.</p>
        <p>Enjoy NoteTaker!!</p>
        <form action="add_note.jsp">
          <button type="submit" class="btn btn-outline-info">Start here</button>
        </form>
      </div>
      <div>
        <img src="./images/notepad.png" style="max-width: 400px" alt="">
      </div>
    </div>




  </div>

</body>
</html>