<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="E_Commerce_Site.admin.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Profile</title>
    <meta name="author" content="Nasir Islam Sujan" />
    <link rel="stylesheet" href="../css/adminProfile.css" type="text/css"/>

</head>
<body>
    <form id="form1" runat="server">

    <div id="header">
        <h1 id="title">Admin Profile</h1>    
        <asp:Button ID="btnAdminPanel" runat="server" Text="Back to panel" />

    </div>
    <div id="container">
        <div id="left-container">
            <div id="img-container">

            </div>
            <div id="name-container">

            </div>
        </div>
            
        <div id="right-container">

        </div>

    </div>
    </form>
</body>
</html>
