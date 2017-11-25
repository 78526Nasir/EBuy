<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="E_Commerce_Site.UI.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <link rel="stylesheet" href="../css/changePassword.css" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <h1>Change Password</h1>
            <table class="table">
                <tr>
                    <td>
                        <asp:Label CssClass="label" ID="lblNewPassword" runat="server">New password</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="text-box" TextMode="Password" placeholder="Enter new password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="New password required">&nbsp;
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtNewPassword"
                            ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}"
                            ErrorMessage="Password must contain:<br/> Minimum 8 characters <br/> atleast 1 UpperCase Alphabet <br/> 1 LowerCase Alphabet <br/> 1 Number <br/> 1 Special Character" Display="Dynamic">&nbsp;
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="label" ID="lblConfirmPassword" runat="server">Confirm new password</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="text-box" TextMode="Password" placeholder="Enter Confirm password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm new password required">&nbsp;
                        </asp:RequiredFieldValidator>

                        <asp:CompareValidator ID="cv1" runat="server" ErrorMessage="New password and confirm new password not match" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword">&nbsp;
                        </asp:CompareValidator>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnChangePassword" runat="server" CssClass="button" Text="Change Password" OnClick="btnChangePassword_Click" />
            <br/>
            <asp:Label ID="lblStatus" CssClass="status" runat="server"></asp:Label>
        </div>

        <div class="validation-summary">
            <asp:ValidationSummary ID="vs1" runat="server" />
        </div>

    </form>
</body>
</html>
