<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="E_Commerce_Site.UI.Profile" MasterPageFile="~/UI/Index.Master" %>



<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <link rel="stylesheet" href="../css/userProfile.css" />

    <script src="../script/editButton.js" type="text/javascript"></script>

    <script>
        var bool=<%=flagForImage%>;

        function IsValidImage() {
            var imgEle = document.getElementById("imgAdmin");
            if (bool === 1) {
                imgEle.onerror = errorHandler(imgEle);
                bool = 0;
            }
        }

        function errorHandler(img) {
            img.src = "../images/error.png";
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="header">
            <div class="left-header">
                <h1 class="title">User Profile</h1>
            </div>

            <div class="right-header">
                <asp:Button ID="btnHomePage" Text="Home Page" CssClass="btn" runat="server" OnClick="btnHomePage_Click"/>
            </div>
        </div>

        <div class="container">
            <div class="left-container">
                <div class="img-container">
                    <asp:Image ID="imgUser" ImageUrl="~/images/error.png" runat="server" CssClass="user-image" AlternateText="User Image" />
                </div>
                <%--<div id="changeImg">
                    <label class="choose-file">
                        Choose File
                        <asp:FileUpload CssClass="file-upload" ID="imageUpload" runat="server" />
                    </label>
                </div>-- %>

                <div class="name-container">
                    <asp:Label ID="lblUsernamOnImage" runat="server">Name</asp:Label>
                </div>
            </div>

            <div class="right-container">
                <div class="main-content">
                    <table class="tblAdminProfile">
                        <tr>
                            <td>
                                <asp:Label ID="lblUsername" runat="server" CssClass="label">Username</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="text-field" disabled="true"></asp:TextBox>
                            </td>
                            <td>
                                <input type="button" runat="server" value="Edit" id="btnUEdit" class="btn-edit" onclick="btnUEditClick()" />
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblFullName" runat="server" CssClass="label">Fullname</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="text-field" disabled="true"></asp:TextBox>
                            </td>
                            <td>
                                <input type="button" runat="server" value="Edit" id="btnFNEdit" class="btn-edit" onclick="btnFNEditClick()" />
                            </td>
                        </tr>

                         <tr>
                            <td>
                                <asp:Label ID="lblEmail" runat="server" CssClass="label">Email</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="text-field" disabled="true"></asp:TextBox>
                            </td>
                            <td>
                                <input type="button" runat="server" value="Edit" id="btnEEdit" class="btn-edit" onclick="btnEEditClick()" />
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblDOB" runat="server" CssClass="label">Date Of Birth</asp:Label>
                            </td>
                            <td>
                                <input id="txtDOB" type="datetime" runat="server" class="text-field" min="1950-01-01" max="2000-12-31" disabled="disabled"/>
                            </td>
                            <td>
                                <input type="button" runat="server" value="Edit" id="btnDOBEdit" class="btn-edit" onclick="btnDOBEditClick()" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <asp:Label ID="lblReligion" runat="server" CssClass="label">Religion</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtReligion" runat="server" CssClass="text-field" disabled="true"></asp:TextBox>
                            </td>
                            <td>
                                <input type="button" runat="server" value="Edit" id="btnReligionEdit" class="btn-edit" onclick="btnREditClick()" />
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblGender" runat="server" CssClass="label">Gender</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="ddl" Enabled="false">
                                    <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="button" runat="server" value="Edit" id="btnGenderEdit" class="btn-edit" onclick="btnGEditClick()" />
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblPassword" runat="server" CssClass="label">Password</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="text-field" disabled="true"></asp:TextBox>
                            </td>
                            <td>
                                <input type="button" runat="server" value="Edit" id="btnPEdit" class="btn-edit" onclick="btnPEditClick()" />
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnUpdate" CssClass="btnUpdate" Text="Update" disabled="true" runat="server" OnClick="btnUpdate_Click" />
                </div>
            </div>

        </div>
    </form>

    <div class="copyright">
        <code>This project is designed and developed by <strong><a href="https://github.com/78526Nasir">Nasir islam Sujan</a> &copy;</strong>2017</code>
    </div>

    <script>
        IsValidImage();
    </script>
</body>
</html>--%>
