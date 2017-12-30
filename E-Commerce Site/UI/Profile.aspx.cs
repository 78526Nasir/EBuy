using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Site.UI
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserWholeRecord"] == null)
            {
                Response.Redirect("UserLogin.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    DataTable dt = (DataTable)Session["UserWholeRecord"];

                    txtUsername.Text = dt.Rows[0]["username"].ToString();
                    txtFullName.Text = dt.Rows[0]["fullname"].ToString();
                    txtEmail.Text = dt.Rows[0]["email"].ToString();
                    txtReligion.Text = dt.Rows[0]["religion"].ToString();
                    txtDOB.Value = dt.Rows[0]["dob"].ToString();
                    ddlGender.SelectedItem.Text = dt.Rows[0]["gender"].ToString();
                    lblUsernamOnImage.Text = dt.Rows[0]["fullname"].ToString();

                    if (!string.IsNullOrEmpty(dt.Rows[0]["image"].ToString()))
                    {
                        imgUser.ImageUrl = dt.Rows[0]["image"].ToString();
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Profile updated successfully')</script>");
        }

        private void checkValue(string id)
        {
            if (string.IsNullOrEmpty(id))
            {

            }
        }
    }
}