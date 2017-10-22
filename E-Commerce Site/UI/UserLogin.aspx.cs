using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce_Site.Libraries;

namespace E_Commerce_Site
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButtonClickPerformed(object sender, EventArgs e)
        {
            User newUser = new User(txtUsername.Text, txtPassword.Text);
            if (newUser.login())
            {
                Response.Redirect("~/UI/Welcome.aspx");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Reg_Conf", "alert('Successfully logged in!')", true);
            }else
            {
                status.Text = "username and/or password not matched!";
            }
        }

        

    }
}