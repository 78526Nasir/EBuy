<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Redirect.aspx.cs" Inherits="E_Commerce_Site.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Redirect</title>
    <meta charset="utf-8" />

    <style>
        p{
            font:14px consolas;
            color:#434343;
        }
        p a{
            text-decoration:none;
            color:blue;
            font-weight:bold;
        }
        p a:hover{
            text-decoration:underline;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <p>Redirect to <a href="UserLogin.aspx">Login Page</a></p>
    </div>
    </form>
</body>
</html>
