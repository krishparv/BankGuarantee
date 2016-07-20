<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AmendmentBankGuarantee.aspx.cs" Inherits="BankGuarantee.AmendmentBankGuarantee" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        
        function guaranteechanged()
        { 
            var x = document.getElementById("TotalValueOfGuarantee");
            var y=document.getElementById("GuaranteeAmount");
            var z=document.getElementById("AmountIncDecBy");
            if (document.getElementById("IncDec").value == "INCREASE")
            {
                z.value=z.value==""?0:z.value;
                x.value = y.value == "" ? 0.0 : parseInt(y.value) + parseInt(z.value);
                
            }
            else
            {
                z.value = z.value == "" ? 0.0 : z.value;
                x.value = y.value == "" ? 0.0 : parseInt(y.value) - parseInt(z.value);
            }
        }

        function checkLength()
        {
            var x = document.getElementById("DebitAccount").value.length;
            if(x!=14)
            {
                document.getElementById("DebitAccount").value = "";
            }
            
        }

        function checkLength1() {
            var x = document.getElementById("AccountNum").value.length;
            if (x != 14) {
                document.getElementById("AccountNum").value = "";
            }

        }

        function checkLength2() {
            var x = document.getElementById("AccN").value.length;
            if (x != 14) {
               document.getElementById("AccN").value = "";
            }

        }

        function checkforNum(e) {
            var b = String.fromCharCode(e.keyCode);
            //  alert(b);
            if (!isNaN(b)) {
                if (e.keyCode == 32) {
                 //   alert("space found");
                    return false;
                }
                else {
                    return true;
                }
            }
            else {
                return false;
            }
        }

        function checkForNormalText(e)
        {
            if(e.keyCode== 60 || e.keyCode ==62)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        function SendConfirmation()
        {
            ;
        }
    </script>
       
</head>
<body>

   <div class="col-lg-9 col-md-12 col-sm-12" style="border-style: dotted; border-color: inherit; border-width: medium; margin: 75px 77px 72px 74px; font-family: 'Times New Roman'; font-size: 17px; height: 1800px; width: 1226px;">
   <form id="form1" runat="server">
    
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
      <asp:Panel runat="server">
            <div class="row">
                <div class="col-md=8 col-lg-8">
                          <br />
                    <asp:Label ID="label_ref" runat="server" Font-Bold="True">Form No :</asp:Label>
                    &nbsp;<asp:Label ID="Ref_no" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   
                    
                     <br />
                    <br />
                    <br />
                    <br />

                    <asp:Label runat="server">Date* :</asp:Label>
                    <asp:TextBox runat="server" ID="DateOfApplication" MaxLength="10"></asp:TextBox>(dd/mm/yy)

                    <asp:RequiredFieldValidator ID="rq_datetoday" runat="server" ControlToValidate="DateOfApplication" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>

                </div>
                <div class="col-md-4 col-lg-4 col-sm-6">
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
             <p> <b>
                 <asp:DropDownList ID="Branch" runat="server" DataSourceID="SqlDataSource1" DataTextField="Sol_Des" DataValueField="Sol_Des" AppendDataBoundItems="True">
                     <asp:ListItem Selected="True" Text="--Please Select--" Value="0"></asp:ListItem>
                 </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BankGuaranteeConnectionString %>" SelectCommand="SELECT * FROM [SolDetail]"></asp:SqlDataSource>
                 Branch* <asp:RequiredFieldValidator ID="rq_branch" runat="server" ControlToValidate="Branch" ErrorMessage="this field is required" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>
                 </b></p>
               <p><b>ATTN:TRADE FINANCE DEPARTMENT</b></p>
               <br />
        </asp:Panel>
       <div>
           <p style="text-align: center"><b><ins>APPLICATION FOR AMENDMEAPPLICATION FOR AMENDMENT BANK GUARANTEE</ins></b></p>
       </div>
       <asp:Panel runat="server">
           <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">             
                   DEAR SIRS,              
           </div>
       
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
               <div class="col-md-5 col-lg-5">
                   OUR GUARANTEE NUMBER *</div>
               <div class="col-md-7 col-lg-7">
                   <asp:TextBox runat="server" Width="550px" ID="GuaranteeNumber" MaxLength="50"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rq_guaranteeN" runat="server" ControlToValidate="GuaranteeNumber" ErrorMessage="*this field is required" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                 
               </div>
           </div>
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
               <div class="col-md-5 col-lg-5">
                   GUARANTEE AMOUNT *</div>
               <div class="col-md-7 col-lg-7">
                       <asp:TextBox runat="server" Width="550px" ID="GuaranteeAmount" onfocusout="guaranteechanged()" onkeypress="return checkforNum(event);" style="text-align:right" MaxLength="20"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rq_guaranteeAmt" runat="server" ControlToValidate="GuaranteeAmount" ErrorMessage="*this field is required" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="reg_guarantee_amt" runat="server" ControlToValidate="GuaranteeAmount" ErrorMessage="*Enter Number only." ForeColor="Red"  ValidationExpression="^[0-900]+$" SetFocusOnError="True"></asp:RegularExpressionValidator>
               </div>
           </div>
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
               <div class="col-md-5 col-lg-5">
                   GUARANTEE ISSUED DATE *</div>
               <div class="col-md-7 col-lg-7">
                       <asp:DropDownList ID="DayOfGuaranteeIssued" runat="server">
                           <asp:ListItem Value="0" Selected="True">--</asp:ListItem>
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
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList>
                    Day
                  <asp:DropDownList ID="MonthOfGuaranteeIssued" runat="server">
                      <asp:ListItem Value="0" Selected="True" Text="--"></asp:ListItem>
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
                <asp:ListItem Text="--" Value="0" Selected="True"></asp:ListItem>                     
                </asp:DropDownList>
                       Year&nbsp;
                       <asp:RequiredFieldValidator ID="req_GID_day" runat="server" ControlToValidate="DayOfGuaranteeIssued" ErrorMessage="*Select Day" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>
                       &nbsp;<asp:RequiredFieldValidator ID="req_GID_month" runat="server" ControlToValidate="MonthOfGuaranteeIssued" ErrorMessage="*Select Month" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>
                       <asp:RequiredFieldValidator ID="req_GID_Year" runat="server" ControlToValidate="YearOfGuaranteeIssued" ErrorMessage="*Select Year" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>
               </div>
           </div>
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
               <div class="col-md-5 col-lg-5">
                   BENEFICIARY *</div>
               <div class="col-md-7 col-lg-7">
                       <asp:TextBox runat="server" Width="550px" ID="Beneficiary" MaxLength="80" ></asp:TextBox>
                       <asp:RequiredFieldValidator ID="req_beneficiary" runat="server" ControlToValidate="Beneficiary" ErrorMessage="*this field is required" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="reg_beneficiary" runat="server" ControlToValidate="Beneficiary" ErrorMessage="*only alphabets and space is allowed." ForeColor="Red"  ValidationExpression="^[a-zA-Z][a-zA-Z\\s]+$" SetFocusOnError="True"></asp:RegularExpressionValidator>
               </div>
           </div>
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
               <div class="col-md-5 col-lg-5">
                   VALIDITY DATE EXTENDED UPTO *</div>
               <div class="col-md-7 col-lg-7">
                       <asp:DropDownList ID="DayValidityExtended" runat="server">
                            <asp:ListItem Value="0">--</asp:ListItem>
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
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList>
                    Day
                  <asp:DropDownList ID="MonthValidityExtended" runat="server">
                      <asp:ListItem Value="0">--</asp:ListItem>
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
                     <asp:ListItem Selected="True" Text="--" Value="0"></asp:ListItem>
                  </asp:DropDownList>
                    Year
                      <asp:RequiredFieldValidator ID="req_VDE_day" runat="server" ControlToValidate="DayOfGuaranteeIssued" ErrorMessage="*Select Day" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>
                       &nbsp;<asp:RequiredFieldValidator ID="req_VDE_month" runat="server" ControlToValidate="MonthOfGuaranteeIssued" ErrorMessage="*Select Month" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>
                       <asp:RequiredFieldValidator ID="req_VDE_year" runat="server" ControlToValidate="YearOfGuaranteeIssued" ErrorMessage="*Select Year" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>

               </div>
           </div>
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
               <div class="col-md-5 col-lg-5">
                   AMOUNT&nbsp;
                   <asp:DropDownList ID="IncDec" runat="server" onchange="guaranteechanged()">
                       <asp:ListItem>PLEASE SELECT</asp:ListItem>
                       <asp:ListItem>INCREASE</asp:ListItem>
                       <asp:ListItem>DECREASE</asp:ListItem>
                   </asp:DropDownList>
                   &nbsp; BY&nbsp;*</div>
                <div class="col-md-7 col-lg-7">
                       <asp:TextBox runat="server" Width="550px" ID="AmountIncDecBy" onfocusout="guaranteechanged()"  onkeypress="return checkforNum(event);"  style="text-align:right" MaxLength="20"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="Req_IncDec" runat="server" ControlToValidate="AmountIncDecBy" ErrorMessage="*this field is required" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                 
                </div>
              
                 <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAKING THE</p>
           </div>
             <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
             <div class="col-md-5 col-lg-5">
                  TOTAL VALUE OF THE GUARANTEE*
               </div>
               <div class="col-md-7 col-lg-7">
                       <asp:TextBox runat="server" Width="550px" ID="TotalValueOfGuarantee" onfocusout="guaranteechanged()" ContentEditable="false" onkeypress="return checkforNum(event);"  style="text-align:right"></asp:TextBox>
               </div>
           </div>
          <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
              <div class="col-md-5 col-lg-5">
                  OTHERS:
              </div>             
           </div>
           <div class="col-md-12 col-lg-12">
                 <textarea class="form-control" rows="15" id="Others" runat="server" maxlength="500" onkeypress=" return checkForNormalText(event);"></textarea>
             </div>
           <div class="col-md-12 col-lg-12">
               <p>ALL OTHER TERMS AND CONDITIONS REMAIN UNCHANGED.</p>
           </div>
       </asp:Panel>
              
         <div class="col-md-8 col-lg-8">
            <asp:Panel runat="server" BorderStyle="Solid" BorderWidth="1px">
                <p>1.	Please use our limit for the increase of the above Guarantee.</p>
                <p>2. Debit our A/C No.* :
                    <asp:TextBox runat="server" ID="DebitAccount" onkeypress="return checkforNum(event);"  MaxLength="14" onfocusout="checkLength()"></asp:TextBox>
                    for your necessary cash margin and bank charges in connection of issuance of the captioned Guarantee:-</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:RequiredFieldValidator ID="reg_drAccount" runat="server" ControlToValidate="DebitAccount" ErrorMessage="*this field is required" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                   &nbsp;<asp:RegularExpressionValidator ID="reg_debit_acc" runat="server" ControlToValidate="DebitAccount" ErrorMessage="*Account Number should be 14 length long." ForeColor="Red"  ValidationExpression="^[\s\S]{14,}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
          
                </p>
                <p>Authorised Signature (s)*&nbsp; :</p>
                <p>
                    &nbsp;</p>
                <p>Name of the Company* :<asp:TextBox runat="server" ID="NameOfCompany" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rg_nameOfCompany" runat="server" ControlToValidate="NameOfCompany" ErrorMessage="*this field is required." ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                  
                    
                
                </p>
                <p>Account No.* :
                    <asp:TextBox ID="AccountNum" runat="server" onkeypress="return checkforNum(event);"  MaxLength="14" onfocusout="checkLength1()"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="req_Account" runat="server" ControlToValidate="AccountNum" ErrorMessage="*this field is required" ForeColor="#FF3300" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reg_account_num" runat="server" ControlToValidate="AccountNum" ErrorMessage="*Account Number should be 14 length long." ForeColor="Red"  ValidationExpression="^[\s\S]{14,}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </p>
                <p>
                    &nbsp;</p>
                <p>
                    Company Seal:</p>
                <p>
                    &nbsp;</p>
            </asp:Panel>
        </div>
        <div class="col-md-4 col-lg-4">
            <div class="col-md-12 col-lg-12">
                 <br />
                    <br />
                    <br />
                                    
                    
                <hr />
                <p style="text-align: center"><b>Authorised Signature (s)               <p style="text-align: center"><b>(ON BEHALF OF THE APPLICANT)</b></p>
                 <p style="text-align: center">&nbsp;</p>
                <p style="text-align: center">
                    <b>A/C No. : </b>
                    <asp:TextBox runat="server" ID="AccN"  onkeypress="return checkforNum(event);" MaxLength="14" onfocusout="checkLength2()"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reg_Acc" runat="server" ControlToValidate="AccN" ErrorMessage="*this field is required" ForeColor="#FF3300" SetFocusOnError="True">
                    </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="reg_accN" runat="server" ControlToValidate="AccN" ErrorMessage="*Account Number should be 14 length long." ForeColor="Red"  ValidationExpression="^[\s\S]{14,}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
          
                 </p>
            </div>
        </div>
        <div class="col-md-12 col-lg-12">
                             
            <asp:Panel ID="EmailPanel" runat="server" Width="319px">
                <asp:Label runat="server">*Please provide Email id:</asp:Label>
                <asp:TextBox ID="EmailBox" runat="server"></asp:TextBox>
                &nbsp;</asp:Panel>
            
                &nbsp; <asp:Button runat="server" Text="Submit" ID="SubmitBtn" OnClick="SubmitBtn_Click" /> &nbsp;&nbsp;&nbsp; <asp:Button runat="server" Text="Print" ID="Printbtn" /> 
                      
        </div>
           
     
    </form>
       </div> 
     
</body>
</html>
