<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainpage.aspx.cs" Inherits="WebApplication1.mainpage" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css' rel='stylesheet'>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="StyleSheet1.css" />

    <style type="text/css">
        .card {
            background-color: aliceblue;
            border: none;
            box-shadow: 1px 1px 20px 0px #6ab5fc;
            border-radius: 5px;
            padding: 25px 25px 25px 25px;
        }

        .button {
            background-color:;
            border: none;
            color: white;
            padding: 16px 32px;
            text-align: center;
            font-size: 16px;
            margin: 4px 2px;
            opacity: 0.7;
            transition: 0.2s;
            display: inline-block;
            text-decoration: none;
            cursor: pointer;
        }

            .button:hover {
                opacity: 1
            }

        .bounce-in {
            animation: bounce-in 2s ease;
        }

        @keyframes bounce-in {
            0% {
                opacity: 0;
                transform: scale(.3);
            }

            50% {
                opacity: 1;
                transform: scale(1.05);
            }

            70% {
                transform: scale(.9);
            }

            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <br />


    <%--<div class="col-lg-12 login-title">
    </div>--%>
    <div class="container">

        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 login-key">
                    <i class="fa fa-key" aria-hidden="true"></i>
                </div>


                <br />
                <div class="col-lg-12 login-form card bounce-in">
                    <div class="col-lg-12 login-form">
                        <form id="form1" runat="server">
                            <h3 class="text-center">EMPLOYEE REGISTERATION
                            </h3>
                            <hr style="height: 2px; color: #1c1acc; background-color: #2926e6" />
                            <div class="form-group">
                                <label class="form-control-label">Name</label>
                                <asp:TextBox ID="name" runat="server" class="form-control" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">E-mail</label>
                                <asp:TextBox ID="Email" runat="server" CssClass="form-control" required="required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label class="form-control-label">Contact Number</label>
                                <asp:TextBox ID="Phone" runat="server" CssClass="form-control" required="required" pattern="^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$"></asp:TextBox><br />
                                <div class="dropdown">
                                    <label class="form-control-label">Departments</label><br />
                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" required="required"></asp:DropDownList>
                                </div>
                                <br>
                                <div class="dropdown">
                                    <label class="form-control-label">Designation</label><br />

                                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" required="required"></asp:DropDownList>
                                </div>
                                <br />
                                <div>
                                    <label class="form-control-label">Date of Joining</label>
                                    <asp:TextBox ID="doj" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <br>
                                <div style="text-align: center;">
                                    <div class="button">
                                        <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

</body>
<script>
    $(document).ready(function () {

        $(function () {
            $("#doj").datepicker({
                dateFormat: 'yy-mm-dd'
            });
        });
    })
</script>
</html>
