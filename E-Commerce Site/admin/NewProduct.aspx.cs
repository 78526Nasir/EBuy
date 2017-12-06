using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccessLayer;
using System.Data;
using System.IO;

namespace E_Commerce_Site.admin
{
    public partial class NewProduct : System.Web.UI.Page
    {
        public string errorMessage;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllCategories();
                getAllCompanies();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            string report = isValidImage();
            
            if (!report.Equals("valid"))
            {
                errorMessage = report;
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "invalidImage();", true);
            }
            else
            {
                string path = "Uploads/" + imageUpload.FileName;
                /*
                 * check whether user fill all the required field or not 
                 * server-site validation
                 */
                if (IsValid)
                {
                    Product product = new Product
                    {
                        ProductCode = txtProductCode.Text,
                        ProductName = txtProductName.Text,
                        ProductCategory = Convert.ToInt32(ddlProductCategory.SelectedValue),
                        ProductDescription = taProductDesc.InnerText,
                        ProductPrice = txtProductPrice.Text,
                        ProductImage = path,
                        ProductCompany =Convert.ToInt32(ddlProductCompany.SelectedValue)
                    };

                    ECommerceBusiness ecb = new ECommerceBusiness
                    {
                        ProductObj = product
                    };

                    ecb.AddNewProduct();
                    resetForm();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Reg_Conf", "alert('Successfully added a new product into database!')", true);
                }else
                {
                    Validation.InnerText = "Please fill up all the necessary fields";
                }
            }
        }

        private void resetForm()
        {
            txtProductCode.Text = string.Empty;
            txtProductName.Text = string.Empty;
            txtProductPrice.Text = string.Empty;
            taProductDesc.InnerText = string.Empty;
            imageUpload.Attributes.Clear();
            ddlProductCategory.SelectedIndex = -1;
            ddlProductCompany.SelectedIndex = -1;
        }

        private void getAllCategories()
        {
            ECommerceBusiness ecb = new ECommerceBusiness();
            DataTable dt = ecb.GetAllCategories();

            if (dt.Rows.Count > 0)
            {
                ListItem item = new ListItem("Select Category", "-1");
                ddlProductCategory.DataSource = dt;
                ddlProductCategory.DataBind();
                ddlProductCategory.Items.Insert(0, item);
            }
        }

        private void getAllCompanies()
        {
            ECommerceBusiness ecb = new ECommerceBusiness();
            DataTable dt = ecb.getAllCompanies();

            if (dt.Rows.Count > 0)
            {
                ListItem item = new ListItem("Select Company", "-1");
                ddlProductCompany.DataSource = dt;
                ddlProductCompany.DataBind();
                ddlProductCompany.Items.Insert(0, item);
            }
        }

        private string isValidImage()
        {
            string returnedValue = validateImage();

            if (returnedValue == null)
            {
                imageUpload.SaveAs(physicalPath());
                return "valid";
            }
            else
            {
                return returnedValue;
            }
        }

        private string physicalPath()
        {
            string path = Server.MapPath("~/Uploads/");
            string imagePhysicalPath = path + imageUpload.FileName;
            return imagePhysicalPath;
        }

        /// <summary>
        /// Validate the file(Image);
        /// Verfiy the image extension and size for preventing DDoS attack;
        /// </summary>
        /// <returns></returns>
        private string validateImage()
        {
            if (imageUpload.HasFile)
            {
                string imageExtension = Path.GetExtension(imageUpload.FileName);

                if (imageExtension.ToLower() != ".jpg" && imageExtension.ToLower() != ".jpeg" && 
                    imageExtension.ToLower() != ".png" && imageExtension.ToLower() != ".bmp")
                {
                    return "Only file with .jpg or .jpeg or .png or .bmp extension are allowed";
                }
                else
                {
                    //3145728 => 3MB
                    int imageSize = imageUpload.PostedFile.ContentLength;
                    if (imageSize > 3145728)
                    {
                        return "Image size must less than 3MB";
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            else
            {
                return "Please select and image";
            }
        }

    }
}