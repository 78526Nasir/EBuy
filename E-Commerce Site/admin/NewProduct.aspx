<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="NewProduct.aspx.cs" Inherits="E_Commerce_Site.admin.NewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="middle" runat="server">
    <h1 class="np-title">Add New Product</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="np-body-content">
        <div class="np-form">
            <table class="np-table">
                <tr>
                    <td>
                        <label class="anc-label" id="lblProductName" runat="server">Product Name</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProductName" runat="server" placeholder="Enter product name" CssClass="anc-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="anc-label" id="lblProductCategory" runat="server">Product Category</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProductCategory" runat="server" CssClass="np-ddl">
                            <asp:ListItem Value="ddl" Text="Select Items"></asp:ListItem>
                            <asp:ListItem Value="ddl" Text="Items"></asp:ListItem>
                            <asp:ListItem Value="ddl" Text="Select"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="anc-label" id="lblProductDescription" runat="server">Product Description</label>
                    </td>
                    <td>
                        <textarea id="taProductDesc" runat="server" placeholder="Enter product description" class="anc-textarea"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="anc-label" id="lblProductImage" runat="server">Product Image</label>
                    </td>
                    <td>
                        <label class="choose-file">
                            Choose File
                        <asp:FileUpload  CssClass="file-upload" ID="imageUpload" runat="server" />
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="anc-label" id="lblProuctPrice" runat="server">Product Price</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProductPrice" runat="server" placeholder="Enter product price" CssClass="anc-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnAdd" CssClass="anc-btn-add" runat="server" Text="Add"></asp:Button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
