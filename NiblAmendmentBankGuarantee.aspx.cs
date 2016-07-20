using System.Web.UI.WebControls;
using Novacode;
using Microsoft.Office.Interop.Word;
using System.Web.UI.WebControls;
using Novacode;
using Microsoft.Office.Interop.Word;
using System.IO;
using System.Net;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System;

namespace BankGuarantee
{
    public partial class NiblAmendmentBankGuarantee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //  DataTable dt = new DataTable("Data");




            }

        }

        //        protected void Printbtn_Click(object sender, EventArgs e)
        //        {
        //              var datetoday =DateToday.Text ;
        //            var branch = Branch.Text;
        //            var guaranteeNum = GuaranteeNumber.Text;
        //            var guaranteeAmount =GuaranteeAmount.Text;
        //            var guranteeIssueDate=GuaranteeIssuedDate.Text;
        //            var beneficiary = Beneficiary.Text;
        //            var validityDateExten = ValidityDateExtendedUpto.Text;
        //            var amountIncDec = AmountIncDecBy.Text;
        //            var totalValueOfGuarantee = TotalValueOfGuarantee.Text;
        //          //  var currencyOfGuarantee = ;
        //            var debitAccount = DebitAccount.Text;
        //            var nameOfCompany = NameOfCompany.Text;
        //            var accountNum=AccountNum.Text;
        //            var others = Others.Value;


        //            using (DocX document = DocX.Load(@"C:\\GuaranteeApplication.docx"))
        //            {
        //                document.ReplaceText("[date]", datetoday);
        //                document.ReplaceText("[branch]", branch);
        //                document.ReplaceText("[guaranteeNum]", guaranteeNum);
        //                document.ReplaceText("[guaranteeAmount]", guaranteeAmount);
        //                document.ReplaceText("[guaranteeIssuedDate]", guranteeIssueDate);
        //                document.ReplaceText("[beneficiary]", beneficiary);
        //                document.ReplaceText("[validityDateExtended]", validityDateExten);
        //                document.ReplaceText("[amount]", amountIncDec);
        //                document.ReplaceText("[totalValOfGuarantee]", totalValueOfGuarantee);
        //                document.ReplaceText("[debitAcc]", debitAccount);
        //                //   document.ReplaceText("[others]", );
        //                document.ReplaceText("[nameOfCompany]", nameOfCompany);
        //                //      document.ReplaceText("[accountNo]", );
        //                document.ReplaceText("[debitAcc]", debitAccount);
        //                //  document.ReplaceText("[dateOfContract]",");
        //                //  document.ReplaceText("[detailsOfContract]",);
        //                document.ReplaceText("[debitAccount]", debitAccount);
        //                document.ReplaceText("[nameOfCompany]", nameOfCompany);
        //                document.ReplaceText("[accountNo]", accountNum);
        //                document.ReplaceText("[others]", others);


        //                // Save changes made to this document
        //                document.SaveAs(@"C:\\GuaranteeApplication1.doc");
        //            }
        //                for (int i = 0; i < 10000;i++ )
        //                {
        //                    i++;
        //                }

        //              string filePath = @"C:\\GuaranteeApplication.docx"; // Specify the location of the .docx file
        //using (FileStream fileStream = File.OpenRead(filePath))
        //{
        //MemoryStream memStream = new MemoryStream();
        //memStream.SetLength(fileStream.Length);
        //fileStream.Read(memStream.GetBuffer(), 0, (int)fileStream.Length);

        //Response.Clear();
        //Response.ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
        //Response.AddHeader("Content-Disposition", "attachment; filename=myfile.docx");
        //Response.BinaryWrite(memStream.ToArray());
        //Response.Flush();
        //Response.Close();
        //Response.End();
        //}

        //        }


        protected void Printbtn_Click(object sender, EventArgs e)
        {
            string pdfTemplate = @"C:\\GuaranteeApplicationFormat.pdf";
            string newFile = @"C:\\GuaranteeApplication1.pdf";
            PdfReader pdfReader = new PdfReader(pdfTemplate);
            PdfStamper pdfStamper = new PdfStamper(pdfReader, new FileStream(
                newFile, FileMode.Create));
            AcroFields pdfFormFields = pdfStamper.AcroFields;
            // set form pdfFormFields
            // The first worksheet and W-4 form

            //pdfFormFields.SetField("chkIND", "" + chkIND.Checked+ "");

            //if (chkIND.Checked) 
            //{ pdfFormFields.SetField("chkIND", "Yes");}
            //else   { pdfFormFields.SetField("chkIND", "No"); }

            //if (chkNRN.Checked) { pdfFormFields.SetField("chkNRN", "Yes"); }
            //else { pdfFormFields.SetField("chkNRN", "No"); }

            //if (chkforeigner.Checked) { pdfFormFields.SetField("chkforeigner", "Yes"); }
            //else { pdfFormFields.SetField("chkforeigner", "No"); }


            pdfFormFields.SetField("[date]", DateToday.Text);
            pdfFormFields.SetField("[branch]", Branch.Text);
            pdfFormFields.SetField("[guaranteeNum]", GuaranteeNumber.Text);
            pdfFormFields.SetField("[guaranteeAmount]", GuaranteeAmount.Text);
            pdfFormFields.SetField("[guaranteeIssuedDate]", DayOfGuaranteeIssued.Text + "/" + MonthOfGuaranteeIssued.Text + "/" + YearOfGuaranteeIssued.Text);
            pdfFormFields.SetField("[beneficiary]", Beneficiary.Text);
            pdfFormFields.SetField("[validityDateExtended]", DayValidityExtended.Text + "/" + MonthValidityExtended.Text + "/" + YearValidityExtended.Text);
            pdfFormFields.SetField("[amount]", AmountIncDecBy.Text);
            pdfFormFields.SetField("[totalValOfGuarantee]", TotalValueOfGuarantee.Text);
            // pdfFormFields.SetField("[nameOfCompany]", NameOfCompany.Text);

            //name of company
            pdfFormFields.SetField("[debitAcc]", DebitAccount.Text);
            pdfFormFields.SetField("[accountNo]", AccountNum.Text);
            pdfFormFields.SetField("[acc]", AccN.Text);

            String other;
            String[] splitedVal = null;


            other = Others.Value;
            //  String modified=other.Insert(75, ";");
            //splitedVal= modified.Split(';');
            int i = 0;
            int currentPosition = 0;
            int interval = 75;
            StringBuilder result = new StringBuilder();

            //while(currentPosition +interval <= other.Length)
            //{
            //    splitedVal[i]=result.Append(other.Substring(currentPosition, interval)).ToString();
            //    i++;
            //    currentPosition = currentPosition + interval;
            //}

            //if (currentPosition < other.Length)
            //{
            //  splitedVal[i]=result.Append(other.Substring(currentPosition)).ToString();
            //}


            string result1 = InsertStringAtInterval(other, ";", 91);
            splitedVal = result1.Split(';');
            foreach (var st in splitedVal)
            {
                i++;
                pdfFormFields.SetField("[others" + i + "]", st);

            }

            i = 0;
            String other2 = NameOfCompany.Text;
            String[] splitedVal2 = null;
            string result2 = InsertStringAtInterval(other2, ";", 24);
            splitedVal2 = result2.Split(';');
            foreach (var st in splitedVal2)
            {
                i++;
                pdfFormFields.SetField("[nameOfCompany" + i + "]", st);

            }



            //pdfFormFields.SetField("Date2", "" + date2.Text + "");
            //pdfFormFields.SetField("Date3", "" + date3.Text + "");
            //pdfFormFields.SetField("Date4", "" + date4.Text + "");

            pdfStamper.FormFlattening = false;
            pdfStamper.Close();

            //string pdfPath = Server.MapPath("~/DPIndivduals2.pdf");
            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(newFile);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-length", buffer.Length.ToString());
            Response.BinaryWrite(buffer);
        }

        public static string InsertStringAtInterval(string source, string insert, int interval)
        {
            StringBuilder result = new StringBuilder();
            int currentPosition = 0;
            while (currentPosition + interval < source.Length)
            {
                result.Append(source.Substring(currentPosition, interval)).Append(insert);
                currentPosition += interval;
            }
            if (currentPosition < source.Length)
            {
                result.Append(source.Substring(currentPosition));
            }
            return result.ToString();
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            SqlDataReader sqlreader = null;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString);
            conn.Open();
            string sql2 = "insert into AmendmentBankGuarantee (date_of_appl, branch, guarantee_num, guarantee_amount, guarantee_issued_date, beneficiary, validity_date_extended, amount_inc_dec, total_val_guarantee, others, debit_acc, company_name, account_num)";
            sql2 = sql2 + "values(@date_of_app,@branch,@guarantee_num,@guarantee_amt,@guarantee_issued_date,@beneficiary,@validity_date,@amount_inc_dec,@total_val_guarantee,@others,@debit_acc,@company_name,@account_num)";
            //    sql2 = sql2 + "values(" + "'" + DateOfApplication.Text + "'" + "," + "'" + Branch.Text + "'" + "," + "'" + NameOfApplicant.Text + "'" + "," + "'" + AddressOfApplicant.Text + "'" + "," + TelephoneNo.Text + "," ;
            //   sql2 = sql2 + "'" + EmailAddress.Text + "'" + "," + "'" + NameOfBeneficiary.Text + "'" + "," + "'" + AddressOfBeneficiary.Text + "'" + "," + TelephoneOfBeneficiary.Text + "," + "'" + NatureOfGuarantee.SelectedItem.Value + "'" + "," + CurrencyOfGuarantee.Text + "," ;
            //sql2 =sql2 + ContractNo.Text + "," + "'" + DetailsOfContract.Value + "'" + "," + "'" + ContractPaperEnclosed.SelectedItem.Value + "'" + "," + "'" + CounterGuarantee.SelectedItem.Value + "'" + "," +  "'" + IssueGuaranteeAsPer.SelectedItem.Value + "'" + "," + AccountNo.Text + ")";

            SqlCommand sqlcmd = new SqlCommand(sql2, conn);
            sqlcmd.Parameters.AddWithValue("@date_of_app", DateToday.Text);
            sqlcmd.Parameters.AddWithValue("@branch", Branch.Text);
            sqlcmd.Parameters.AddWithValue("@guarantee_num", GuaranteeNumber.Text);
            sqlcmd.Parameters.AddWithValue("@guarantee_amt", GuaranteeAmount.Text);
            sqlcmd.Parameters.AddWithValue("@guarantee_issued_date", DayOfGuaranteeIssued.Text + "/" + MonthOfGuaranteeIssued.Text + "/" + YearOfGuaranteeIssued.Text);
            sqlcmd.Parameters.AddWithValue("@beneficiary", Beneficiary.Text);

            sqlcmd.Parameters.AddWithValue("@validity_date", DayValidityExtended.Text + "/" + MonthValidityExtended.Text + "/" + YearValidityExtended.Text);
            sqlcmd.Parameters.AddWithValue("@amount_inc_dec", AmountIncDecBy.Text);
            sqlcmd.Parameters.AddWithValue("@total_val_guarantee", TotalValueOfGuarantee.Text);
            sqlcmd.Parameters.AddWithValue("@others", Others.Value);
            sqlcmd.Parameters.AddWithValue("@debit_acc", DebitAccount.Text);
            //      sqlcmd.Parameters.AddWithValue("@validity_of_bond",  );

            sqlcmd.Parameters.AddWithValue("@company_name", NameOfCompany.Text);
            //  sqlcmd.Parameters.AddWithValue("@date_of_contract", DayOfContract.Text);
            sqlcmd.Parameters.AddWithValue("@account_num", AccountNum.Text);

            Response.Write(sql2);
            // sqlreader = sqlcmd.();
            sqlcmd.ExecuteNonQuery();
            conn.Close();

        }




        //protected void SubmitBtn_Click(object sender, EventArgs e)
        //{
        //        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString);
        //        conn.Open();
        //        string sql2 = "insert into dbo.BankGuaranteeTable (Date_of_Application, Branch, Name_of_Applicant, Address_of_Applicant, Tel_no, Email_Address, Name_of_Beneficiary, Address_of_Beneficiary, Tel_of_Beneficiary, Nature_of_Guarantee, Currency_Amount_of_Guarantee, Validity_of_Bond, Contract_no, Date_of_Contract, Details_of_Contract, Contract_Papers, Counter_Guarantee, Issue_Guarantee_as_per, Cust_Acc_no)";
        //         sql2 =  sql2 + "values(@date_of_app, @branch, @name_of_app,@address_of_app,@tel,@email_address,@name_of_beneficiary,@address_of_beneficiary,@tel_of_beneficiary,@nature_of_guarantee,@currency_amount_of_guarantee,@validity_of_bond,@contract,@date_of_contract,@details_of_contract,@contract_papers,@counter_guarantee,@issue_guarantee_as_per,@cust_acct)";

        //        SqlCommand sqlcmd = new SqlCommand(sql2, conn);
        //        sqlcmd.Parameters.AddWithValue("@date_of_app", DateToday.Text);
        //        sqlcmd.Parameters.AddWithValue("@branch", Branch.Text);
        //        sqlcmd.Parameters.AddWithValue("@name_of_app", );
        //        sqlcmd.Parameters.AddWithValue("@address_of_app", ddBranch.SelectedItem.ToString());
        //        sqlcmd.Parameters.AddWithValue("@tel", txtNetworkLogin.Text);
        //        sqlcmd.Parameters.AddWithValue("@email_address", ddDelFlg.Text);

        //        sqlcmd.Parameters.AddWithValue("@name_of_beneficiary", txtEmpId.Text);
        //        sqlcmd.Parameters.AddWithValue("@address_of_beneficiary", txtFirstName.Text);
        //        sqlcmd.Parameters.AddWithValue("@tel_of_beneficiary", txtLastName.Text);
        //        sqlcmd.Parameters.AddWithValue("@nature_of_guarantee", ddBranch.SelectedItem.ToString());
        //        sqlcmd.Parameters.AddWithValue("@currency_amount_of_guarantee", txtNetworkLogin.Text);
        //        sqlcmd.Parameters.AddWithValue("@validity_of_bond", ddDelFlg.Text);

        //      sqlcmd.Parameters.AddWithValue("@@contract", txtEmpId.Text);
        //        sqlcmd.Parameters.AddWithValue("@@date_of_contract", txtFirstName.Text);
        //        sqlcmd.Parameters.AddWithValue("@@details_of_contract", txtLastName.Text);
        //        sqlcmd.Parameters.AddWithValue("@@contract_papers", ddBranch.SelectedItem.ToString());
        //        sqlcmd.Parameters.AddWithValue("@@counter_guarantee", txtNetworkLogin.Text);
        //        sqlcmd.Parameters.AddWithValue("@@issue_guarantee_as_per", ddDelFlg.Text);
        //       sqlcmd.Parameters.AddWithValue("@@@cust_acct", ddDelFlg.Text);
        //        sqlcmd.ExecuteNonQuery();
        //}


    }
}
