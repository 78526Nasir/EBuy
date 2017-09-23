<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddNewCategory.aspx.cs" Inherits="E_Commerce_Site.admin.EditCategory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="middleContent" runat="server">
    <h1 class="anc-h1">Add New Category</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="anc-container">
        <div class="anc-form">
            <asp:Label CssClass="anc-label" ID="lblAddCategory" Text="Add New Category:" runat="server"></asp:Label>
            <asp:TextBox CssClass="anc-text" ID="txtCategoryName" runat="server" placeholder="Enter new category name" ></asp:TextBox> 
        </div>
    </div>
</asp:Content>
