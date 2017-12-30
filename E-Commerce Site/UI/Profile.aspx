<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="E_Commerce_Site.UI.Profile" MasterPageFile="~/UI/Index.Master" %>

<asp:Content ID="profileMiddle" ContentPlaceHolderID="cphMiddle" runat="server">
    <p class="profile-middle">Profile</p>
</asp:Content>

<asp:Content ID="prodileBody" ContentPlaceHolderID="cphBody" runat="server">
    <div class="profile-container">

        <div class="pr-left-container">
            <div class="pr-img-container">
                <asp:Image ID="imgUser" ImageUrl="~/images/error.png" runat="server" CssClass="user-image" AlternateText="User Image" />
            </div>

            <div class="name-container">
                <asp:Label ID="lblUsernamOnImage" runat="server">Name</asp:Label>
            </div>
        </div>

        <div class="pr-right-container">
            <div class="pr-main-content">
                <table class="tblAdminProfile">
                    <tr>
                        <td>
                            <asp:Label ID="lblUsername" runat="server" CssClass="pr-label">Username</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="pr-text-field" disabled="true"></asp:TextBox>
                        </td>
                        <td>
                            <input type="button" runat="server" value="Edit" id="btnUEdit" class="pr-btn-edit" onclick="btnUEditClick()" />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblFullName" runat="server" CssClass="pr-label">Fullname</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="pr-text-field" disabled="true"></asp:TextBox>
                        </td>
                        <td>
                            <input type="button" runat="server" value="Edit" id="btnFNEdit" class="pr-btn-edit" onclick="btnFNEditClick()" />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" CssClass="pr-label">Email</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="pr-text-field" disabled="true"></asp:TextBox>
                        </td>
                        <td>
                            <input type="button" runat="server" value="Edit" id="btnEEdit" class="pr-btn-edit" onclick="btnEEditClick()" />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblDOB" runat="server" CssClass="pr-label">Date Of Birth</asp:Label>
                        </td>
                        <td>
                            <input id="txtDOB" type="datetime" runat="server" class="pr-text-field" min="1950-01-01" max="2000-12-31" disabled="disabled" />
                        </td>
                        <td>
                            <input type="button" runat="server" value="Edit" id="btnDOBEdit" class="pr-btn-edit" onclick="btnDOBEditClick()" />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblReligion" runat="server" CssClass="pr-label">Religion</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtReligion" runat="server" CssClass="pr-text-field" disabled="true"></asp:TextBox>
                        </td>
                        <td>
                            <input type="button" runat="server" value="Edit" id="btnReligionEdit" class="pr-btn-edit" onclick="btnREditClick()" />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblGender" runat="server" CssClass="pr-label">Gender</asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="pr-ddl" Enabled="false">
                                <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <input type="button" runat="server" value="Edit" id="btnGenderEdit" class="pr-btn-edit" onclick="btnGEditClick()" />
                        </td>
                    </tr>
                </table>

                <asp:Button ID="btnUpdate" CssClass="pr-btnUpdate" Text="Update" disabled="true" runat="server" />
            </div>
        </div>
    </div>

    <div class="pr-copyright">
        <code>This project is designed and developed by <strong><a href="https://github.com/78526Nasir">Nasir islam Sujan</a> &copy;</strong>2017</code>
    </div>

</asp:Content>
