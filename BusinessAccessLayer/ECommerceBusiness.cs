using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
using DataAccessLayer;


/// <summary>
/// Business Access Layer mainly deals with the Business
/// since this is a E-commerce site
/// so the main business belongs with product and category
/// </summary>
namespace BusinessAccessLayer
{
    public class ECommerceBusiness
    {

        public string categoryName;
        public string categoryDescription;

        public string productName;
        public string productDescription;
        public string productPrice;
        public string productImage;

        public void addNewCategory()
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.addParameter("@categoryName", categoryName);
            parameters[1] = DataAccess.addParameter("@categoryDesc", categoryDescription);
            DataAccess.executeDTByProcedure("sp_addNewCategory", parameters);
        }

        
    }
}
