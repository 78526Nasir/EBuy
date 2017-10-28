<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddNewCategory.aspx.cs" Inherits="E_Commerce_Site.admin.AddNewCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="middle" runat="server">
    <h1 class="anc-title">Add New Category</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="anc-body-content">

        <div class="validation">
            <asp:ValidationSummary ID="vs1" runat="server" />
        </div>

        <div class="anc-form">
            <table class="anc-table">
                <tr>
                    <td>
                        <label class="anc-label" id="lblCategoryName" runat="server">Add Category</label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="anc-textbox" ID="txtCategoryName" runat="server" placeholder="Enter new category"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Category name required" ControlToValidate="txtCategoryName" 
                            style="font-weight: bold; color: #FFFFFF;">&nbsp;</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="anc-label" id="lblDescription" runat="server">Category Description</label>
                    </td>
                    <td>
                        <textarea id="taDescription" class="anc-textarea" runat="server" placeholder="Enter short description.."></textarea>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Category description required" ControlToValidate="taDescription"
                             style="font-weight: bold; color: #FFFFFF;">&nbsp;</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnAdd" CssClass="anc-btn-add" runat="server" Text="Add" OnClick="addButtonClickPerformed"></asp:Button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
