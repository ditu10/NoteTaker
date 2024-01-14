
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Note</title>
    <%@include file="all_js_css.jsp"%>

</head>
<body>
    <%@ include file="navbar.jsp"%>
    <br>
    <h1 style="text-align: center">Please fill your <span style="color: cornflowerblue">Note</span> details</h1>

    <div class="container">
        <form action="SaveNoteDetails" method="post">
            <div class=" mb-3">
                <label for="title" style="color: darkblue" class="form-label  fs-5 ">Note title</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <div class="mb-3">
                <label for="content" style="color: darkblue" class="form-label  fs-5">Note Details</label>
                <textarea class="form-control" id="content" name="content" rows="8" required></textarea>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>

        </form>


    </div>

</body>
</html>