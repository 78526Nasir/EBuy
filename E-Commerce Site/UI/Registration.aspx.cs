using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccessLayer;
using E_Commerce_Site.Libraries;

namespace E_Commerce_Site
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void registerButtonClickPerformed(object sender, EventArgs e)
        {
            User user = new User(txtUsername.Text, txtFullName.Text, txtPassword.Text, selectedGender(), txtReligion.Text, txtEmail.Text, txtDOB.Value);
            string salt;
            string hash =  HashingAndSalting.createSaltedHash(user.getPassword(), out salt);
            user.setHashAndSalt(hash, salt);
            user.registration();
            resetForm();
            Response.Redirect("~/UI/Redirect.aspx");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Reg_Conf", "alert('Successfully Registered!')", true);
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
            cbAgreement.Checked = false;
        }
 
    }
}