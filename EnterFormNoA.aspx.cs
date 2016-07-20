using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankGuarantee
{
    public partial class EnterFormNo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoadForm_Click(object sender, EventArgs e)
        {
            Session["Ref_A"] = formNo.Text;
            Server.Transfer("~/AmendmentBankGuarantee.aspx");
        }
    }
}