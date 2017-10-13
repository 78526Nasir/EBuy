<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ControlUser.aspx.cs" Inherits="E_Commerce_Site.admin.ControlUser" %>


<asp:Content ID="Content1" ContentPlaceHolderID="middle" runat="server">
    <h1 class="cu-title">Control User</h1>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="cu-body-container">
        
        <!-- Left menu panel -->

        <div class="cu-left-control-panel">
            <ul class="left-menu-ul">
                <li><a href="#new-user">Add new user</a></li>
                <li><a href="#cuDangerState">Delete user</a></li>
                <li><a href="#">Users list</a></li>
            </ul>
        </div>

        <!-- Main Content -->

        <div class="cu-main-content">
            <h1 class="cu-h1">Add new user</h1>
            <div id="new-user" class="cu-new-user">

                <!-- Table for Registration form -->

                <table class="responsive-table1">
                    <tr>
                        <td class="left">
                            <label class="label" id="lblUsername" runat="server">Username</label>
                        </td>
                        <td class="right">
                            <asp:TextBox CssClass="text-field" name="User" runat="server" ID="txtUsername" placeholder="Enter username">
                            </asp:TextBox>
                        </td>
                        <td class="required">
                            <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Username required" ControlToValidate="txtUsername">&nbsp;</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            <label class="label" id="lblFullName" runat="server">Full Name</label>
                        </td>

                        <td class="right">
                            <asp:TextBox CssClass="text-field" runat="server" ID="txtFullName" placeholder="Enter full name">
                            </asp:TextBox>
                        </td>
                        <td class="required">
                            <asp:RequiredFieldValidator ID="rbv2" runat="server" ErrorMessage="Full Name Required" ControlToValidate="txtFullName">&nbsp;</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            <label class="label" id="lblEmail" runat="server">Email</label>
                        </td>
                        <td class="right">
                            <asp:TextBox CssClass="text-field" TextMode="Email" ID="txtEmail" runat="server" placeholder="Enter email">
                            </asp:TextBox>
                        </td>
                        <td class="required">
                            <asp:RequiredFieldValidator ID="rfv3" runat="server" ErrorMessage="Email required" ControlToValidate="txtEmail" Display="Dynamic">&nbsp;</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev1" runat="server" ErrorMessage="Enter valid email address" ControlToValidate="txtEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">&nbsp;</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            <label class="label" id="lblAge" runat="server">Date of Birth</label>
                        </td>

                        <td class="right">
                            <input class="text-field dob fixed" type="date" id="txtDOB" max="2000-12-31" runat="server"/>
                        </td>
                        <td class="required">
                            <asp:RequiredFieldValidator ID="rfv4" ControlToValidate="txtDOB" runat="server" ErrorMessage="Date of Birth required">&nbsp;</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            <label class="label" id="lblReligion" runat="server">Religion</label>
                        </td>

                        <td class="right">
                            <asp:TextBox CssClass="text-field" runat="server" ID="txtReligion" placeholder="Enter religion">
                            </asp:TextBox>
                        </td>
                        <td class="required">
                            <asp:RequiredFieldValidator ID="rfv5" runat="server" ErrorMessage="Religion required" ControlToValidate="txtReligion">&nbsp;</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            <label class="label" id="lblPassword" runat="server">Password</label>
                        </td>

                        <td class="right">
                            <asp:TextBox class="text-field" TextMode="password" ID="txtPassword" runat="server" placeholder="Enter password">
                            </asp:TextBox>
                        </td>
                        <td class="required">
                            <asp:RequiredFieldValidator ID="rfv6" runat="server" ErrorMessage="Password required" ControlToValidate="txtPassword">&nbsp;</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            <label class="label" id="lblConfirmPassword" runat="server">Confirm Password</label>
                        </td>

                        <td class="right">
                            <asp:TextBox class="text-field" TextMode="password" ID="txtConfirmPassword" runat="server" placeholder="Reenter password"></asp:TextBox>
                        </td>
                        <td class="required">
                            <asp:RequiredFieldValidator ID="rfv7" runat="server" ErrorMessage="Confirm password required" ControlToValidate="txtConfirmPassword">&nbsp;</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>

                <!-- Table for Gender -->

                <table class="responsive-table2">

                    <tr>
                        <td class="left-label">
                            <label class="label" id="lblGender" runat="server">Gender</label>
                        </td>
                        <td class="radio-container">
                            <label>
                                <input type="radio" class="radio" name="rGender" runat="server" id="rMale" value="Male" />Male</label>
                        </td>
                        <td class="radio-container">
                            <label>
                                <input type="radio" class="radio" name="rGender" runat="server" id="rFemale" value="Male" />Female</label>
                        </td>
                    </tr>
                </table>
                
                <!-- Registration button Control -->

                <div class="button">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" />
                </div>

            </div>

            <h1 class="cu-danger-h1">Delete User</h1>
            <div id="cuDangerState" class="cu-delete-user">
                <asp:TextBox ID="txtSearchUser" placeholder="Search user for delete" CssClass="cu-danger-textbox" runat="server"></asp:TextBox>
                <asp:GridView ID="gv1" runat="server"></asp:GridView>
                <asp:Button ID="btnDeleteUser" CssClass="cu-btn-delete" runat="server" Text="Delete" CausesValidation="false"/>
            </div>
        </div>
        
        

        <!--Validation Summary div | Below the left-menu-panel -->

        <div class="validation-summary">
            <asp:ValidationSummary CssClass="erro-message-summary" ID="ValidationSummary1" runat="server" />
        </div>
    </div>
</asp:Content>

