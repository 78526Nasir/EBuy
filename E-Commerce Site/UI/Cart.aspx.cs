using BusinessAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Site.UI
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserWholeRecord"] != null)
                {
                    DataTable dt = (DataTable)Session["UserWholeRecord"];
                    string userID = dt.Rows[0]["user_id"].ToString();
                    GetCartedProducts(userID);
                }
                else
                {
                    lblMessage.Text = "You do not cart any product yet!";
                }
            }
        }

        private void GetCartedProducts(string userID)
        {
            ECommerceBusiness ecb = new ECommerceBusiness();
            DataTable dt = ecb.GetAllCartedProducts(userID);

            rpCartedProduct.DataSource = dt;
            rpCartedProduct.DataBind();
        }
    }
}