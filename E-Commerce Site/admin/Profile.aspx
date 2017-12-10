<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="E_Commerce_Site.admin.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Profile</title>
    <meta name="author" content="Nasir Islam Sujan" />
    <link rel="stylesheet" href="../css/adminProfile.css" type="text/css" />
    <script src="../script/editButton.js" type="text/javascript"></script>

    <script>
        var bool=<%=flag%>;

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

        <div id="header">
            <h1 id="title">Admin Profile</h1>
        </div>
        <div id="container">
            <div id="left-container">
                <div id="img-container">
                    <asp:Image ID="imgAdmin" ImageUrl="" runat="server" CssClass="admin-image" AlternateText="Admin Image" />
                </div>
                <%--<div id="changeImg">
                    <label class="choose-file">
                        Choose File
                        <asp:FileUpload CssClass="file-upload" ID="imageUpload" runat="server" />
                    </label>
                </div>--%>
                <div id="name-container">
                    <asp:Label ID="lblAdminName" runat="server">Name</asp:Label>
                </div>
            </div>

            <div id="right-container">
                <div id="right-top">
                    <h1>Profile Details</h1>
                </div>
                <div id="main-content">
                    <table id="tblAdminProfile">
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
                    <asp:Button ID="btnUpdate" Text="Update" disabled="true" runat="server" />
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
</html>
