﻿using System;
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
        public Category CategoryObj { get; set; }
        public Product ProductObj { get; set; }
        public Company CompanyObj { get; set; }
        public Admin AdminObj { get; set; }
        public User UserObj { get; set; }
        public Cart CartObj { get; set; }
        public CustomerOrderDetails CODObj { get; set; }

        public void AddNewCategory()
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.AddParameter("@categoryName", CategoryObj.CategoryName);
            parameters[1] = DataAccess.AddParameter("@categoryDesc", CategoryObj.CategoryDescription);
            DataAccess.ExecuteDTByProcedure("sp_addNewCategory", parameters);
        }

        public void AddNewProduct()
        {
            SqlParameter[] parameters = new SqlParameter[8];
            parameters[0] = DataAccess.AddParameter("@productCode", ProductObj.ProductCode);
            parameters[1] = DataAccess.AddParameter("@productName", ProductObj.ProductName);
            parameters[2] = DataAccess.AddParameter("@description", ProductObj.ProductDescription);
            parameters[3] = DataAccess.AddParameter("@price", ProductObj.ProductPrice);
            parameters[4] = DataAccess.AddParameter("@categoryID", ProductObj.ProductCategory);
            parameters[5] = DataAccess.AddParameter("@companyID", ProductObj.ProductCompany);
            parameters[6] = DataAccess.AddParameter("@imageUrl", ProductObj.ProductImage);
            parameters[7] = DataAccess.AddParameter("@quantity", ProductObj.ProductQuantity);
            DataAccess.ExecuteDTByProcedure("sp_addNewProduct", parameters);
        }

        public void AddNewCompany()
        {
            SqlParameter[] parameters = new SqlParameter[3];
            parameters[0] = DataAccess.AddParameter("@CompanyName", CompanyObj.CompanyName);
            parameters[1] = DataAccess.AddParameter("@CompanyDesc", CompanyObj.CompanyDescription);
            parameters[2] = DataAccess.AddParameter("@PartnershipDate", CompanyObj.PartnershipDate);
            DataAccess.ExecuteDTByProcedure("sp_addNewCompany", parameters);
        }

        public void AddNewUser()
        {
            SqlParameter[] parameters = new SqlParameter[11];
            parameters[0] = DataAccess.AddParameter("@username", UserObj.Username);
            parameters[1] = DataAccess.AddParameter("@fullname", UserObj.getFullName());
            parameters[2] = DataAccess.AddParameter("@email", UserObj.Email);
            parameters[3] = DataAccess.AddParameter("@dob", UserObj.getDateOfBirth());
            parameters[4] = DataAccess.AddParameter("@age", UserObj.getAge());
            parameters[5] = DataAccess.AddParameter("@image", UserObj.getImage());
            parameters[6] = DataAccess.AddParameter("@religion", UserObj.getReligion());
            parameters[7] = DataAccess.AddParameter("@password", UserObj.getPassword());
            parameters[8] = DataAccess.AddParameter("@gender", UserObj.getGender());
            parameters[9] = DataAccess.AddParameter("@salt", UserObj.getSalt());
            parameters[10] = DataAccess.AddParameter("@hash", UserObj.getHash());
            DataAccess.ExecuteDTByProcedure("sp_addNewUser", parameters);
        }

        public DataTable SelectAdmin()
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.AddParameter("@username", AdminObj.UserName);
            parameters[1] = DataAccess.AddParameter("@password", AdminObj.getPassword());
            DataTable dt = DataAccess.ExecuteDTByProcedure("sp_selectAdmin", parameters);

            if (dt == null)
            {
                return new DataTable();
            }
            else
            {
                return dt;
            }
        }

        public DataTable SelectUser()
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.AddParameter("@username", UserObj.Username);
            parameters[1] = DataAccess.AddParameter("@hash", UserObj.getHash());
            DataTable dt = DataAccess.ExecuteDTByProcedure("sp_selectUser", parameters);

            return dt == null ? new DataTable() : dt;

        }

        public string RetriveSaltAgainstUser()
        {
            string salt;
            SqlParameter[] parameter = new SqlParameter[1];
            parameter[0] = DataAccess.AddParameter("@username", UserObj.Username);
            DataTable dt = DataAccess.ExecuteDTByProcedure("sp_retriveSaltAgainstUser", parameter);

            if (dt == null)
            {
                salt = null;
            }
            else
            {
                if (dt.Rows.Count > 0)
                {
                    salt = dt.Rows[0]["salt"].ToString();
                }
                else
                {
                    salt = null;
                }
            }
            return salt;
        }

        public DataTable ResetPassword()
        {
            SqlParameter[] parameter = new SqlParameter[1];
            parameter[0] = DataAccess.AddParameter("@email", UserObj.Email);
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_RESET_PASSWORD", parameter);

            if (dt == null)
            {
                return new DataTable();
            }
            else
            {
                return dt;
            }
        }

        public DataTable GetAllCategories()
        {
            // second parameter is set to be null because of it is select query
            DataTable dt = DataAccess.ExecuteDTByProcedure("sp_getAllCategory", null);
            return dt == null ? new DataTable() : dt;
        }

        public DataTable getAllCompanies()
        {
            // second parameter is set to be null because of it is select query
            DataTable dt = DataAccess.ExecuteDTByProcedure("sp_getAllCompanies", null);
            return dt == null ? new DataTable() : dt;
        }

        public bool IsPasswordResetLinkValid()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@GUID", UserObj.GlobalUniqueIDForResetPassword);

            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_IS_PASSWORD_RESET_LINK_VALID", parameters);

            if (dt == null)
            {
                return false;
            }
            else
            {
                if (dt.Rows.Count > 0)
                {
                    return dt.Rows[0]["returnCode"].ToString().Equals("1");
                }
                else
                {
                    return false;
                }
            }
        }

        public bool IsPasswordChanged()
        {
            SqlParameter[] parameters = new SqlParameter[4];
            parameters[0] = DataAccess.AddParameter("@GUID", UserObj.GlobalUniqueIDForResetPassword);
            parameters[1] = DataAccess.AddParameter("@password", UserObj.getPassword());
            parameters[2] = DataAccess.AddParameter("@salt", UserObj.getSalt());
            parameters[3] = DataAccess.AddParameter("@hash", UserObj.getHash());

            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_CHANGE_PASSWORD", parameters);

            if (dt == null)
            {
                return false;
            }
            else
            {
                if (dt.Rows.Count > 0)
                {
                    return dt.Rows[0]["returnCode"].ToString().Equals("1");
                }
                else
                {
                    return false;
                }
            }
        }

        public DataTable SelectAllUser()
        {
            return DataAccess.ExecuteDTByProcedure("SP_SELECT_ALL_USER", null);
        }

        public DataTable SelectAllPartner()
        {
            return DataAccess.ExecuteDTByProcedure("SP_SELECT_ALL_PARTNER", null);
        }

        public DataTable SelectAllProduct()
        {
            return DataAccess.ExecuteDTByProcedure("SP_SELECT_ALL_PRODUCT", null);
        }

        public DataTable GetAllProducts()
        {
            return DataAccess.ExecuteDTByProcedure("SP_GET_ALL_PRODUCT", null);
        }

        public void DeleteUser(string userID)
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@userid", userID);

            DataAccess.ExecuteDTByProcedure("SP_DELETE_USER", parameters);
        }

        public void DeletePartner(string partnerID)
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@partnerid", partnerID);

            DataAccess.ExecuteDTByProcedure("SP_DELETE_PARTNER", parameters);
        }

        public void DeleteProduct(string productID)
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@productid", productID);

            DataAccess.ExecuteDTByProcedure("SP_DELETE_PRODUCT", parameters);
        }

        public DataTable GetProducts(string categoryID)
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@categoryname", categoryID);

            return DataAccess.ExecuteDTByProcedure("SP_GET_PRODUCT_BY_CATEGORY", parameters);
        }

        public void AddToCart()
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.AddParameter("@productid", CartObj.ProductID);
            parameters[1] = DataAccess.AddParameter("@userid", CartObj.UserID);

            DataAccess.ExecuteDTByProcedure("SP_ADD_TO_CART", parameters);
        }

        public DataTable GetDefaultOneProduct()
        {
            return DataAccess.ExecuteDTByProcedure("SP_SELECT_DEFAULT_PRODUCT", null);
        }

        public DataTable GetProductsByProductID(string productGUID)
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@productGUID", productGUID);

            return DataAccess.ExecuteDTByProcedure("SP_GET_PRODUCT_BY_PRODUCT_GUID", parameters);
        }

        public DataTable IsUserNameExists()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@username", UserObj.Username);

            return DataAccess.ExecuteDTByProcedure("SP_IS_USERNAME_EXISTS", parameters);
        }

        public DataTable IsEmailExists()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@email", UserObj.Email);

            return DataAccess.ExecuteDTByProcedure("SP_IS_EMAIL_EXISTS", parameters);
        }

        public DataTable SelectAllCartedProduct(int userID)
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@userid", userID);
            return DataAccess.ExecuteDTByProcedure("SP_SELECT_ALL_CART", parameters);
        }

        public void DeleteCartedProduct(int productID, int userID)
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.AddParameter("@productid", productID);
            parameters[1] = DataAccess.AddParameter("@userid", userID);

            DataAccess.ExecuteDTByProcedure("SP_DELETE_CARTED_PRODUCT", parameters);
        }

        public DataTable GetAllCartedProducts(int userID)
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@userid", userID);

            return DataAccess.ExecuteDTByProcedure("SP_GET_ALL_CARTED_PRODUCTS", parameters);
        }

        public void AddNewCustomerOrderDetails()
        {
            SqlParameter[] parameters = new SqlParameter[6];
            parameters[0] = DataAccess.AddParameter("@GUID", CODObj.GUID);
            parameters[1] = DataAccess.AddParameter("@customerid", CODObj.CustomerID);
            parameters[2] = DataAccess.AddParameter("@address", CODObj.Address);
            parameters[3] = DataAccess.AddParameter("@phonenumber", CODObj.PhoneNumber);
            parameters[4] = DataAccess.AddParameter("@quantity", CODObj.Quantity);
            parameters[5] = DataAccess.AddParameter("@totalprice", CODObj.TotalPrice);

            DataAccess.ExecuteDTByProcedure("SP_ADD_NEW_POD", parameters);
        }

        public void TriggerCartToOrder(int productID, int userID)
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.AddParameter("@productid", productID);
            parameters[1] = DataAccess.AddParameter("@userid", userID);

            DataAccess.ExecuteDTByProcedure("SP_TRIGGER_CART_TO_ORDER", parameters);
        }

        public void CancelOrder(int productID,int userID)
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.AddParameter("@productid", productID);
            parameters[1] = DataAccess.AddParameter("@userid", userID);

            DataAccess.ExecuteDTByProcedure("SP_CANCEL_ORDER", parameters);
        }
    }
}
