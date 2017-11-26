using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccessLayer;
using System.Data;

namespace E_Commerce_Site
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButtonClickPerformed(object sender, EventArgs e)
        {
            Admin admin = new Admin
            {
                UserName = txtUsername.Text,
                password = txtPassword.Text
            };

            ECommerceBusiness ecb = new ECommerceBusiness
            {
                AdminObj = admin
            };

            DataTable dt = ecb.selectAdmin();

            if (dt.Rows.Count > 0)
            {
                Session["Fullname"] = dt.Rows[0]["FullName"].ToString();
                Session["Username"] = dt.Rows[0]["username"].ToString();
                Session["Password"] = dt.Rows[0]["Password"].ToString();
                Session["Image"] = dt.Rows[0]["ImageUrl"].ToString();
                Session["AdminSession"] = "Admin";

                Response.Redirect("~/admin/ControlUser.aspx");
            }
            else
            {
                lblStatus.Text = "Username or password not matched !";
            }
        }
    }
}