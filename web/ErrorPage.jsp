<%@page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry!Something went wrong.</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-backgroud{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 65% 92%, 30% 100%, 1% 90%, 0 0);
            }
            </style>
    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid"/>
            
            <h3>Sorry!Something Went Wrong</h3>
            <br/>
            <%= exception%>
            <br/>
            <a class="btn primary-background btn-lg text-white mt-3" href="index.jsp">Home</a>
        </div>
    </body>
</html>
