<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.Note" %>
<%@ page import="java.io.PrintWriter" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Notes</title>
    <%@include file="all_js_css.jsp" %>

</head>
<body>


    <%@ include file="navbar.jsp" %>
    <br>

    <div class="container">
        <h1 style="text-align: center"><span style="color: cornflowerblue">All Notes</span></h1>

        <div>

        <%
            Session s = FactoryProvider.getFactory().openSession();
            Query<Note> q = s.createQuery("from notes",Note.class);
            List<Note> notes = q.list();
            for (Note n : notes) {
        %>

        <div class="card my-3" style="width: 100%">
            <img src="./images/notepad.png" style="max-width:100px" class="card-img-top mx-3 mt-2" alt="...">
            <div class="card-body">
                <h5 class="card-title"><%=n.getTitle()%></h5>
                <p class="card-text"><%=n.getContent()%></p>
                <p><b>Last update : </b><b class="text-primary"><%=n.getAddedDate()%></b></p>
                <a href="/EditNote?note_id=<%=n.getId()%>" class="btn btn-outline-info">Edit</a>
                <a href="/DeleteNote?note_id=<%=n.getId()%>" class="btn btn-outline-danger">delete</a>
            </div>
        </div>
        <%
            }
            s.close();
        %>

    </div>



</body>
</html>
