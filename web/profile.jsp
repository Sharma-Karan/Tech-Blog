<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page errorPage="ErrorPage.jsp" %>
<%@page import="com.tech.blog.entities.User"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="js/myjs.js" type="text/javascript"></script>
        <style>
            .banner-backgroud{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 65% 92%, 30% 100%, 1% 90%, 0 0);
            }
        </style>

    </head>
    <body>
        <!-- navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-desktop"></span> TechnicalBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> <span class="fa fa-mortar-board"></span>Learn Code <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-caret-square-o-down"></span>Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-tty"></span>Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-astrick"></span>Do Post</a>
                    </li>


                </ul>
                <ul class="nav navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-id-card-o"></span><%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
                    </li>
                </ul>

            </div>
        </nav>



        <!-- End -->




        <!--- Main body of Page -->
        <main>
            <div class="container">
                <div class="row mt-4">
                    <div class="col-md-4">
                        <!--Cateories-->
                        <div class="list-group">
                            <a href="#" class="list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <%
                                PostDao d=new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1=d.getCategories();
                                for(Category cc:list1)
                                {
                            %>
                            <a href="#" class="list-group-item list-group-item-action"><%= cc %></a>
                            <%}%>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <!--Posts-->
                    </div>
                </div>
            </div>
        </main>
        <!-- End-->



        <!-- Start of profile Modal-->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-titl " id="exampleModalLabel">TechnicalBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width:150px">
                            <br/>
                            <h5 class="modal-title" id="modallibrary"><%= user.getName()%></h5>
                        </div>
                        <table class="table">

                            <tbody>
                                <tr>
                                    <th scope="row">ID</th>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Email</th>
                                    <td><%=user.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td><%=user.getGender()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Registerd on:</th>
                                    <td><%=user.getDateTime().toString()%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Okay</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End of profile model-->


        <!--Start Post Modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the Post Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled="">---Select Category---</option>
                                    <!--
                                    PostDao postd=new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list=postd.getCategories();
                                    for(Category c:list)
                                    {
                                    -->
                                    <option value="1">Java Programming</option>
                                    <option value="2">Python Programming</option>
                                    <option value="3">Web Technology</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" name="posttitle" placeholder="Enter Post Title" class="form-control">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="pcontent" style="height:200px;" placeholder="Enter your Content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="pprogram" style="height:200px;" placeholder="Enter your Program.If any."></textarea>
                            </div>
                            <div class="form-group">
                                <label>select your pic</label>
                                <br/>
                                <input type="file" name="ppic" placeholder="Enter your Pic">
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>
        <!--End Post model-->


        <script src="https://code.jquery.com/jquery-3.5.1.min.js" 
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>   
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous"></script>
        <!-- Now add post js -->
        <script>
            $(document).ready(function (e) {

                $("#add-post-form").on("submit", function (event) {
                    //this form is being called when form is submitted
                    event.preventDefault();
                    console.log("you Have Clicked on submit...")

                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR)
                        {
                            console.log(data)
                            if (data.trim() == 'Success')
                            {
                                swal("Good job!", "Saved Successfully!", "success");
                            } else
                            {
                                swal("Error!", "Something went Wrong!", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {},
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>


    </body>
</html>
