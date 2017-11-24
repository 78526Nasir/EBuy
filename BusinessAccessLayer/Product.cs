using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer
{
    public class Product
    {
        public string ProductCode { get; set; }
        public string ProductName { get; set; }
        public int ProductCategory { get; set; }
        public string ProductDescription { get; set; }
        public string ProductPrice { get; set; } // TODO
        public string ProductImage { get; set; }
        public int ProductCompany { get; set; }

        // objects are initialize dynamically on the fly

    }
}
