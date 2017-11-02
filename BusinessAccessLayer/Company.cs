using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer
{
    public class Company
    {
        public string CompanyName { get; set; }
        public string CompanyDescription { get; set; }
        public string PartnershipDate { get; set; }

        // Properties are initialize dynamically on the fly
    }
}
