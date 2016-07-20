using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Word = Microsoft.Office.Interop.Word;
using System.IO;
using Novacode;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Configuration;
using iTextSharp.text.pdf;
using System.Text;
using System.Net;

namespace BankGuarantee
{
     public partial class NiblBankGuarantee : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {


        }

        //public void FindandReplace(Word.Document doc, string Findtext, string ReplaceText)
        //{
        //    Word.Range myStoryRange = doc.Range();

        //    //First search the main document using the Selection
        //    Word.Find myFind = myStoryRange.Find;
        //    myFind.Text = Findtext;
        //    myFind.Replacement.Text = ReplaceText;
        //    myFind.Forward = true;
        //    myFind.Wrap = Word.WdFindWrap.wdFindContinue;
        //    myFind.Format = false;
        //    myFind.MatchCase = false;
        //    myFind.MatchWholeWord = false;
        //    myFind.MatchWildcards = false;
        //    myFind.MatchSoundsLike = false;
        //    myFind.MatchAllWordForms = false;
        //    myFind.Execute(Replace: Word.WdReplace.wdReplaceAll);

        //    //'Now search all other stories using Ranges
        //    foreach (Word.Range otherStoryRange in doc.StoryRanges)
        //    {
        //        if (otherStoryRange.StoryType != Word.WdStoryType.wdMainTextStory)
        //        {
        //            Word.Find myOtherFind = otherStoryRange.Find;
        //            myOtherFind.Text = Findtext;
        //            myOtherFind.Replacement.Text = ReplaceText;
        //            myOtherFind.Wrap = Word.WdFindWrap.wdFindContinue;
        //            myOtherFind.Execute(Replace: Word.WdReplace.wdReplaceAll);
        //        }

        //        // 'Now search all next stories of other stories (doc.storyRanges dont seem to cascades in sub story)
        //        Word.Range nextStoryRange = otherStoryRange.NextStoryRange;
        //        while (nextStoryRange != null)
        //        {
        //            Word.Find myNextStoryFind = nextStoryRange.Find;
        //            myNextStoryFind.Text = Findtext;
        //            myNextStoryFind.Replacement.Text = ReplaceText;
        //            myNextStoryFind.Wrap = Word.WdFindWrap.wdFindContinue;
        //            myNextStoryFind.Execute(Replace: Word.WdReplace.wdReplaceAll);

        //            nextStoryRange = nextStoryRange.NextStoryRange;
        //        }

        //    }
        //}

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {

            SqlDataReader sqlreader = null;
             SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString);
                conn.Open();
                string sql2 = "insert into dbo.BankGuaranteeTable (Date_of_Application, Branch, Name_of_Applicant, Address_of_Applicant, Tel_no, Email_Address, Name_of_Beneficiary, Address_of_Beneficiary, Tel_of_Beneficiary, Nature_of_Guarantee, Currency_Amount_of_Guarantee,Validity_of_Bond, Contract_no,Date_of_Contract, Details_of_Contract, Contract_Papers, Counter_Guarantee, Issue_Guarantee_as_per, Cust_Acc_no)";
                sql2 = sql2 + "values(@date_of_app, @branch, @name_of_app,@address_of_app,@tel,@email_address,@name_of_beneficiary,@address_of_beneficiary,@tel_of_beneficiary,@nature_of_guarantee,@currency_amount_of_guarantee,@validity_of_bond,@contract,@date_of_contract,@details_of_contract,@contract_papers,@counter_guarantee,@issue_guarantee_as_per,@cust_acct)";
            //    sql2 = sql2 + "values(" + "'" + DateOfApplication.Text + "'" + "," + "'" + Branch.Text + "'" + "," + "'" + NameOfApplicant.Text + "'" + "," + "'" + AddressOfApplicant.Text + "'" + "," + TelephoneNo.Text + "," ;
            //   sql2 = sql2 + "'" + EmailAddress.Text + "'" + "," + "'" + NameOfBeneficiary.Text + "'" + "," + "'" + AddressOfBeneficiary.Text + "'" + "," + TelephoneOfBeneficiary.Text + "," + "'" + NatureOfGuarantee.SelectedItem.Value + "'" + "," + CurrencyOfGuarantee.Text + "," ;
            //sql2 =sql2 + ContractNo.Text + "," + "'" + DetailsOfContract.Value + "'" + "," + "'" + ContractPaperEnclosed.SelectedItem.Value + "'" + "," + "'" + CounterGuarantee.SelectedItem.Value + "'" + "," +  "'" + IssueGuaranteeAsPer.SelectedItem.Value + "'" + "," + AccountNo.Text + ")";

                SqlCommand sqlcmd = new SqlCommand(sql2, conn);
               
                sqlcmd.Parameters.AddWithValue("@date_of_app",DateOfApplication.Text );
                sqlcmd.Parameters.AddWithValue("@branch", Branch.Text);
                sqlcmd.Parameters.AddWithValue("@name_of_app", NameOfApplicant.Text);
                sqlcmd.Parameters.AddWithValue("@address_of_app", AddressOfApplicant.Text);
                sqlcmd.Parameters.AddWithValue("@tel", TelephoneNo.Text);
                sqlcmd.Parameters.AddWithValue("@email_address", EmailAddress.Text);

                sqlcmd.Parameters.AddWithValue("@name_of_beneficiary", NameOfBeneficiary.Text);
                sqlcmd.Parameters.AddWithValue("@address_of_beneficiary", AddressOfBeneficiary.Text);
                sqlcmd.Parameters.AddWithValue("@tel_of_beneficiary", TelephoneOfBeneficiary.Text);
                sqlcmd.Parameters.AddWithValue("@nature_of_guarantee", NatureOfGuarantee.Text);
                sqlcmd.Parameters.AddWithValue("@currency_amount_of_guarantee", CurrencyOfGuarantee.Text);
                sqlcmd.Parameters.AddWithValue("@validity_of_bond",DayOfValidity.Text + "/" + MonthOfValidity.Text + "/" + YearOfValidity.Text);

                sqlcmd.Parameters.AddWithValue("@contract", ContractNo.Text);
                sqlcmd.Parameters.AddWithValue("@date_of_contract",DayOfContract.Text + "/" + MonthOfContract.Text + "/" + YearOfContract.Text);
                sqlcmd.Parameters.AddWithValue("@details_of_contract", DetailsOfContract.Value);
                sqlcmd.Parameters.AddWithValue("@contract_papers", ContractPaperEnclosed.SelectedItem.Value);
                sqlcmd.Parameters.AddWithValue("@counter_guarantee", CounterGuarantee.SelectedItem.Value);
                sqlcmd.Parameters.AddWithValue("@issue_guarantee_as_per", IssueGuaranteeAsPer.SelectedItem.Value);
                sqlcmd.Parameters.AddWithValue("@cust_acct", DebitAccountNo.Text);

             //   DateTime dt = new DateTime();
            
                Response.Write(sql2);
              // sqlreader = sqlcmd.();
               sqlcmd.ExecuteNonQuery();
               conn.Close();
        }

        protected void PrintBtn_Click(object sender, EventArgs e)
        {
            string pdfTemplate = @"C:\\BankGuarantee.pdf";
            string newFile = @"C:\\BankGuarantee1.pdf";
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
        

            pdfFormFields.SetField("[date]", DateOfApplication.Text);
            pdfFormFields.SetField("[branch]", Branch.Text);
            pdfFormFields.SetField("[nameOfApplicant]", NameOfApplicant.Text);
            pdfFormFields.SetField("[addressOfApplicant]", AddressOfApplicant.Text);
            pdfFormFields.SetField("[telNo]", TelephoneNo.Text);
            pdfFormFields.SetField("[emailAddress]", EmailAddress.Text);
            pdfFormFields.SetField("[nameOfBeneficiary]", NameOfBeneficiary.Text);
            pdfFormFields.SetField("[addressOfBeneficiary]", AddressOfBeneficiary.Text);
            pdfFormFields.SetField("[telephone_no]", TelephoneOfBeneficiary.Text);
            pdfFormFields.SetField("[currencyOfGuarantee]", CurrencyOfGuarantee.Text);
           
            pdfFormFields.SetField("[dateValidityBond]",DayOfValidity.SelectedItem.Value );

            pdfFormFields.SetField("[monthValidityBond]",MonthOfValidity.SelectedItem.Value );
            pdfFormFields.SetField("[yearValidityBond]", YearOfValidity.SelectedItem.Value);
            pdfFormFields.SetField("[contractNum]", ContractNo.Text);
            string contractdate="";
            contractdate=DayOfContract.SelectedItem.Value + '-' + MonthOfContract.SelectedItem.Value + '-' + YearOfContract.SelectedItem.Value;
            pdfFormFields.SetField("[contractDate]",contractdate );
       
            pdfFormFields.SetField("[nameOfCompany]", NameOfCompany.Text);
            pdfFormFields.SetField("[debitAcc]", DebitAccountNo.Text);
             pdfFormFields.SetField("[accCompany]",AccOfCompany.Text );
             pdfFormFields.SetField("[accNum]", AccN.Text);


           int NGindex= NatureOfGuarantee.SelectedIndex;
           if (NGindex == 0)
               pdfFormFields.SetField("[natureOfGuarantee1]", "Yes");
           else if (NGindex == 1)
               pdfFormFields.SetField("[natureOfGuarantee2]", "Yes");
           else if(NGindex==2)
              pdfFormFields.SetField("[natureOfGuarantee3]", "Yes");
           else if (NGindex == 3)
           {
               pdfFormFields.SetField("[natureOfGuarantee4]", "Yes");
               pdfFormFields.SetField("[othersSpecify]", OthersSpecify.Text);
           }
           else
           { ;}
           

           int CPindex = ContractPaperEnclosed.SelectedIndex;
            if(CPindex==0)
                pdfFormFields.SetField("[contractPaper1]", "Yes");
            else if (CPindex == 1)
            {
                pdfFormFields.SetField("[contractPaper2]", "Yes");
            }
            else { ; }


            int CGindex = CounterGuarantee.SelectedIndex;
            if (CGindex == 0)
                pdfFormFields.SetField("[counterGuarantee1]", "Yes");
            else if (CGindex == 1)
                pdfFormFields.SetField("[counterGuarantee2]", "Yes");
            else { ;}


            int IGindex = IssueGuaranteeAsPer.SelectedIndex;
            if (IGindex == 0)
                pdfFormFields.SetField("[issueGuarantee1]", "Yes");
            else if (IGindex == 1)
                pdfFormFields.SetField("[issueGuarantee2]", "Yes");
            else { ;}
            
            

            
                       


            String details;
            String[] splitedVal = null;
          
           
               details = DetailsOfContract.Value;               
               int i = 0;
                  
     
             string result1= InsertStringAtInterval(details, ";", 115);
             splitedVal = result1.Split(';');
            foreach(var st in splitedVal)
            {
                i++;                
                pdfFormFields.SetField("[detailsOfContract1" + i + "]", st);
                
            }

            details = AmountOfGuarantee.Text;
            splitedVal = null;
            if (details.Length > 50)
            {
                String modified = details.Insert(50, ";");
                splitedVal = modified.Split(';');
                pdfFormFields.SetField("[amountOfGuarantee1]", splitedVal[0]);
                pdfFormFields.SetField("[amountOfGuarantee2]", splitedVal[1]);
            }
            else
            {
                pdfFormFields.SetField("[amountOfGuarantee1]", details);
            }
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

          



       
    }
}