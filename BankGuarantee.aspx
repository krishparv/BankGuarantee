<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BankGuarantee.aspx.cs" Inherits="BankGuarantee.BankGuarantee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">

        function checkLength() {
            var x = document.getElementById("AccOfCompany").value.length;
            if (x != 14) {
                alert("Account Number length should be equal to 14");
                document.getElementById("AccOfCompany").value = "";
            }

        }

        function checkLength1() {
            var x = document.getElementById("DebitAccountNo").value.length;
            if (x != 14) {
                alert("Account Number length should be equal to 14");
                document.getElementById("DebitAccountNo").value = "";
            }

        }

        function checkLength2() {
            var x = document.getElementById("AccN").value.length;
            if (x != 14) {
                alert("Account Number length should be equal to 14");
                document.getElementById("AccN").value = "";
            }

        }

        function checkvalidation(e) {
         //   alert("checkpoint entered.");
            if (window.event)
                code = e.keyCode;
            else
                code = e.which;
            if (code == 32 || (code >= 97 && code <= 122) || (code >= 65 && code <= 90))
                return true;
            else
                return false;
        }

        function checkforNum1(e) {
           // alert("key press"); 
            var code = e.which ? e.which : e.keyCode;
            if ((code >= 48 && code <= 57) || specialKeys.indexOf(code) != -1)
            {
                return true;
            }
            else
            {
                return false;
            }
     
        }


        function checkforNum2(e) {
            //   alert("checkpoint entered.");
            if (window.event)
                code = e.keyCode;
            else
                code = e.which;
            if (code == 32 || (code >= 97 && code <= 122) || (code >= 65 && code <= 90) || specialKeys.indexOf(code) == -1)
                return false;
            else
                return true;
        }

        function checkforNum(e) {
            var b = String.fromCharCode(e.keyCode);
          //  alert(b);
            if (!isNaN(b))
            {
                if (e.keyCode == 32) {
                    alert("space found");
                    return false;
                }
                else {
                    return true;
                }
            }
            else
            {
                return false;
            }
        }

        function checkForNormalText(e) {
            if (e.keyCode == 60 || e.keyCode == 62) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>

   
</head>
<body>
   <div class="col-lg-12 col-md-9 col-sm-9">

    <form id="form1" runat="server" style="border-style:dotted; border-color: inherit; border-width: medium; margin: 75px 77px 74px 74px; font-family: 'Times New Roman'; font-size: 17px; height: 1880px; width: 1226px; ">
    
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
            <p><b>To:</b></p>
            <p><b>Nepal Investment Bank Limited</b></p>
            <p><b>
                <asp:DropDownList ID="Branch" runat="server" DataSourceID="SqlDataSource1" DataTextField="Sol_Des" DataValueField="Sol_Des" AppendDataBoundItems="true">
                   <asp:ListItem Text="--Please Select--" Value="0" Selected="True"></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BankGuaranteeConnectionString2 %>" SelectCommand="SELECT * FROM [SolDetail]"></asp:SqlDataSource>
                Branch</b></p>
            <p>
                <asp:RequiredFieldValidator ID="r_Branch" runat="server" ControlToValidate="Branch" ErrorMessage="*This field is required" ForeColor="Red" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
            </p>
        </asp:Panel>
        <div>
            <p style="text-align: center"><b><ins>APPLICATION FOR BANK GUARANTEE</ins></b></p>
        </div>
        <asp:Panel runat="server">
            <p style="text-align:center"><b>Please issue a Bank Guarantee on behalf of the Applicant given as per the under mentioned information’s:</b></p>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">1. Name of Applicant *</div>
                <div class="col-md-7 col-lg-7">:<asp:TextBox runat="server" Width="550px" ID="NameOfApplicant" type="text" onkeypress="return checkvalidation(event);" MaxLength="50" style="text-transform:uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="r_NOA" runat="server" ControlToValidate="NameOfApplicant" ErrorMessage="*This field is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    &nbsp;          </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">2. Address of Applicant*</div>
                <div class="col-md-7 col-lg-7">:<asp:TextBox runat="server" Width="550px" ID="AddressOfApplicant" MaxLength="50" style="text-transform:uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="r_AOA" runat="server" ErrorMessage="*This field is required" ForeColor="Red" ControlToValidate="AddressOfApplicant" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5"></div>
                <div class="col-md-7 col-lg-7">Tel No:*<asp:TextBox runat="server" ID="TelephoneNo" placeholder="Telephone No." style="text-align:right" onkeypress="return checkforNum(event);" MaxLength="9"></asp:TextBox>
                    &nbsp; &nbsp;<asp:TextBox ID="MobileNum" runat="server" placeholder="Mobile Number" style="text-align:right" onkeypress="return checkforNum(event);" MaxLength="10"></asp:TextBox>
               &nbsp;
                    <br />
                    &nbsp;
                
                <asp:RegularExpressionValidator ID="reg_telno" runat="server" ControlToValidate="TelephoneNo" ErrorMessage="Enter Number only" ForeColor="Red"  ValidationExpression="^[0-900]+$" SetFocusOnError="True"></asp:RegularExpressionValidator>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:RegularExpressionValidator ID="reg_mobile" runat="server" ControlToValidate="MobileNum" ErrorMessage="Enter Number only" ForeColor="Red"  ValidationExpression="^[0-900]+$" SetFocusOnError="True"></asp:RegularExpressionValidator>
 
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5"></div>
                <div class="col-md-7 col-lg-7">E-Mail Address:<asp:TextBox runat="server" ID="EmailAddress" MaxLength="50"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="reg_email_addres" runat="server" ControlToValidate="EmailAddress" ErrorMessage="Email format not correct." ForeColor="Red"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">3. Name of Beneficiary *</div>
                <div class="col-md-7 col-lg-7">:<asp:TextBox runat="server" Width="550px" ID="NameOfBeneficiary" onkeypress="return checkvalidation(event);" MaxLength="50" style="text-transform:uppercase"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="r_NoB" runat="server" ControlToValidate="NameOfBeneficiary" ErrorMessage="*This field is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px; top: 0px; left: 0px;">
                <div class="col-md-5 col-lg-5">4. Address of Beneficiary and Telephone Nos.*</div>
                <div class="col-md-7 col-lg-7">
                    :<asp:TextBox runat="server" Width="430px" ID="AddressOfBeneficiary" MaxLength="50" style="text-transform:uppercase"></asp:TextBox>
                    <asp:TextBox runat="server" Width="120px" ID="TelephoneOfBeneficiary" placeholder="Telephone No." style="text-align:right" onkeypress="return checkforNum(event);" MaxLength="9"></asp:TextBox>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TelephoneOfBeneficiary" ErrorMessage="Enter Number only" ForeColor="Red"  ValidationExpression="^[0-900]+$" SetFocusOnError="True"></asp:RegularExpressionValidator>
 
                    <asp:RequiredFieldValidator ID="r_AoB" runat="server" ControlToValidate="AddressOfBeneficiary" ErrorMessage="*This field is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">
                    5. Nature of Guarantee Required
                </div>                <div class="col-md-7 col-lg-7">
                    <asp:RadioButtonList ID="NatureOfGuarantee" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="NatureOfGuarantee_SelectedIndexChanged">
                        <asp:ListItem Value="Bid Bond">Bid Bond</asp:ListItem>
                        <asp:ListItem>Performance Bond</asp:ListItem>
                        <asp:ListItem>Advance Payment</asp:ListItem>
                        <asp:ListItem>Others(Specify)</asp:ListItem>
                    </asp:RadioButtonList>

                    <asp:TextBox ID="OthersSpecify" runat="server" Width="235px" MaxLength="50"></asp:TextBox>

                    &nbsp;<br />
                    <asp:RequiredFieldValidator ID="reg_NatureOfGuarantee" runat="server" ControlToValidate="NatureOfGuarantee" ErrorMessage="*this field is required." ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">6. Currency and Amount of Guarantee</div>
                <div class="col-md-7 col-lg-7">                   
                    :<asp:TextBox runat="server" ID="CurrencyOfGuarantee" OnTextChanged="CurrencyOfGuarantee_TextChanged" style="text-align:right" onkeypress="return checkforNum(event);" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="r_CoG" runat="server" ControlToValidate="CurrencyOfGuarantee" ErrorMessage="*This field is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="reg_currency" runat="server" ControlToValidate="CurrencyOfGuarantee" ErrorMessage="Enter Numbers only" ForeColor="Red"  ValidationExpression="^[0-900]+$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                    
                     <br />
                    In words:<asp:TextBox runat="server" Width="500px" ID="AmountOfGuarantee" ReadOnly="True" MaxLength="100" style="text-transform:uppercase"></asp:TextBox>
 
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">7. Validity of Bond(Expiry)</div>
                <div class="col-md-7 col-lg-7">
                    :<asp:DropDownList ID="DayOfValidity" runat="server">
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
                  <asp:DropDownList ID="MonthOfValidity" runat="server">
                      <asp:ListItem Value="0" Selected="True" Text="--">--</asp:ListItem>
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
                  <asp:DropDownList ID="YearOfValidity" runat="server"> 
                      <asp:ListItem Selected="True" Value="0" Text="--"></asp:ListItem>                     
                  </asp:DropDownList>
                    Year&nbsp;
                    <asp:RequiredFieldValidator ID="req_VOBDay" runat="server" ControlToValidate="DayOfValidity" ErrorMessage="*Enter Day" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RequiredFieldValidator ID="req_VOBYear" runat="server" ControlToValidate="MonthOfValidity" ErrorMessage="*Enter Month" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="req_VOBMonth" runat="server" ControlToValidate="YearOfValidity" ErrorMessage="*Enter Year" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>
                    &nbsp;<p><i>(Specify the exact date in Julian calendar till which you want the guarantee to be valid)</i></p>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">8.Contract No. and Date</div>

                <div class="col-md-7 col-lg-7">
                    :<asp:TextBox runat="server" placeholder="Contract No." ID="ContractNo"  MaxLength="20"></asp:TextBox>
                      <asp:DropDownList ID="DayOfContract" runat="server">
                          <asp:ListItem Value="0" Selected="True" Text="--">--</asp:ListItem>
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
                  <asp:DropDownList ID="MonthOfContract" runat="server">
                      <asp:ListItem Value="0" Selected="True" Text="--">--</asp:ListItem>
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
                  <asp:DropDownList ID="YearOfContract" runat="server">
                   <asp:ListItem Selected="True" Text="--" Value="0" ></asp:ListItem>
                  </asp:DropDownList>
                    Year
                    <asp:RequiredFieldValidator ID="req_ContractDate" runat="server" ControlToValidate="DayOfContract" ErrorMessage="*Enter Day" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RequiredFieldValidator ID="req_ContractMonth" runat="server" ControlToValidate="MonthOfContract" ErrorMessage="*Enter Month" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="req_ContractMonth0" runat="server" ControlToValidate="YearOfContract" ErrorMessage="*Enter Year" ForeColor="#FF3300" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">9.Details of Contract</div>
                <div class="col-md-7 col-lg-7">
                    :<textarea id="DetailsOfContract" name="S1" rows="5" runat="server" style="text-transform: capitalize; text-transform:uppercase; width: 459px;" maxlength="200" onkeypress=" return checkForNormalText(event);" ></textarea>

                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">10. Contract Papers</div>
                <div class="col-md-7 col-lg-7">
                    <asp:RadioButtonList ID="ContractPaperEnclosed" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Enclosed</asp:ListItem>
                        <asp:ListItem >Not Enclosed</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="req_ContractPaper" runat="server" ControlToValidate="ContractPaperEnclosed" ErrorMessage="*this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">11. Counter Guarantee 
                </div>
                <div class="col-md-7 col-lg-7">
                    <asp:RadioButtonList ID="CounterGuarantee" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem >Furnished</asp:ListItem>
                    <asp:ListItem>Will be Furnished By</asp:ListItem>
                    </asp:RadioButtonList>
                    &nbsp;<asp:RequiredFieldValidator ID="req_CounterGuarantee" runat="server" ControlToValidate="CounterGuarantee" ErrorMessage="*this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </div>
            </div>
            <div class="col-md-5 col-lg-5">12.Please issue the Guarantee as per</div>
            <div class="col-md-7 col-lg-7">
                  <asp:RadioButtonList ID="IssueGuaranteeAsPer" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Attached Sheet OR</asp:ListItem>
                    <asp:ListItem>Bank Format</asp:ListItem>
                </asp:RadioButtonList>
                <p><i>(Please tick appropriate one)</i></p>&nbsp;
                  <asp:RequiredFieldValidator ID="req_IssueGuarantee" runat="server" ControlToValidate="IssueGuaranteeAsPer" ErrorMessage="*this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </div>
            <div>
                If any legal problem arises in the format we will be responsible.<br />
            </div>
        </asp:Panel>
        <div class="col-md-8 col-lg-8">
            <asp:Panel runat="server" BorderStyle="Solid" BorderWidth="1px">
                <p>1.	Please use our limit for the issuance of the above Guarantee.</p>
                <p>2.	Debit our A/C No.:
                    <asp:TextBox runat="server" ID="DebitAccountNo" MaxLength="14" style="text-align:left" onkeypress="return checkforNum(event);"></asp:TextBox>
                      &nbsp;for your necessary cash margin and bank charges in connection of issuance of the captioned Guarantee:-</p>
                 <asp:RegularExpressionValidator ID="reg_debitAcc" runat="server" ControlToValidate="DebitAccountNo" ErrorMessage="*Account Number should be 14 length long." ForeColor="Red"  ValidationExpression="^[\s\S]{14,14}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="r_DAcc" runat="server" ControlToValidate="DebitAccountNo" ErrorMessage="*This field is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                   
                <p>Authorised Signature (s)  :</p>
                <p>
                    &nbsp;</p>
                <p>Name of the Company:<asp:TextBox runat="server" ID="NameOfCompany" MaxLength="50" style="text-transform:uppercase"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="r_NoC" runat="server" ControlToValidate="NameOfCompany" ErrorMessage="*This field is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </p>
                <p>Account No.
                    <asp:TextBox runat="server" ID="AccOfCompany" MaxLength="14" style="text-align:left" onkeypress="return checkforNum(event);"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="r_AoC" runat="server" ControlToValidate="AccOfCompany" ErrorMessage="*This field is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="reg_acct" runat="server" ControlToValidate="AccOfCompany" ErrorMessage="*Account Number should be 14 length long." ForeColor="Red"  ValidationExpression="^[\s\S]{14,14}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                
                </p>
                <p>
                    &nbsp;</p>
                <p>Company Seal:</p>
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
                <p style="text-align: center"><b>Authorised Signature (s))b><b>SEAL</b></p>
                <p></p>
                <p style="text-align: center"><b>(ON BEHALF OF THE APPLICANT)</b></p>
                 <p style="text-align: center">&nbsp;</p>
                 <p style="text-align: center"><b>A/C No.</b><asp:TextBox runat="server" ID="AccN" MaxLength="14" style="text-align:left" onkeypress="return checkforNum(event);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reg_Acc" runat="server" ControlToValidate="AccN" ErrorMessage="this field is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                  &nbsp;<asp:RegularExpressionValidator ID="reg_accN" runat="server" ControlToValidate="AccN" ErrorMessage="*Account Number should be 14 length long." ForeColor="Red"  ValidationExpression="^[\s\S]{14,14}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
               
                 </p>               </div>
        </div>
          <div class="col-md-12 col-lg-12">
      <asp:Panel ID="EmailPanel" runat="server" Width="319px">
                <asp:Label runat="server">*Please provide Email id:</asp:Label>
                <asp:TextBox ID="EmailBox" runat="server"></asp:TextBox>
                &nbsp;</asp:Panel>
      
      
           <p style="padding-top:15px;">  <asp:Button runat="server" Text="Submit" ID="SubmitBtn" OnClick="SubmitBtn_Click"></asp:Button>&nbsp;&nbsp;&nbsp; <asp:Button runat="server" ID="PrintBtn" Text="Print"/></p>
          
        </div>
               
    </form>


    </div>

</body>
</html>
