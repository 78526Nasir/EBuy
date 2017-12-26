using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccessLayer;
using E_Commerce_Site.Libraries;
using System.Data;

namespace E_Commerce_Site
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButtonClickPerformed(object sender, EventArgs e)
        {
            string saltedHashedPassword = retriveSaltedHash();

            if (saltedHashedPassword != null)
            {
                User user = new User(txtUsername.Text, saltedHashedPassword);

                DataTable dt = user.login();

                if (dt.Rows.Count > 0)
                {
                    Session["User"] = dt.Rows[0]["fullname"].ToString();
                    Session["UserImage"] = dt.Rows[0]["image"].ToString();
                    Session["UserWholeRecord"] = dt;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Reg_Conf", "alert('Successfully logged in!')", true);
                    Response.Redirect("~/UI/HomePage.aspx");
                }
                else
                {
                    status.Text = "username and/or password not matched!";
                }
            }
            else
            {
                status.Text = "username and/or password not matched!";
            }
        }

        private string retriveSaltedHash()
        {
            User user = new User(txtUsername.Text);

            ECommerceBusiness ecb = new ECommerceBusiness
            {
                UserObj = user
            };

            string takeSalt = ecb.RetriveSaltAgainstUser();
            string takeHash;

            if (takeSalt != null)
            {
                takeHash = generateTempHashWithSalt(takeSalt);
            }
            else
            {
                takeHash = null;
            }

            return takeHash;
        }
        private string generateTempHashWithSalt(string salt)
        {
            string tempHash = HashingAndSalting.createSaltedHash(txtPassword.Text, salt);
            return tempHash;
        }

    }
}