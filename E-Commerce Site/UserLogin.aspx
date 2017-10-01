<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="E_Commerce_Site.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="~/css/userlogin.css" />

</head>
<body>
    
    <div class="container">
        <div class="top">
            <h1 class="title">Login</h1>
        </div>
        <form id="form1" runat="server">
            <asp:TextBox ID="txtUsername" placeholder="Enter username" CssClass="text-field first" runat="server" ></asp:TextBox>
            <br />
            <asp:TextBox ID="txtPassword" placeholder="Enter password" TextMode="Password" CssClass="text-field" runat="server" ></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login"/>
            <br />
            <asp:Label ID="status" runat="server" CssClass="status-report"></asp:Label>
            <br />
            <div class="bottom">
                <asp:Label ID="redirectToReg" CssClass="redirect-to-reg" runat="server">Don't have an account? <a href="Registration.aspx">click here</a></asp:Label>
            </div>
        </form>
    </div>
</body>
</html>
