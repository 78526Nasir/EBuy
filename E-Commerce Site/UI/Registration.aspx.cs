using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccessLayer;
using E_Commerce_Site.Libraries;
using System.IO;

namespace E_Commerce_Site
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void registerButtonClickPerformed(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string imagePath = defaultImagePath();

                User user = new User(txtUsername.Text, txtFullName.Text, txtPassword.Text, selectedGender(), txtReligion.Text, txtEmail.Text, txtDOB.Value, imagePath);

                string salt;
                string hash = HashingAndSalting.createSaltedHash(user.getPassword(), out salt);

                user.setHashAndSalt(hash, salt);

                // registration
                user.registration();

                resetForm();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Reg_Conf", "alert('Successfully Registered!')", true);
                Response.Redirect("~/UI/Redirect.aspx");
            }
            else
            {
                ValidationSummary1.HeaderText = "Please fill up all the necessary fields";
            }
        }

        private string selectedGender()
        {
            return rbl1.SelectedIndex == 0 ? "male" : "female";
        }

        private string defaultImagePath()
        {
            if (selectedGender().Equals("male"))
            {
                return "../images/male_user.png";
            }
            else
            {
                return "../images/female_user.png";
            }

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
            rbl1.ClearSelection();
            cbAgreement.Checked = false;
        }

    }
}