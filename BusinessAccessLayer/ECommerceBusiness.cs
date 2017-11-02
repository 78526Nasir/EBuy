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
        public Admin AdminObj { get; set; }
        public User UserObj { get; set; }

        public void addNewCategory()
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.addParameter("@categoryName", CategoryObj.CategoryName);
            parameters[1] = DataAccess.addParameter("@categoryDesc", CategoryObj.CategoryDescription);
            DataAccess.executeDTByProcedure("sp_addNewCategory", parameters);
        }

        public void addNewProduct()
        {
            SqlParameter[] parameters = new SqlParameter[6];
            parameters[0] = DataAccess.addParameter("@productName", ProductObj.ProductName);
            parameters[1] = DataAccess.addParameter("@description", ProductObj.ProductDescription);
            parameters[2] = DataAccess.addParameter("@price", ProductObj.ProductPrice);
            parameters[3] = DataAccess.addParameter("@categoryID", ProductObj.ProductCategory);
            parameters[4] = DataAccess.addParameter("@companyID", ProductObj.ProductCompany);
            parameters[5] = DataAccess.addParameter("@imageUrl", ProductObj.ProductImage);
            DataAccess.executeDTByProcedure("sp_addNewProduct", parameters);
        }

        public void addNewCompany()
        {
            SqlParameter[] parameters = new SqlParameter[3];
            parameters[0] = DataAccess.addParameter("@CompanyName", CompanyObj.CompanyName);
            parameters[1] = DataAccess.addParameter("@CompanyDesc", CompanyObj.CompanyDescription);
            parameters[2] = DataAccess.addParameter("@PartnershipDate", CompanyObj.PartnershipDate);
            DataAccess.executeDTByProcedure("sp_addNewCompany", parameters);
        }

        public bool selectAdmin()
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.addParameter("@username",AdminObj.UserName);
            parameters[1] = DataAccess.addParameter("@password", AdminObj.getPassword());
            DataTable dt = DataAccess.executeDTByProcedure("sp_selectAdmin", parameters);
            return dt.Rows.Count > 0 ? true : false;
        }

        public bool selectUser()
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.addParameter("@username", UserObj.getUsername());
            parameters[1] = DataAccess.addParameter("@hash", UserObj.getHash()); 
            DataTable dt = DataAccess.executeDTByProcedure("sp_selectUser", parameters);
            return dt.Rows.Count > 0 ? true : false;
        }

        public string retriveSaltAgainstUser()
        {
            SqlParameter[] parameter = new SqlParameter[1];
            parameter[0] = DataAccess.addParameter("@username", UserObj.getUsername());
            DataTable dt=DataAccess.executeDTByProcedure("sp_retriveSaltAgainstUser", parameter);
            string salt;
            
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                salt = row["salt"].ToString();
            }else
            {
                salt = null;
            }
            return salt;
        }

        public void addNewUser()
        {
            SqlParameter[] parameters = new SqlParameter[10];
            parameters[0] = DataAccess.addParameter("@username", UserObj.getUsername());
            parameters[1] = DataAccess.addParameter("@fullname", UserObj.getFullName());
            parameters[2] = DataAccess.addParameter("@email", UserObj.getEmail());
            parameters[3] = DataAccess.addParameter("@dob", UserObj.getDateOfBirth());
            parameters[4] = DataAccess.addParameter("@age", UserObj.getAge());
            parameters[5] = DataAccess.addParameter("@religion", UserObj.getReligion());
            parameters[6] = DataAccess.addParameter("@password", UserObj.getPassword());
            parameters[7] = DataAccess.addParameter("@gender", UserObj.getGender());
            parameters[8] = DataAccess.addParameter("@salt", UserObj.getSalt());
            parameters[9] = DataAccess.addParameter("@hash", UserObj.getHash());
            DataAccess.executeDTByProcedure("sp_addNewUser", parameters);
        }

        // second parameter is set to be null because of it is select query
        public DataTable getAllCategories()
        {
            return DataAccess.executeDTByProcedure("sp_getAllCategory", null); 
        }

        public DataTable getAllCompanies()
        {
            return DataAccess.executeDTByProcedure("sp_getAllCompanies", null); 
        }

    }
}
