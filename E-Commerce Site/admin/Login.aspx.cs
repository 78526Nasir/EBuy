using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccessLayer;

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
                password=txtPassword.Text
            };

            ECommerceBusiness ecb = new ECommerceBusiness
            {
                AdminObj = admin
            };

            if (ecb.selectAdmin())
            {
                Session["AdminSession"] = "EC_Admin";
                Response.Redirect("~/admin/ControlUser.aspx");
            }
            else
            {
                lblStatus.Text = "Username or password not matched !";
            }
        }
    }
}