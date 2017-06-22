<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="E_Commerce_Site.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8" />
    <meta name="author" content="Nasir Islam Sujan" />
    <link rel="stylesheet" href="~/css/main.css" type="text/css" />
    

</head>
<body>
    <form id="form1" runat="server">
        
        <div class="container">
            <asp:Image ID="usericon" ImageUrl="~/images/user.png" AlternateText="User Icon"  runat="server"/>
            <br />
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter username"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter password" TextMode="Password" ></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="LoginButtonClickPerformed"/>
            <br />
            <br />
            <asp:Label ID="lblStatus" CssClass="label" runat="server" ></asp:Label>
        </div>

    </form>
</body>
</html>
