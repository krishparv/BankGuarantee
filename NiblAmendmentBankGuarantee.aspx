<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NiblAmendmentBankGuarantee.aspx.cs" Inherits="BankGuarantee.NiblAmendmentBankGuarantee" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script>
        r(function () {
            var datetoday=new Date();
            //   $("#DateToday").val = 11;
            var mnth=datetoday.getMonth() + 00;
            document.getElementById("DateToday").value = datetoday.getDate() + "/" + mnth.toString() + "/" + datetoday.getYear();
        });
        function r(f) { /in/.test(document.readyState) ? setTimeout('r(' + f + ')', 9) : f() }

    </script>
</head>
<body>
   <form id="form1" runat="server" style="margin: 75px 77px 72px 74px; font-family: 'Times New Roman'; font-size: 17px; height: 1510px; width: 1226px; border: dotted">

      <asp:Panel runat="server">
            <div class="row">
                <div class="col-md=8 col-lg-8">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />

                    <asp:Label runat="server">Date:</asp:Label>
                    <asp:TextBox runat="server" ID="DateToday"></asp:TextBox>(dd/mm/yy)

                    <asp:RequiredFieldValidator ID="rq_datetoday" runat="server" ControlToValidate="DateToday" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>

                </div>
                <div class="col-md-4 col-lg-4">
                    <asp:Panel runat="server" BorderStyle="Solid" BorderWidth="1px">
                        <asp:Label runat="server">
               <p><ins><b>For bank use only:</b></ins></p>
                        </asp:Label>
                        <p>
                            <asp:Label runat="server">Customer ID:</asp:Label>
                            &nbsp;..............................
                        </p>
                        <p>
                            <asp:Label runat="server">Cash Margin:</asp:Label>
                            ..............................
                        </p>
                        <p>
                            <asp:Label runat="server">Commission:</asp:Label>
                            ...............................
                        </p>
                        <p>
                            <asp:Label runat="server">Guarante No.:</asp:Label>
                            ................................
                        </p>
                        <p>
                            <asp:Label runat="server">R.M.:</asp:Label>
                            ................................
                        </p>


                    </asp:Panel>
                    </div>
               </div>
           </asp:Panel>
           <asp:Panel runat="server">
             <p> <asp:TextBox runat="server" ID="Branch"></asp:TextBox><b>Branch<asp:RequiredFieldValidator ID="rq_branch" runat="server" ControlToValidate="Branch" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                 </b></p>
               <p><b>ATTN:TRADE FINANCE DEPARTMENT</b></p>
               <br />
        </asp:Panel>
       <div>
           <p style="text-align: center"><b><ins>APPLICATION FOR AMENDMENT BANK GUARANTEE</ins></b></p>
       </div>
       <asp:Panel runat="server">
           <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">             
                   DEAR SIRS,              
           </div>
       
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
               <div class="col-md-5 col-lg-5">
                   OUR GUARANTEE NUMBER
               </div>
               <div class="col-md-7 col-lg-7">
                   <asp:TextBox runat="server" Width="550px" ID="GuaranteeNumber"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rq_guaranteeN" runat="server" ControlToValidate="GuaranteeAmount" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
               </div>
           </div>
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
               <div class="col-md-5 col-lg-5">
                   GUARANTEE AMOUNT 
               </div>
               <div class="col-md-7 col-lg-7">
                       <asp:TextBox runat="server" Width="550px" ID="GuaranteeAmount"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rq_guaranteeAmt" runat="server" ControlToValidate="GuaranteeAmount" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
               </div>
           </div>
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
               <div class="col-md-5 col-lg-5">
                   GUARANTEE ISSUED DATE
               </div>
               <div class="col-md-7 col-lg-7">
                       <asp:DropDownList ID="DayOfGuaranteeIssued" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                    Day
                  <asp:DropDownList ID="MonthOfGuaranteeIssued" runat="server">
                      <asp:ListItem>Jan</asp:ListItem>
                      <asp:ListItem>Feb</asp:ListItem>
                      <asp:ListItem>Mar</asp:ListItem>
                      <asp:ListItem>Apr</asp:ListItem>
                      <asp:ListItem>May</asp:ListItem>
                      <asp:ListItem>Jun</asp:ListItem>
                      <asp:ListItem>Jul</asp:ListItem>
                      <asp:ListItem>Aug</asp:ListItem>
                      <asp:ListItem>Sep</asp:ListItem>
                      <asp:ListItem>Oct</asp:ListItem>
                      <asp:ListItem>Nov</asp:ListItem>
                      <asp:ListItem>Dec</asp:ListItem>
                  </asp:DropDownList>
                    &nbsp;Month
                  <asp:DropDownList ID="YearOfGuaranteeIssued" runat="server">
                      <asp:ListItem Value="1991"></asp:ListItem>
                      <asp:ListItem Value="1992"></asp:ListItem>
                      <asp:ListItem Value="1993"></asp:ListItem>
                      <asp:ListItem>1994</asp:ListItem>
                      <asp:ListItem>1995</asp:ListItem>
                      <asp:ListItem>1996</asp:ListItem>
                      <asp:ListItem>1997</asp:ListItem>
                      <asp:ListItem>1998</asp:ListItem>
                      <asp:ListItem>1999</asp:ListItem>
                      <asp:ListItem>2000</asp:ListItem>
                      <asp:ListItem>2001</asp:ListItem>
                      <asp:ListItem>2002</asp:ListItem>
                      <asp:ListItem>2003</asp:ListItem>
                      <asp:ListItem>2005</asp:ListItem>
                      <asp:ListItem>2006</asp:ListItem>
                  </asp:DropDownList>
                    Year
               </div>
           </div>
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
               <div class="col-md-5 col-lg-5">
                   BENEFICIARY
               </div>
               <div class="col-md-7 col-lg-7">
                       <asp:TextBox runat="server" Width="550px" ID="Beneficiary"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="req_beneficiary" runat="server" ControlToValidate="Beneficiary" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
               </div>
           </div>
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
               <div class="col-md-5 col-lg-5">
                   VALIDITY DATE EXTENDED UPTO
               </div>
               <div class="col-md-7 col-lg-7">
                       <asp:DropDownList ID="DayValidityExtended" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                    Day
                  <asp:DropDownList ID="MonthValidityExtended" runat="server">
                      <asp:ListItem>Jan</asp:ListItem>
                      <asp:ListItem>Feb</asp:ListItem>
                      <asp:ListItem>Mar</asp:ListItem>
                      <asp:ListItem>Apr</asp:ListItem>
                      <asp:ListItem>May</asp:ListItem>
                      <asp:ListItem>Jun</asp:ListItem>
                      <asp:ListItem>Jul</asp:ListItem>
                      <asp:ListItem>Aug</asp:ListItem>
                      <asp:ListItem>Sep</asp:ListItem>
                      <asp:ListItem>Oct</asp:ListItem>
                      <asp:ListItem>Nov</asp:ListItem>
                      <asp:ListItem>Dec</asp:ListItem>
                  </asp:DropDownList>
                    &nbsp;Month
                  <asp:DropDownList ID="YearValidityExtended" runat="server">
                      <asp:ListItem Value="1991"></asp:ListItem>
                      <asp:ListItem Value="1992"></asp:ListItem>
                      <asp:ListItem Value="1993"></asp:ListItem>
                      <asp:ListItem>1994</asp:ListItem>
                      <asp:ListItem>1995</asp:ListItem>
                      <asp:ListItem>1996</asp:ListItem>
                      <asp:ListItem>1997</asp:ListItem>
                      <asp:ListItem>1998</asp:ListItem>
                      <asp:ListItem>1999</asp:ListItem>
                      <asp:ListItem>2000</asp:ListItem>
                      <asp:ListItem>2001</asp:ListItem>
                      <asp:ListItem>2002</asp:ListItem>
                      <asp:ListItem>2003</asp:ListItem>
                      <asp:ListItem>2005</asp:ListItem>
                      <asp:ListItem>2006</asp:ListItem>
                  </asp:DropDownList>
                    Year
               </div>
           </div>
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
               <div class="col-md-5 col-lg-5">
                   AMOUNT INCREASE / DECREASE BY 
               </div>
               <div class="col-md-7 col-lg-7">
                       <asp:TextBox runat="server" Width="550px" ID="AmountIncDecBy"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="req_amountIncDec" runat="server" ControlToValidate="AmountIncDecBy" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
               </div>
                 <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAKING THE</p>
           </div>
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
             <div class="col-md-5 col-lg-5">
                  TOTAL VALUE OF THE GUARANTEE
               </div>
               <div class="col-md-7 col-lg-7">
                       <asp:TextBox runat="server" Width="550px" ID="TotalValueOfGuarantee"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="reg_totalVal" runat="server" ControlToValidate="TotalValueOfGuarantee" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
               </div>
           </div>
          <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
              <div class="col-md-5 col-lg-5">
                  OTHERS:
              </div>             
           </div>
           <div class="col-md-12 col-lg-12">
                 <textarea class="form-control" rows="15" id="Others" runat="server"></textarea>
             </div>
           <div class="col-md-12 col-lg-12">
               <p>ALL OTHER TERMS AND CONDITIONS REMAIN UNCHANGED.</p>
           </div>
       </asp:Panel>
              
         <div class="col-md-8 col-lg-8">
            <asp:Panel runat="server" BorderStyle="Solid" BorderWidth="1px">
                <p>1.	Please use our limit for the increase of the above Guarantee.</p>
                <p>2.	Debit our A/C No.:
                    <asp:TextBox runat="server" ID="DebitAccount"></asp:TextBox>
                    for your necessary cash margin and bank charges in connection of issuance of the captioned Guarantee:-</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:RequiredFieldValidator ID="reg_drAccount" runat="server" ControlToValidate="DebitAccount" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </p>
                <p>Authorised Signature (s) :</p>
                <p>Name of the Company:<asp:TextBox runat="server" ID="NameOfCompany"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rg_nameOfCompany" runat="server" ControlToValidate="NameOfCompany" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </p>
                <p>Account No.
                    <asp:TextBox ID="AccountNum" runat="server"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="req_Account" runat="server" ControlToValidate="AccountNum" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </p>
                <p>
                    Company Seal:</p>
            </asp:Panel>
        </div>
        <div class="col-md-4 col-lg-4">
            <div class="col-md-12 col-lg-12">
                 <br />
                    <br />
                    <br />
                                    
                    
                <hr />
                <p style="text-align: center"><b>Authorised Signature (s)
                    <p style="text-align:center"><b>SEAL</b></p>
                <p></p>
                <p style="text-align: center"><b>(ON BEHALF OF THE APPLICANT)</b></p>
                <p style="text-align: center"><b>A/C No.</b><asp:TextBox runat="server" ID="AccN"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reg_Acc" runat="server" ControlToValidate="AccN" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                 </p>
            </div>
        </div>
        <div class="col-md-12 col-lg-12">
           <p style="padding-top:15px;"> <asp:Button runat="server" Text="Submit" ID="SubmitBtn" OnClick="SubmitBtn_Click" /> &nbsp;&nbsp;&nbsp; <asp:Button runat="server" Text="Print" ID="Printbtn" OnClick="Printbtn_Click" /></p> 

          
        </div>
           
       
    </form>
</body>
</html>
