<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddNewCategory.aspx.cs" Inherits="E_Commerce_Site.admin.EditCategory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="middleContent" runat="server">
    <h1 class="anc-h1">Add New Category</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="anc-container">
        <div class="anc-left">
            <h3>Add Category:</h3>
        </div>
        <div class="anc-right">
            <asp:TextBox  CssClass="anc-right-btn" ID="txtNewCategory" runat="server" placeholder="Enter new category name"></asp:TextBox>
        </div>
    </div>
</asp:Content>
