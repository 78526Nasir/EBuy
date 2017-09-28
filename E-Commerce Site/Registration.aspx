<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="E_Commerce_Site.Registration" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Registration</title>
    <meta name="author" content="Nasir Islam Sujan" />
    <link rel="stylesheet" type="text/css" href="~/css/registration.css" />

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
                        <td>
                            <label class="label" id="lblFullName" runat="server">Full Name</label>
                        </td>
                        <td>
                            <input class="text-field" type="text" runat="server" placeholder="Enter full name" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label" id="lblEmail" runat="server">Email</label>
                        </td>
                        <td>
                            <input class="text-field" type="text" runat="server" placeholder="Enter email" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label" id="lblAge" runat="server">Age</label>
                        </td>
                        <td>
                            <input class="text-field" type="text" runat="server" placeholder="Enter age" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label" id="lblReligion" runat="server">Religion</label>
                        </td>
                        <td>
                            <input class="text-field" type="text" runat="server" placeholder="Enter religion" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label" id="lblPassword" runat="server">Password</label>
                        </td>
                        <td>
                            <input class="text-field" type="text" runat="server" placeholder="Enter password" />
                        </td>
                    </tr>
                </table>
                <hr />
                <table class="responsive-table">
                    <tr>
                        <td>
                            <label class="label" id="lblGender" runat="server">Gender</label>
                        </td>
                        <td class="radio-container">
                            <label><input type="radio" class="radio" name="rGender" runat="server" id="rMale" value="Male"/>Male</label>
                        </td>
                        <td class="radio-container">
                            <label><input type="radio" class="radio" name="rGender" runat="server" id="rFemale" value="Male" />Female</label>
                        </td>
                    </tr>
                </table>
                <hr class="hr2"/>
            </div>
            <div class="agreement">
                <input type="checkbox" name="cbAgreement" runat="server" id="cbAgreement" />
                <label for="cbAgreement">I accept all the terms and conditions</label>
            </div>
            <div class="button">
                <input type="submit" runat="server" id="btnRegister" value="Register" />
            </div>
        </div>
    </form>
</body>
</html>
