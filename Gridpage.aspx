<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridPage.aspx.cs" Inherits="WebApplication1.GridPage" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    

    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2022.2.510/styles/kendo.default-ocean-blue.min.css" />

   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script src="https://kendo.cdn.telerik.com/2022.2.510/js/kendo.all.min.js"></script>

    <link href="CSS/GridCSS.css" rel="stylesheet" />


</head>
<body>
    <div class="row">
        <div class="col-md-12">
            <div id="grid"></div>
        </div>
    </div>
</body>


<script>
    $(document).ready(function () {
        debugger
        $.ajax({
            method: "POST",
            url: "GridPage.aspx/GetEmpData",
            contentType: 'application/json; charset=utf-8',
            //dataType: "json",
            data: '',
            success: function (result) {
                debugger
                if (result.d != "") {
                    loadgrid(JSON.parse(result.d));
                }
            }
        });
    });

    function loadgrid(data) {
        debugger
        $("#grid").kendoGrid({
            toolbar: ["search", "pdf"],
            filterable: false,
            pageable: {
                input: true,
                numeric: false
            },

            columns: [{
                field: "Name",
                title: "Name",
                headerAttributes: { "class": "wrap-header" }

            }, {
                field: "mail",
                title: "Mail",

            }, {
                field: "Phone",
                title: "Contact Number",

            }, {
                field: "department_name",
                title: "Department",

            }, {
                field: "designation_name",
                title: "Designation",

            }, {
                field: "doj",
                title: "Date of Joining",

            }, {
                field: "created_on",
                title: "Created On",

            }, {
                field: "created_by",
                title: "Created By",

            },
            { command: "destroy", title: "&nbsp;", width: 120 }],
        });
    }
</script>
</html>
