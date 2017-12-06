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
                string imagePath = string.Empty;

                string isValid = validateImage();

                if (isValid.Equals("valid"))
                {
                    imagePath = "../images/" + fuImage.FileName;

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
                    lblValidationMessage.Text = isValid;
                }
            }else
            {
               ValidationSummary1.HeaderText = "Please fill up all the necessary fields";
            }
        }

        private string validateImage()
        {
            if (fuImage.HasFile)
            {
                string imageExtension = Path.GetExtension(fuImage.FileName);

                if (imageExtension.ToLower() != ".jpg" && imageExtension.ToLower() != ".jpeg" &&
                    imageExtension.ToLower() != ".png" && imageExtension.ToLower() != ".bmp")
                {
                    return "Only file with .jpg or .jpeg or .png or .bmp extension are allowed";
                }
                else
                {
                    //3145728 => 3MB
                    int imageSize = fuImage.PostedFile.ContentLength;

                    if (imageSize > 3145728)
                    {
                        return "Image size must less than 3MB";
                    }
                    else
                    {
                        imagePath();
                        return "valid";
                    }
                }
            }
            else
            {
                return "Please select and image";
            }


        }
        private void imagePath()
        {
            string serverPath = Server.MapPath("~/images/");
            string physicalSavingPath = serverPath + fuImage.FileName;

            fuImage.SaveAs(physicalSavingPath);

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