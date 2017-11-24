<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="NewProduct.aspx.cs" Inherits="E_Commerce_Site.admin.NewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="middle" runat="server">
    <h1 class="np-title">Add New Product</h1>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- Main content-->

    <div class="np-body-content">

        <div class="validation">
            <asp:ValidationSummary ID="vs3" runat="server" />
        </div>

        <div id="ev-info">
        </div>

        <script type="text/javascript">
            function invalidImage() {
                var ele = document.getElementById("ev-info");
                ele.style.visibility = "visible";
                ele.innerText = "<%=this.errorMessage%>"; 
            }
        </script>

        <div class="np-form">
            <table class="np-table">
                 <tr>
                    <td>
                        <label class="anc-label" id="lblProductCode" runat="server">Product Code</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProductCode" runat="server" placeholder="Enter product code" CssClass="anc-textbox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv7" runat="server" ErrorMessage="Product code required" ControlToValidate="txtProductName">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="anc-label" id="lblProductName" runat="server">Product Name</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProductName" runat="server" placeholder="Enter product name" CssClass="anc-textbox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Product name required" ControlToValidate="txtProductName">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="anc-label" id="lblProductCategory" runat="server">Product Category</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProductCategory" runat="server" CssClass="np-ddl" DataTextField="Category_Name" DataValueField="Category_ID">  
                            <asp:ListItem Text="Select Category" Value="-1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rvf2" runat="server" ErrorMessage="Product category required" InitialValue="-1" ControlToValidate="ddlProductCategory">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="anc-label" id="lblProductDescription" runat="server">Product Description</label>
                    </td>
                    <td>
                        <textarea id="taProductDesc" runat="server" placeholder="Enter product description" class="anc-textarea"></textarea>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rvf3" runat="server" ErrorMessage="Product description required" ControlToValidate="taProductDesc">&nbsp;
                        </asp:RequiredFieldValidator>
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
                    <td>
                        <asp:RequiredFieldValidator ID="rvf4" runat="server" ErrorMessage="Product image required" ControlToValidate="imageUpload">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="anc-label" id="lblProuctPrice" runat="server">Product Price</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProductPrice" runat="server" placeholder="Enter product price" CssClass="anc-textbox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rvf5" runat="server" ErrorMessage="Product price required" ControlToValidate="txtProductPrice">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="anc-label" id="lblCompany" runat="server">Product Company</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProductCompany" runat="server" CssClass="np-ddl" DataTextField="Company_Name" DataValueField="Company_ID">                        
                            <asp:ListItem Text="Select Company" Value="-1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rvf6" runat="server" ErrorMessage="Product company required" InitialValue="-1" ControlToValidate="ddlProductCompany">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>

                <!-- Button Control -->
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnAdd" CssClass="anc-btn-add np-btn-add" runat="server" Text="Add" OnClick="btnAdd_Click"></asp:Button>
                    </td>
                </tr>

            </table>
        </div>
    </div>
</asp:Content>
