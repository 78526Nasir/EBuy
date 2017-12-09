using BusinessAccessLayer;
using E_Commerce_Site.Libraries;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Site.admin
{
    public partial class ControlUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SelectAllUser();
                SelectAllPartner();
                SelectAllProduct();
            }
        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            User user = new User(txtUsername.Text, txtFullName.Text, txtPassword.Text, selectedGender(), txtReligion.Text, txtEmail.Text, txtDOB.Value, string.Empty);

            string salt;
            string hash = HashingAndSalting.createSaltedHash(user.getPassword(), out salt);

            user.setHashAndSalt(hash, salt);

            if (user.registration())
            {
                Response.Write("<script>alert('Successfully new user added')</script>");
            }
            resetForm();

        }

        protected void gvDeleteUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["userID"] = gvDeleteUser.SelectedRow.Cells[1].Text;
        }

        protected void gvDeletePartner_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["partnerID"] = gvDeletePartner.SelectedRow.Cells[1].Text;
        }

        protected void gvDeleteProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["productID"] = gvDeleteProduct.SelectedRow.Cells[1].Text;
        }

        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                lblStatus.Text = "Please select a user's row in order to delete the user!";
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                ECommerceBusiness ecb = new ECommerceBusiness();
                ecb.DeleteUser(Session["userID"].ToString());

                SelectAllUser();              
                Response.Write("<script>alert('User Deleted Successfully')</script>");
            }
        }

        protected void btnDeletePartner_Click(object sender, EventArgs e)
        {
            if (Session["partnerID"] == null)
            {
                lblDeletePartnerStatus.Text = "Please select a partner's row in order to delete the user!";
                lblDeletePartnerStatus.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                ECommerceBusiness ecb = new ECommerceBusiness();
                ecb.DeletePartner(Session["partnerID"].ToString());

                SelectAllPartner();
                Response.Write("<script>alert('Partner Deleted Successfully')</script>");
            }
        }


        protected void btnDeleteProduct_Click(object sender, EventArgs e)
        {
            if (Session["productID"] == null)
            {
                lblDeleteProductStatus.Text = "Please select a product's row in order to delete the user!";
                lblDeleteProductStatus.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                ECommerceBusiness ecb = new ECommerceBusiness();
                ecb.DeleteProduct(Session["productID"].ToString());

                SelectAllProduct();
                Response.Write("<script>alert('Product Deleted Successfully')</script>");
            }
        }


        private void SelectAllUser()
        {
            ECommerceBusiness ecb = new ECommerceBusiness();
            DataTable dt = ecb.SelectAllUser();

            if (dt.Rows.Count > 0)
            {
                gvDeleteUser.DataSource = dt;
                gvUserList.DataSource = dt;
                gvUserList.DataBind();
                gvDeleteUser.DataBind();
            }
        }

        private void SelectAllPartner()
        {
            ECommerceBusiness ecb = new ECommerceBusiness();
            DataTable dt = ecb.SelectAllPartner();

            if (dt.Rows.Count > 0)
            {
                gvPartnerList.DataSource = dt;
                gvDeletePartner.DataSource = dt;
                gvPartnerList.DataBind();
                gvDeletePartner.DataBind();
            }
        }

        private void SelectAllProduct()
        {
            ECommerceBusiness ecb = new ECommerceBusiness();
            DataTable dt = ecb.SelectAllProduct();

            if (dt.Rows.Count > 0)
            {
                gvProductList.DataSource = dt;
                gvDeleteProduct.DataSource = dt;
                gvProductList.DataBind();
                gvDeleteProduct.DataBind();
            }
        }

        private string selectedGender()
        {
            return rMale.Checked ? "male" : "female";
        }

        private void resetForm()
        {
            txtUsername.Text = string.Empty;
            txtFullName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtDOB.Value = string.Empty;
            txtPassword.Text = string.Empty;
            txtReligion.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            rMale.Checked = false;
            rFemale.Checked = false;
        }
    }
}
