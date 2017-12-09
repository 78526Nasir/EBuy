<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ControlBusiness.aspx.cs" Inherits="E_Commerce_Site.admin.ControlUser" %>


<asp:Content ID="Content1" ContentPlaceHolderID="middle" runat="server">
    <h1 class="cu-title">Control Business</h1>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="cu-body-container">
        <!-- Left menu panel -->

        <div class="cu-left-control-panel">
            <ul class="left-menu-ul">
                <li><a href="#addNewUser">Add new user</a></li>
                <li><a href="#deleteUser">Delete user</a></li>
                <li><a href="#userList">Users list</a></li>
                <li><a href="#partnerList">Partners list</a></li>
                <li><a href="#deletePartner">Delete Partner</a></li>
                <li><a href="#productList">Product list</a></li>
                <li><a href="#deleteProduct">Delete Product</a></li>
            </ul>
        </div>

        <!-- Main Content -->

        <div class="cu-main-content">
            <h1 id="addNewUser" class="cu-h1">Add new user</h1>
            <div class="cu-new-user">

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
                            <input class="text-field dob fixed" type="date" id="txtDOB" max="2000-12-31" runat="server" />
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
                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                </div>

            </div>

            <hr />

            <h1 id="userList" class="cu-h1">User List</h1>
            <div>
                <asp:GridView ID="gvUserList" CssClass="gv-user-list" runat="server" CellPadding="10" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>

            <hr />

            <h1 id="deleteUser" class="cu-danger-h1">Delete User</h1>
            <div class="delete-user" id="deleteUserDiv" runat="server">
                <asp:GridView ID="gvDeleteUser" CssClass="cu-delete-user" runat="server" CellPadding="10" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvDeleteUser_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:Button ID="btnDeleteUser" CssClass="cu-btn-delete" runat="server" Text="Delete User" CausesValidation="false" OnClick="btnDeleteUser_Click" />
                <br />
                <asp:Label ID="lblStatus" CssClass="status-label" runat="server"></asp:Label>
            </div>

            <hr />

            <h1 id="partnerList" class="cu-h1">Partner List</h1>
            <div class="partner-list">
                <asp:GridView ID="gvPartnerList" runat="server" CssClass="gvPartnerList" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </div>

            <hr />

            <h1 id="deletePartner" class="cu-danger-h1">Delete Partner</h1>

            <div class="delete-partner">
                <asp:GridView ID="gvDeletePartner" runat="server" CssClass="gv-delete-partner" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvDeletePartner_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:Button ID="btnDeletePartner" CssClass="cu-btn-delete" runat="server" Text="Delete Partner" CausesValidation="false" OnClick="btnDeletePartner_Click" />
                <br />
                <asp:Label ID="lblDeletePartnerStatus" CssClass="status-label" runat="server"></asp:Label>
            </div>

            <hr />

            <h1 id="productList" class="cu-h1">Product List</h1>
            <div class="product-list">
                <asp:GridView ID="gvProductList" CssClass="gv-product-list" runat="server" CellPadding="5" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </div>

            <hr />

            <h1 id="deleteProduct" class="cu-danger-h1">Delete Product</h1>
            <div class="delete-product">
                <asp:GridView ID="gvDeleteProduct" CssClass="gv-delete-product" runat="server" CellPadding="5" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvDeleteProduct_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </div>
            <asp:Button ID="btnDeleteProduct" CssClass="cu-btn-delete" runat="server" Text="Delete Product" CausesValidation="false" OnClick="btnDeleteProduct_Click" />
            <br />
            <asp:Label ID="lblDeleteProductStatus" CssClass="status-label" runat="server"></asp:Label>
        </div>



        <!--Validation Summary div | Below the left-menu-panel -->

        <div class="validation-summary">
            <asp:ValidationSummary CssClass="erro-message-summary" ID="ValidationSummary1" runat="server" />
        </div>
    </div>
</asp:Content>

