using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankGuarantee
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AmendmentBank_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AmendmentBankGuarantee.aspx");
        }

        protected void BankG_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BankGuarantee.aspx");
        }
        
    }
}