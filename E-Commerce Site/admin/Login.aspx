<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="E_Commerce_Site.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8" />
    <meta name="author" content="Nasir Islam Sujan" />
    
    <style>
        * {
            box-sizing: border-box !important;
        }

    </style>
    <link rel="stylesheet" href="../css/loginStyle.css" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <h1 style="text-align: center; color: #777; font-family: Garamond;">Login to admin panel</h1>

        <div class="container">
            <asp:Image ID="usericon" CssClass="img-style" ImageUrl="~/images/male_user.png" AlternateText="User Icon" runat="server" />
            <br />
            <asp:TextBox ID="txtUsername" CssClass="username" runat="server" placeholder="Enter username"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Username required" ControlToValidate="txtUsername">&nbsp;</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtPassword" CssClass="password" runat="server" placeholder="Enter password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Password required" ControlToValidate="txtPassword">&nbsp;</asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="LoginButtonClickPerformed" />
            <br />
            <br />
            <asp:Label ID="lblStatus" CssClass="label" runat="server"></asp:Label>
        </div>

        <div class="validation-summary">
            <asp:ValidationSummary ID="vs1" runat="server" />
        </div>
    </form>
</body>
</html>
