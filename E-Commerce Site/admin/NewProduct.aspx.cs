using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccessLayer;
using System.Data;

namespace E_Commerce_Site.admin
{
    public partial class NewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllCategories();
                getAllCompanies();
            }
        }

        /// <summary>
        /// Intialize Product and ECommerceBusiness object dynamically at runtime;
        /// Avoid using constructor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            /*
             * check whether user fill all the required filed or not 
             * server-site validation
            */
            if (IsValid) 
            {
                Product product = new Product
                {
                    ProductName = txtProductName.Text,
                    ProductCategory = ddlProductCategory.SelectedItem.Text,
                    ProductDescription = taProductDesc.InnerText,
                    ProductPrice = txtProductPrice.Text,
                    /* TO DO 
                     * hadling product image later 
                        ProductImage =
                    must meet some security issue
                    */
                    ProductCompany = ddlProductCompany.SelectedItem.Text
                };

                ECommerceBusiness ecb = new ECommerceBusiness
                {
                    ProductObj = product
                };

                //addNewProduct();
            }
        }

        private void getAllCategories()
        {
            ECommerceBusiness ecb = new ECommerceBusiness();
            DataTable dt = ecb.getAllCategories();
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


    }
}