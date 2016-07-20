using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
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
using System.Globalization;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace BankGuarantee
{
    public partial class AmendmentBankGuarantee : System.Web.UI.Page
    {
        bool index = false;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime today = new DateTime();
            if (AmountIncDecBy.Text== null || AmountIncDecBy.Text == "")
            {
                AmountIncDecBy.Text = "0.0";
            }

            var ref_no=Request.QueryString["ref"];
           
            DateOfApplication.Text = DateTime.Now.ToString("dd-MM-yyyy");
         //   DayOfGuaranteeIssued.SelectedValue = DateTime.Now.Day.ToString();
        //    MonthOfGuaranteeIssued.SelectedValue = CultureInfo.CurrentCulture.DateTimeFormat.GetAbbreviatedMonthName(DateTime.Now.Month);
            int year = DateTime.Now.Year;
            for (int i = year - 20; i < year + 20; i++)
            {
                YearOfGuaranteeIssued.Items.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()));
            }
          //  YearOfGuaranteeIssued.SelectedValue = year.ToString();

           // DayValidityExtended.SelectedValue = DateTime.Now.Day.ToString();
          //  MonthValidityExtended.SelectedValue = CultureInfo.CurrentCulture.DateTimeFormat.GetAbbreviatedMonthName(DateTime.Now.Month);
            for (int i = year; i < year + 20; i++)
            {
                YearValidityExtended.Items.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()));
            }

          //  YearValidityExtended.SelectedValue = DateTime.Now.Year.ToString();

        
            //if (!Page.IsPostBack)
            //{
            //    if (Session["Ref_A"] != null)
            //    {
            //        string s_ref = Session["Ref_A"].ToString();
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

            if(ref_no!=null)
            {
                load_data_Click(ref_no);
            }

            TotalValueOfGuarantee.ReadOnly = true;

            }
           
      


        protected void Printbtn_Click()
        {
         //   SendMail("1");
            string pdfTemplate = @"C:\\GuaranteeApplicationFormat.pdf";
            string newFile = @"C:\\GuaranteeApplication1.pdf";
            PdfReader pdfReader = new PdfReader(pdfTemplate);
            PdfStamper pdfStamper = new PdfStamper(pdfReader, new FileStream(
                newFile, FileMode.Create));
            AcroFields pdfFormFields = pdfStamper.AcroFields;

            pdfFormFields.SetField("[FormNoBox]", Ref_no.Text);
            pdfFormFields.SetField("[date]",DateOfApplication.Text);
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
          
           
                 other = Others.Value.ToUpper();
               //  String modified=other.Insert(75, ";");
               //splitedVal= modified.Split(';');
               int i = 0;
               int currentPosition = 0;
               int interval=75;
               StringBuilder result = new StringBuilder();           
        


             string result1= InsertStringAtInterval(other, ";", 85);
             splitedVal = result1.Split(';');
            foreach(var st in splitedVal)
            {
                i++;                
                pdfFormFields.SetField("[others" + i + "]", st);
                
            }

            i = 0;
            String other2 = NameOfCompany.Text;
            String[] splitedVal2 = null;
            string result2 = InsertStringAtInterval(other2, ";", 29);
            splitedVal2 = result2.Split(';');
            foreach (var st in splitedVal2)
            {
                i++;
                pdfFormFields.SetField("[nameOfCompany" + i + "]", st);

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

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
          //  ScriptManager.RegisterStartupScript(Page, typeof(System.Web.UI.Page), "Popup", "alert('this is alert message')",true);
            Printbtn.Visible = true;
            SubmitBtn.Visible = false;

            string _guid = Guid.NewGuid().ToString();

          //   SqlDataReader sqlreader = null;
           //  SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString);
            //    conn.Open();
                string sql2 = null;
               
                string reff = Ref_no.Text;
                if ((reff != null) && (reff != ""))
                {
                    sql2 = "update AmendmentBankGuarantee " +
                    "set date_of_appl=@date_of_app," +
                    "branch=@branch," +
                    "guarantee_num=@guarantee_num," +
                    "guarantee_amount=@guarantee_amt," +
                    "guarantee_issued_date=@guarantee_issued_date," +
                    "beneficiary=@beneficiary," +
                    "validity_date_extended=@validity_date," +
                    "amount_inc_dec=@amount_inc_dec," +
                    "total_val_guarantee=@total_val_guarantee," +
                    "others=@others," +
                    "debit_acc=@debit_acc," +
                    "company_name=@company_name," +
                    "account_num=@account_num, " +
                    "G_ref=@g_ref," +
                    "IncDecFlag=@inc_decFlag" +
                    " where Ref_no=" + Convert.ToInt32(reff);
                    
                }

                else
                {
                    sql2 = "insert into AmendmentBankGuarantee (date_of_appl, branch, guarantee_num, guarantee_amount, guarantee_issued_date, beneficiary, validity_date_extended,amount_inc_dec, total_val_guarantee, others, debit_acc, company_name, account_num,G_ref,IncDecFlag)";
                    sql2 = sql2 + "values(@date_of_app,@branch,@guarantee_num,@guarantee_amt,@guarantee_issued_date,@beneficiary,@validity_date,@amount_inc_dec,@total_val_guarantee,@others,@debit_acc,@company_name,@account_num,@g_ref,@inc_decFlag)";
                   }

                string total_val=Request.Form[TotalValueOfGuarantee.UniqueID];

                string incdecflag = string.Empty;

                if (IncDec.SelectedIndex == 0)
                {
                    incdecflag = "I";
                }
                else
                {
                    incdecflag = "D";
                }
                
               
                SqlHelper _sqlhelper = new SqlHelper();
          //string teststring= _sqlhelper.testquery(sql2, "@date_of_app", DateOfApplication.Text, "@branch", Branch.Text, "@guarantee_num", GuaranteeNumber.Text, "@guarantee_amt", GuaranteeAmount.Text, "@guarantee_issued_date", DayOfGuaranteeIssued.Text + "/" + MonthOfGuaranteeIssued.Text + "/" + YearOfGuaranteeIssued.Text, "@validity_date", DayValidityExtended + "/" + MonthValidityExtended + "/" + YearValidityExtended, "@beneficiary", Beneficiary.Text, "@amount_inc_dec", AmountIncDecBy.Text, "@total_val_guarantee", total_val, "@others", Others.Value.ToLower(), "@debit_acc", DebitAccount.Text, "@company_name", NameOfCompany.Text, "@account_num", AccountNum.Text, "@g_ref", _guid, "@inc_decFlag", incdecflag);
          //Response.Write(teststring);    
          //  return;
                int status=  _sqlhelper.ExecuteNonQuery(sql2, "@date_of_app",DateOfApplication.Text, "@branch", Branch.Text, "@guarantee_num", GuaranteeNumber.Text, "@guarantee_amt", GuaranteeAmount.Text, "@guarantee_issued_date", DayOfGuaranteeIssued.Text + "/" + MonthOfGuaranteeIssued.Text + "/" + YearOfGuaranteeIssued.Text,"@validity_date",DayValidityExtended.Text + "/" +MonthValidityExtended.Text+ "/" + YearValidityExtended.Text,"@beneficiary", Beneficiary.Text, "@amount_inc_dec", AmountIncDecBy.Text, "@total_val_guarantee", total_val, "@others", Others.Value.ToLower(), "@debit_acc", DebitAccount.Text, "@company_name", NameOfCompany.Text, "@account_num", AccountNum.Text, "@g_ref", _guid, "@inc_decFlag", incdecflag);

           //     Response.Write(sql2);
              // sqlreader = sqlcmd.();
             //int status= sqlcmd.ExecuteNonQuery();

            if(status==1)
            {
                SendMail(_guid,EmailBox.Text);
            }
               string sql3 = "select Top(1) Ref_no from AmendmentBankGuarantee order by Ref_no desc";
              SqlDataReader sqlreader= _sqlhelper.ExecuteReader(sql3);
               while (sqlreader.Read())
               {
                   if (Ref_no.Text == null || Ref_no.Text == "")
                   {
                       Ref_no.Text = sqlreader.GetInt32(0).ToString();
                   }
               }
               sqlreader.Close();

               _sqlhelper.Disconnect();

               Printbtn_Click();                 
            
        }



        protected void load_data_Click(String ref_no)
        {
            if (ref_no == null || ref_no== "")
            {
                label_ref.Text = "No Reference number found.";
            }

            else
            {
               
                //  SqlDataReader sqlreader = null;
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString);
                conn.Open();
                string sql2 = "Select * from AmendmentBankGuarantee where G_ref=@ref ";
                SqlCommand sqlcmd = new SqlCommand(sql2, conn);
                sqlcmd.Parameters.AddWithValue("@ref", ref_no);
                SqlDataReader sqlreader = sqlcmd.ExecuteReader();
                while (sqlreader.Read())
                {
                    Ref_no.Text =Convert.ToString(sqlreader.GetInt32(0));
                    DateOfApplication.Text = sqlreader.GetString(1);
                    Branch.Text = sqlreader.GetString(2);
                    GuaranteeNumber.Text = sqlreader.GetString(3);
                    GuaranteeAmount.Text = sqlreader.GetString(4);
                    // = sqlreader.GetString(5);

                    string indexval1 = sqlreader.GetString(5);
                    string[] index1 = indexval1.Split('/');
                    DayOfGuaranteeIssued.SelectedValue = index1[0];
                    MonthOfGuaranteeIssued.SelectedValue = index1[1];
                    YearOfGuaranteeIssued.SelectedValue = index1[2];

                   
                    Beneficiary.Text = sqlreader.GetString(6);
                    // DayValidityExtended = sqlreader.GetString(7);

                    string indexval2 = sqlreader.GetString(7);
                    string[] index2 = indexval2.Split('/');
                    DayValidityExtended.SelectedValue = index2[0];
                    MonthValidityExtended.SelectedValue = index2[1];
                    YearValidityExtended.SelectedValue = index2[2];

                    AmountIncDecBy.Text = sqlreader.GetString(8);
              //     Request.Form[TotalValueOfGuarantee.UniqueID] = sqlreader.GetString(9);
                    TotalValueOfGuarantee.ReadOnly = false;
                    TotalValueOfGuarantee.Text = sqlreader.GetString(9);
                 
                    Others.Value =HttpUtility.HtmlDecode(sqlreader.GetString(10));
                    DebitAccount.Text = sqlreader.GetString(11);
                    NameOfCompany.Text = sqlreader.GetString(12);
                    AccountNum.Text = sqlreader.GetString(13);
                    AccN.Text = AccountNum.Text;

                    if(sqlreader.GetString(15)=="I")
                    {
                        IncDec.SelectedIndex = 1;
                    }
                    else
                    {
                        IncDec.SelectedIndex = 2;
                    }
                    

                    // http://www.dotnetperls.com/sqlclient
                }

                sqlreader.Close();
                
                // sqlreader = sqlcmd.();
                sqlcmd.ExecuteNonQuery();
                conn.Close();
                Session["Ref_A"] = null;
            }


        }

        //protected void EditForm_Click(object sender, EventArgs e)
        //{
        //    Session["Ref_A"] = null;
        //    index = true;
        //    Response.Redirect("~/EnterFormNoA.aspx");
        //}

        public void SendMail(string ref_no,string mail_address)
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

            mm.Body += "<a href='http://localhost:28669/AmendmentBankGuarantee.aspx?ref=" +ref_no +"'" + ">click here</a>";

            mm.IsBodyHtml = true;
          //  Response.Write(g);
            //mm.Attachments.Add(aa);
            sc.Send(mm);
        }
        

    }
    }
