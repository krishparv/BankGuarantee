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
using System.Globalization;
using System.Net.Mail;

namespace BankGuarantee
{
    public partial class BankGuarantee : System.Web.UI.Page
    {
        bool index = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime today = new DateTime();
            DateOfApplication.Text = DateTime.Now.ToString("dd-MM-yy");
            OthersSpecify.ReadOnly = true;
            var ref_no = Request.QueryString["ref"];
            int year = DateTime.Now.Year;
            for (int i = year; i < year + 20; i++)
            {
                YearOfValidity.Items.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()));
            }


            // DayOfContract.SelectedValue = DateTime.Now.Day.ToString();

            // MonthOfContract.SelectedValue = CultureInfo.CurrentCulture.DateTimeFormat.GetAbbreviatedMonthName(DateTime.Now.Month);
            for (int i = year - 80; i < year + 20; i++)
            {
                YearOfContract.Items.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()));
            }
            //  YearOfContract.SelectedValue = DateTime.Now.Year.ToString();



            //DateTime.Now.GetDateTimeFormats('dd/mm/yyyy');
            //if (!Page.IsPostBack)
            //{
            //    if (Session["Ref_no"] != null)
            //    {
            //        string s_ref = Session["Ref_no"].ToString();
            //        if (s_ref.Trim() != null)
            //        {
            //            load_data_Click(s_ref);
            //        }
            //    }
            //}

            //else
            //{
            //    //  Session["Ref_no"] = null;               
            //}

            if (ref_no != null)
            {
                load_data_Click(ref_no);
            }

        }


        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            PrintBtn.Visible = true;
            SubmitBtn.Visible = false;
            SqlDataReader sqlreader = null;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString);
            conn.Open();
            string sql1 = null;
            //   string ref_no = Session["Ref_no"].ToString();
            string _guid = Guid.NewGuid().ToString();
            string reff = Ref_no.Text;
            if ((reff != null) && (reff != ""))
            {
                sql1 = "update dbo.BankGuaranteeTable " +
              "set Date_of_Application=@date_of_app, " +
              "Branch=@branch, " +
              "Name_of_Applicant=@name_of_app, " +
              "Address_of_Applicant=@address_of_app, " +
              "Tel_no=@tel, " +
              "Email_Address=@email_address, " +
              "Name_of_Beneficiary=@name_of_beneficiary, " +
              "Address_of_Beneficiary=@address_of_beneficiary, " +
              "Tel_of_Beneficiary=@tel_of_beneficiary, " +
              "Nature_of_Guarantee=@nature_of_guarantee, " +
              "Currency_Amount_of_Guarantee=@currency_amount_of_guarantee, " +
              "Validity_of_Bond=@validity_of_bond," +
              "Contract_no=@contract, " +
              "Date_of_Contract=@date_of_contract, " +
              "Details_of_Contract=@details_of_contract, " +
              "Contract_Papers=@contract_papers, " +
              "Counter_Guarantee=@counter_guarantee, " +
              "Issue_Guarantee_as_per=@issue_guarantee_as_per, " +
              "Acc1=@acc1," +
             "Acc2=@acc2," +
             "Acc3=@acc3," +
             "Name_Of_Company=@nameOfCompany, " +
             "G_ref=@guid" +
              "where Ref_no=" + Convert.ToInt32(reff);

            }
            else
            {
                sql1 = "insert into dbo.BankGuaranteeTable (Date_of_Application, Branch, Name_of_Applicant, Address_of_Applicant, Tel_no, Email_Address, Name_of_Beneficiary, Address_of_Beneficiary, Tel_of_Beneficiary, Nature_of_Guarantee, Currency_Amount_of_Guarantee,Validity_of_Bond, Contract_no,Date_of_Contract, Details_of_Contract, Contract_Papers, Counter_Guarantee, Issue_Guarantee_as_per, Acc1,Acc2,Acc3,Name_Of_Company,G_ref)";
                sql1 = sql1 + "values(@date_of_app, @branch, @name_of_app,@address_of_app,@tel,@email_address,@name_of_beneficiary,@address_of_beneficiary,@tel_of_beneficiary,@nature_of_guarantee,@currency_amount_of_guarantee,@validity_of_bond,@contract,@date_of_contract,@details_of_contract,@contract_papers,@counter_guarantee,@issue_guarantee_as_per,@acc1,@acc2,@acc3,@nameOfCompany,@guid)";
            }
            //SqlCommand sqlcmd = new SqlCommand(sql2, conn);
            SqlHelper _sqlhelper = new SqlHelper();
            //int status = _sqlhelper.ExecuteNonQuery(sql1, "@date_of_app", DateOfApplication.Text, "@branch", Branch.Text, "@name_of_app", NameOfApplicant.Text, "@address_of_app",
            //   // AddressOfApplicant.Text, "@tel", TelephoneNo.Text, "@email_address", EmailAddress.Text, "@name_of_beneficiary", NameOfBeneficiary.Text, "@address_of_beneficiary",
               // AddressOfBeneficiary.Text, "@tel_of_beneficiary", TelephoneOfBeneficiary.Text, "@nature_of_guarantee", NatureOfGuarantee.Text, "@currency_amount_of_guarantee",
               // CurrencyOfGuarantee.Text, "@validity_of_bond", DayOfValidity.Text + "/" + MonthOfValidity.Text + "/" + YearOfValidity.Text, "@contract", ContractNo.Text,
               //"@date_of_contract", DayOfContract.Text + "/" + MonthOfContract.Text + "/" + YearOfContract.Text, "@details_of_contract", DetailsOfContract.Value, "@contract_papers",
               // ContractPaperEnclosed.SelectedItem.Value, "@counter_guarantee", CounterGuarantee.SelectedItem.Value, "@issue_guarantee_as_per", IssueGuaranteeAsPer.SelectedItem.Value,
               // "@acc1", DebitAccountNo.Text, "@acc2", AccOfCompany.Text, "@acc3", AccN.Text, "@nameOfCompany", NameOfCompany.Text, "@guid", _guid);

  int status = _sqlhelper.ExecuteNonQuery(sql1, "@date_of_app","1", "@branch", "1", "@name_of_app","2", "@address_of_app",
                "3", "@tel","4", "@email_address","5", "@name_of_beneficiary", "6", "@address_of_beneficiary",
                "7", "@tel_of_beneficiary", "8", "@nature_of_guarantee", "9", "@currency_amount_of_guarantee",
                "10", "@validity_of_bond","11", "@contract", "12",
               "@date_of_contract","13", "@details_of_contract", "14", "@contract_papers",
                "15", "@counter_guarantee", "16", "@issue_guarantee_as_per", "17",
                "@acc1", "18", "@acc2", "19", "@acc3", "20", "@nameOfCompany","21", "@guid", "22");

            
            if (status == 1)
            {
                SendMail(_guid, EmailBox.Text);
            }


            string sql2 = "select Top(1) Ref_no from BankGuaranteeTable order by Ref_no desc";
            //SqlCommand sqlcmd1 = new SqlCommand(sql3, conn);
            //SqlDataReader sqlreader1 = sqlcmd1.ExecuteReader();
            SqlDataReader sqlreader1= _sqlhelper.ExecuteReader(sql2);
            while (sqlreader1.Read())
            {
                if (Ref_no.Text == null || Ref_no.Text == "")
                {
                    Ref_no.Text = sqlreader1.GetInt32(0).ToString();
                }
            }

            sqlreader1.Close();
            _sqlhelper.Disconnect();
            SubmitBtn.Visible = false;
            PrintBtn_Click();
        }

        protected void PrintBtn_Click()
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

            pdfFormFields.SetField("[Form_Ref]", Ref_no.Text);
            pdfFormFields.SetField("[date]", DateOfApplication.Text);
            pdfFormFields.SetField("[branch]", Branch.Text.ToUpper());
            pdfFormFields.SetField("[nameOfApplicant]", NameOfApplicant.Text.ToUpper());
            pdfFormFields.SetField("[addressOfApplicant]", AddressOfApplicant.Text.ToUpper());
            pdfFormFields.SetField("[telNo]", TelephoneNo.Text);
            pdfFormFields.SetField("[emailAddress]", EmailAddress.Text);
            pdfFormFields.SetField("[nameOfBeneficiary]", NameOfBeneficiary.Text.ToUpper());
            pdfFormFields.SetField("[addressOfBeneficiary]", AddressOfBeneficiary.Text.ToUpper());
            pdfFormFields.SetField("[telephone_no]", TelephoneOfBeneficiary.Text);
            pdfFormFields.SetField("[currencyOfGuarantee]", CurrencyOfGuarantee.Text);

            pdfFormFields.SetField("[dateValidityBond]", DayOfValidity.SelectedItem.Value);

            pdfFormFields.SetField("[monthValidityBond]", MonthOfValidity.SelectedItem.Value);
            pdfFormFields.SetField("[yearValidityBond]", YearOfValidity.SelectedItem.Value);
            pdfFormFields.SetField("[contractNum]", ContractNo.Text);
            string contractdate = "";
            contractdate = DayOfContract.SelectedItem.Value + '-' + MonthOfContract.SelectedItem.Value + '-' + YearOfContract.SelectedItem.Value;
            pdfFormFields.SetField("[contractDate]", contractdate);

            pdfFormFields.SetField("[nameOfCompany]", NameOfCompany.Text.ToUpper());
            pdfFormFields.SetField("[debitAcc]", DebitAccountNo.Text);
            pdfFormFields.SetField("[accCompany]", AccOfCompany.Text);
            pdfFormFields.SetField("[accNum]", AccN.Text);


            int NGindex = NatureOfGuarantee.SelectedIndex;
            if (NGindex == 0)
                pdfFormFields.SetField("[natureOfGuarantee1]", "Yes");
            else if (NGindex == 1)
                pdfFormFields.SetField("[natureOfGuarantee2]", "Yes");
            else if (NGindex == 2)
                pdfFormFields.SetField("[natureOfGuarantee3]", "Yes");
            else if (NGindex == 3)
            {
                pdfFormFields.SetField("[natureOfGuarantee4]", "Yes");
                pdfFormFields.SetField("[othersSpecify]", OthersSpecify.Text.ToUpper());
            }
            else
            { ;}


            int CPindex = ContractPaperEnclosed.SelectedIndex;
            if (CPindex == 0)
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



            string result1 = InsertStringAtInterval(details, ";", 115);
            splitedVal = result1.Split(';');
            foreach (var st in splitedVal)
            {
                i++;
                pdfFormFields.SetField("[detailsOfContract" + i + "]", st);

            }

            details = AmountOfGuarantee.Text;
            splitedVal = null;
            if (details.Length > 50)
            {
                String modified = details.Insert(49, ";");
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


        protected void load_data_Click(String ref_no)
        {
            if (ref_no == null || ref_no == "")
            {
                label_ref.Text = "No Reference number found.";
            }

            else
            {
                //  Ref_no.Text = ref_no;

                //  SqlDataReader sqlreader = null;
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString);
                conn.Open();
                string sql2 = "Select * from BankGuaranteeTable where G_ref=@ref";
                SqlCommand sqlcmd = new SqlCommand(sql2, conn);
                sqlcmd.Parameters.AddWithValue("@ref", ref_no);

                SqlDataReader sqlreader = sqlcmd.ExecuteReader();
                while (sqlreader.Read())
                {
                    Ref_no.Text = sqlreader.GetInt32(0).ToString();
                    DateOfApplication.Text = sqlreader.GetString(1);
                    Branch.Text = sqlreader.GetString(2);
                    NameOfApplicant.Text = sqlreader.GetString(3);
                    AddressOfApplicant.Text = sqlreader.GetString(4);

                    TelephoneNo.Text = sqlreader.GetInt32(5).ToString();
                    //    MobileNum.Text = sqlreader.GetInt32(6)==null?"":sqlreader.GetInt32(6).ToString();
                    EmailAddress.Text = sqlreader.GetString(7);
                    NameOfBeneficiary.Text = sqlreader.GetString(8);
                    AddressOfBeneficiary.Text = sqlreader.GetString(9);
                    TelephoneOfBeneficiary.Text = sqlreader.GetString(10);
                    NatureOfGuarantee.Text = sqlreader.GetString(11);
                    if (NatureOfGuarantee.Text == "Others(Specify)")
                    {
                        OthersSpecify.ReadOnly = false;
                    }
                    else
                    {
                        OthersSpecify.ReadOnly = true;
                    }
                    CurrencyOfGuarantee.Text = sqlreader.GetInt32(12).ToString();
                    AmountOfGuarantee.Text = CurrencyOfGuarantee.Text == "" ? "" : (NumberToWords(Convert.ToInt32(CurrencyOfGuarantee.Text)).ToUpper() + " ONLY");

                    //validity of bond break in day, month, year
                    string indexval1 = sqlreader.GetString(13);
                    string[] index1 = indexval1.Split('/');
                    DayOfValidity.SelectedValue = index1[0];
                    MonthOfValidity.SelectedValue = index1[1];
                    YearOfValidity.SelectedValue = index1[2];


                    ContractNo.Text = sqlreader.GetString(14);
                    //date of contract
                    string indexval2 = sqlreader.GetString(15).ToString();
                    string[] index2 = indexval2.Split('/');
                    DayOfContract.SelectedValue = index2[0];
                    MonthOfContract.SelectedValue = index2[1];
                    YearOfContract.SelectedValue = index2[2];

                    DetailsOfContract.Value = sqlreader.GetString(16);
                    ContractPaperEnclosed.SelectedItem.Value = sqlreader.GetString(17);
                    CounterGuarantee.SelectedItem.Value = sqlreader.GetString(18);
                    IssueGuaranteeAsPer.SelectedItem.Value = sqlreader.GetString(19);
                    DebitAccountNo.Text = sqlreader.GetDecimal(20).ToString();

                    AccOfCompany.Text = sqlreader.GetDecimal(21).ToString();
                    AccN.Text = sqlreader.GetDecimal(22).ToString();
                    NameOfCompany.Text = sqlreader.GetString(23);
                    // http://www.dotnetperls.com/sqlclient
                }

                sqlreader.Close();

                // sqlreader = sqlcmd.();
                sqlcmd.ExecuteNonQuery();
                conn.Close();
                Session["Ref_no"] = null;

            }
        }

        //protected void EditForm_Click(object sender, EventArgs e)
        //{
        //    Session["Ref_no"] = null;
        //    index = true;
        //    Response.Redirect("~/EnterFormNoB.aspx");
        //}



        public static string NumberToWords(int number)
        {
            if (number == 0)
                return "zero";

            if (number < 0)
                return "minus " + NumberToWords(Math.Abs(number));

            string words = "";

            if ((number / 1000000) > 0)
            {
                words += NumberToWords(number / 1000000) + " million ";
                number %= 1000000;
            }

            if ((number / 1000) > 0)
            {
                words += NumberToWords(number / 1000) + " thousand ";
                number %= 1000;
            }

            if ((number / 100) > 0)
            {
                words += NumberToWords(number / 100) + " hundred ";
                number %= 100;
            }

            if (number > 0)
            {
                if (words != "")
                    words += "and ";

                var unitsMap = new[] { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen" };
                var tensMap = new[] { "zero", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety" };

                if (number < 20)
                    words += unitsMap[number];
                else
                {
                    words += tensMap[number / 10];
                    if ((number % 10) > 0)
                        words += "-" + unitsMap[number % 10];
                }
            }

            return words;
        }

        protected void CurrencyOfGuarantee_TextChanged(object sender, EventArgs e)
        {
            AmountOfGuarantee.Text = NumberToWords(Convert.ToInt32(CurrencyOfGuarantee.Text)).ToUpper() + " ONLY";
        }

        protected void NatureOfGuarantee_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (NatureOfGuarantee.SelectedValue == "Others(Specify)")
            {
                OthersSpecify.ReadOnly = false;
            }

            else
            {
                OthersSpecify.Text = string.Empty;
                OthersSpecify.ReadOnly = true;

            }
        }

        public void SendMail(string ref_no, string mail_address)
        {

            SmtpClient sc = new SmtpClient("10.1.2.3");
            NetworkCredential cr = new NetworkCredential("passthru", "testing");
            sc.Credentials = cr;
            System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage();
            mm.From = new MailAddress("system@nibl.com.np");

            mm.To.Add(new MailAddress(mail_address));
            //Attachment aa = new Attachment(@"NoTxnATMList.xlsx");

            mm.Subject = "Reference number for Bank Guarantee Form";
            //string g = Guid.NewGuid().ToString();

            mm.Body = "Reference Number:" + ref_no + " ";

            mm.Body += "<a href='http://localhost:28669/BankGuarantee.aspx?ref=" + ref_no + "'" + ">click here</a>";

            mm.IsBodyHtml = true;
            //  Response.Write(g);
            //mm.Attachments.Add(aa);
            sc.Send(mm);
        }

    }
}