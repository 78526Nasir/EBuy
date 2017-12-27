using BusinessAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace E_Commerce_Site.WebServices
{
    /// <summary>
    /// IsEmailExists WebService going to provide us the information 
    /// whether a given Email already exists in the database or not.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class IsEmailExists : System.Web.Services.WebService
    {

        [WebMethod]
        public void EmailExists(string email)
        {
            User user = new User
            {
                Email = email
            };

            user.EmailInUse = false;

            ECommerceBusiness ecb = new ECommerceBusiness
            {
                UserObj = user
            };

            DataTable dt = ecb.IsEmailExists();

            if (dt.Rows.Count > 0)
            {
                user.EmailInUse = dt.Rows[0]["EmailExists"].ToString().Equals("0") ? false : true;
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(user));
        }
    }
}
