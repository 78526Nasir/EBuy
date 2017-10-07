<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="E_Commerce_Site.Registration" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Registration</title>
    <meta name="author" content="Nasir Islam Sujan" />
    <link rel="stylesheet" type="text/css" href="~/css/registration.css" />
    <script type="text/javascript" src="script/validation.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="head">
                <h2>Registration</h2>
            </div>
            <div class="body">
                <table class="responsive-table">
                    <tr>
                        <td class="left">
                            <label class="label" id="lblUsername" runat="server">Username</label>
                        </td>
                        <td class="right">
                            <asp:TextBox CssClass="text-field" name="User" runat="server" ID="txtUsername" placeholder="Enter username" onblur="usernameValidation();">
                            </asp:TextBox>
                        </td>
                        <td class="alert">
                            <span id="unAlert" class="alert-span">&#9888;</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            <label class="label" id="lblFullName" runat="server">Full Name</label>
                        </td>
                        <td  class="right">
                            <asp:TextBox CssClass="text-field" runat="server" ID="txtFullName" placeholder="Enter full name" onblur="fullNameValidation();">
                            </asp:TextBox>
                        </td>
                        <td class="alert">
                            <span id="fnAlert" class="alert-span">&#9888;</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            <label class="label" id="lblEmail" runat="server">Email</label>
                        </td>
                        <td  class="right">
                            <asp:TextBox CssClass="text-field" TextMode="Email" ID="txtEmail" runat="server" placeholder="Enter email" onblur="emailValidation();">
                            </asp:TextBox>
                        </td>
                        <td class="alert">
                            <span id="eAlert" class="alert-span">&#9888;</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            <label class="label" id="lblAge" runat="server">Date of Birth</label>
                        </td>
                        <td  class="right">
                            <input class="text-field dob fixed" type="date" id="txtDOB" max="2000-12-31" runat="server" placeholder="Enter date of Birth" onblur="dobValidation();"/>
                        </td>
                        <td class="alert">
                            <span id="dobAlert" class="alert-span">&#9888;</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            <label class="label" id="lblReligion" runat="server">Religion</label>
                        </td>
                        <td class="right">
                            <asp:TextBox CssClass="text-field" runat="server" ID="txtReligion" placeholder="Enter religion" onblur="religionValidation();">
                            </asp:TextBox>
                        </td>
                        <td class="alert">
                            <span id="rAlert" class="alert-span">&#9888;</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            <label class="label" id="lblPassword" runat="server">Password</label>
                        </td>
                        <td class="right">
                            <asp:TextBox class="text-field" TextMode="password" ID="txtPassword" runat="server" placeholder="Enter password" onblur="passwordValidation();">
                            </asp:TextBox>
                        </td>
                        <td class="alert">
                            <span id="pAlert" class="alert-span">&#9888;</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            <label class="label" id="lblConfirmPassword" runat="server">Confirm Password</label>
                        </td>
                        <td class="right">
                            <asp:TextBox class="text-field" TextMode="password" ID="txtConfirmPassword" runat="server" placeholder="Reenter password" onblur="confirmPasswordValidation();"></asp:TextBox>
                        </td>
                        <td class="alert">
                            <span id="cpAlert" class="alert-span">&#9888;</span>
                        </td>
                    </tr>
                </table>
                <table class="responsive-table">
                    <tr>
                        <td class="left">
                            <label class="label" id="lblGender" runat="server">Gender</label>
                        </td>
                        <td class="radio-container">
                            <label><input type="radio" class="radio" name="rGender" runat="server" id="rMale" value="Male" onblur="genderValidation();" />Male</label>
                        </td>
                        <td class="radio-container">
                            <label><input type="radio" class="radio" name="rGender" runat="server" id="rFemale" value="Male" onblur="genderValidation();"/>Female</label>
                        </td>
                        <td class="alert">
                            <span id="gAlert" class="alert-span">&#9888;</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="agreement">
                <input type="checkbox" name="cbAgreement" runat="server" id="cbAgreement" />
                <label for="cbAgreement">I accept all the terms and conditions</label>
            </div>
            <div class="button">
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="registerButtonClickPerformed" />
            </div>
        </div>
    </form>
</body>
</html>
