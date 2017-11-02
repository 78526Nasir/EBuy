<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Partnership.aspx.cs" Inherits="E_Commerce_Site.admin.Partnership" %>

<asp:Content ID="Content1" ContentPlaceHolderID="middle" runat="server">
    <h1 class="np-title">Add New Partner</h1>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- Main body content -->

    <div class="p-body-content">
        
        <div class="validation">
            <asp:ValidationSummary ID="vs2" runat="server" />
        </div>

        <div class="p-form">
            <table class="p-table">
                <tr>
                    <td>
                        <label class="anc-label" id="lblCompanyName" runat="server">Company Name</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCompanyName" runat="server" placeholder="Enter company name" CssClass="anc-textbox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Company name required" ControlToValidate="txtCompanyName">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="anc-label" id="lblCompanyDescription" runat="server">Company Description</label>
                    </td>
                    <td>
                        <textarea id="taCompanyDescription" class="anc-textarea" runat="server" placeholder="Enter short description.."></textarea>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Company description required" ControlToValidate="taCompanyDescription">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="anc-label" id="lblPartnershipDate" runat="server">Partnership Date</label>
                    </td>
                    <td>
                        <input class="p-dob" type="date" id="txtDOB" min="1950-01-01" runat="server"/>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv3" runat="server" ErrorMessage="Partnership date required" ControlToValidate="txtDOB">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                <!-- Button Control -->
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnAdd" CssClass="p-add-btn" runat="server" Text="Add Comapany" OnClick="btnAdd_Click"></asp:Button>
                    </td>
                </tr>

            </table>
        </div>
    </div>
</asp:Content>
