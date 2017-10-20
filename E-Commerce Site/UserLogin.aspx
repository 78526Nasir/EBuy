<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="E_Commerce_Site.UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="~/css/userlogin.css" />
    <script src="script/loginValidation.js"></script>
</head>
<body>

    <div class="container">
        <div class="top">
            <h1 class="title">Login</h1>
        </div>
        <form id="form1" runat="server">
            <asp:TextBox ID="txtUsername" placeholder="Enter username" CssClass="text-field first" runat="server" onblur="usernameValidation()"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username required">&nbsp;</asp:RequiredFieldValidator>

            <br />
            <asp:TextBox ID="txtPassword" placeholder="Enter password" TextMode="Password" CssClass="text-field" runat="server" onblur="passwordValidation()"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password required">&nbsp;</asp:RequiredFieldValidator>
            <p>Forget <a href="#">password?</a></p>

            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="LoginButtonClickPerformed" />
            <br />
            <asp:Label ID="status" runat="server" CssClass="status-report"></asp:Label>
            <br />
            <div class="bottom">
                <asp:Label ID="redirectToReg" CssClass="redirect-to-reg" runat="server">Don't have an account? <a href="Registration.aspx">click here</a></asp:Label>
            </div>
            
            <div class="validation-summary">
                <asp:ValidationSummary ID="vs" runat="server" />
            </div>
        </form>

        
    </div>
</body>
</html>
