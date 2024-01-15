<%@ page import="com.entities.Note" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Note</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>
<%@ include file="navbar.jsp"%>

<%
    Note note = (Note) request.getAttribute("note");
%>
<br>
<h1 style="text-align: center">Please Edit your <span style="color: cornflowerblue">Note</span> details</h1>

<div class="container">
    <form action="EditNote" method="post">
        <input type="hidden" name="note_id" value="<%=note.getId()%>">
        <div class=" mb-3">
            <label for="title" style="color: darkblue" class="form-label  fs-5 ">Note title</label>
            <input type="text" class="form-control" id="title" name="title" value="<%=note.getTitle()%>" required>
        </div>
        <div class="mb-3">
            <label for="content" style="color: darkblue" class="form-label  fs-5">Note Details</label>
            <textarea class="form-control" id="content" name="content" rows="8" required><%=note.getContent()%>
            </textarea>
        </div>

        <button type="submit" class="btn btn-primary">Save to update</button>

    </form>


</div>

</body>
</html>
