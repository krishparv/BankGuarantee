using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankGuarantee
{
    public partial class PrintPreview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PPreview();
        }
        public static void PPreview()
        {
            Microsoft.Office.Interop.Word.Application objWordApp = new Microsoft.Office.Interop.Word.Application();
            object objWordFile = @"C:\\GuaranteeApplication1.doc";
            object objNull = System.Reflection.Missing.Value;

            Microsoft.Office.Interop.Word.Document WordDoc = objWordApp.Documents.Open(
            ref objWordFile, ref objNull, ref objNull,
            ref objNull, ref objNull, ref objNull,
            ref objNull, ref objNull, ref objNull,
            ref objNull, ref objNull, ref objNull, ref objNull, ref objNull, ref objNull, ref objNull);
            WordDoc.PrintPreview();
            WordDoc.ActiveWindow.Selection.WholeStory();
            WordDoc.ActiveWindow.Selection.Copy();
            string strWordText = WordDoc.Content.Text;
            //     WordDoc.Close(ref objNull, ref objNull, ref objNull);
            //     objWordApp.Quit(ref objNull, ref objNull, ref objNull);
            // Response.Write(strWordText);
        }
    }
}