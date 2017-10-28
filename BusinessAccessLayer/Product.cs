using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer
{
    public class Product
    {
        public string ProductName { get; set; }
        public string ProductCategory { get; set; }
        public string ProductDescription { get; set; }
        public string ProductPrice { get; set; }
        public string ProductImage { get; set; }
        public string ProductCompany { get; set; }

        // objects are initialize dynamically at runtime

        /*
            public Product(string productName, string productCategory, string productDescription, string productImage, string productCompany)
            {
                ProductName = productName;
                ProductCategory = productCategory;
                ProductDescription = productDescription;
                ProductImage = productImage;
                ProductCompany = productCompany;
            }

        */

    }
}
