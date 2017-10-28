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
/// Business Access Layer mainly deals with the Business;
/// Since this is a E-commerce site
/// so the main business belongs with product and category and company
/// </summary>
namespace BusinessAccessLayer
{
    public class ECommerceBusiness
    {
        public Category CategoryObj { get; set;}
        public Product ProductObj { get; set; }
        public Company CompanyObj { get; set; }

        public void addNewCategory()
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.addParameter("@categoryName", CategoryObj.CategoryName);
            parameters[1] = DataAccess.addParameter("@categoryDesc", CategoryObj.CategoryDescription);
            DataAccess.executeDTByProcedure("sp_addNewCategory", parameters);
        }

        public void addNewProduct()
        {
            // TO DO
        }

        public void addNewCompany()
        {
            SqlParameter[] parameters = new SqlParameter[3];
            parameters[0] = DataAccess.addParameter("@CompanyName", CompanyObj.CompanyName);
            parameters[1] = DataAccess.addParameter("@CompanyDesc", CompanyObj.CompanyDescription);
            parameters[2] = DataAccess.addParameter("@PartnershipDate", CompanyObj.PartnershipDate);
            DataAccess.executeDTByProcedure("sp_addNewCompany", parameters);
        }

        public DataTable getAllCategories()
        {
            // second parameter is set to be null because of it is select query
            return DataAccess.executeDTByProcedure("sp_getAllCategory", null); 
        }

        public DataTable getAllCompanies()
        {
            // second parameter is set to be null because of it is select query
            return DataAccess.executeDTByProcedure("sp_getAllCompanies", null); 
        }

    }
}
