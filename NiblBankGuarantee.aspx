<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NiblBankGuarantee.aspx.cs" Inherits="BankGuarantee.NiblBankGuarantee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .col-lg-6 {
            width: 614px;
        }
    </style>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script>
     r(function () {
            var datetoday=new Date();
            var mnth = datetoday.getMonth() + 00;
            document.getElementById("DateOfApplication").value = datetoday.getDate() + "/" + mnth.toString() + "/" + datetoday.getYear();
        });
        function r(f) { /in/.test(document.readyState) ? setTimeout('r(' + f + ')', 9) : f() }
    </script>
</head>
<body>
    <form id="form1" runat="server" style="border-style: dotted; border-color: inherit; border-width: medium; margin: 75px 75px 60px 74px; font-family: 'Times New Roman'; font-size: 17px; height: 1855px; width: 1226px; ">

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
                    <asp:TextBox ID="DateOfApplication" runat="server"></asp:TextBox>
                    (dd/mm/yy)
                    <asp:RequiredFieldValidator ID="r_DOA" runat="server" ControlToValidate="DateOfApplication" ErrorMessage="*This field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
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
            <p><asp:TextBox runat="server" ID="Branch"></asp:TextBox><b>Branch</b></p>
            <p>
                <asp:RequiredFieldValidator ID="r_Branch" runat="server" ControlToValidate="Branch" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
        </asp:Panel>
        <div>
            <p style="text-align: center"><b><ins>APPLICATION FOR BANK GUARANTEE</ins></b></p>
        </div>
        <asp:Panel runat="server">
            <p style="text-align:center"><b>Please issue a Bank Guarantee on behalf of the Applicant given as per the under mentioned information’s:</b></p>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">1. Name of Applicant *</div>
                <div class="col-md-7 col-lg-7">:<asp:TextBox runat="server" Width="550px" ID="NameOfApplicant"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="r_NOA" runat="server" ControlToValidate="NameOfApplicant" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">2. Address of Applicant*</div>
                <div class="col-md-7 col-lg-7">:<asp:TextBox runat="server" Width="550px" ID="AddressOfApplicant"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="r_AOA" runat="server" ErrorMessage="*This field is required" ForeColor="Red" ControlToValidate="AddressOfApplicant"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5"></div>
                <div class="col-md-7 col-lg-7">Tel No:*<asp:TextBox runat="server" ID="TelephoneNo" placeholder="Telephone No."></asp:TextBox>
                    &nbsp; &nbsp;<asp:TextBox ID="MobileNum" runat="server" placeholder="Mobile Number"></asp:TextBox>
               &nbsp;
                    <br />
                    &nbsp;
                
                <asp:RegularExpressionValidator ID="reg_telno" runat="server" ControlToValidate="TelephoneNo" ErrorMessage="Enter Number only" ForeColor="Red"  ValidationExpression="^[0-900]+$"></asp:RegularExpressionValidator>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:RegularExpressionValidator ID="reg_mobile" runat="server" ControlToValidate="MobileNum" ErrorMessage="Enter Number only" ForeColor="Red"  ValidationExpression="^[0-900]+$"></asp:RegularExpressionValidator>
 
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5"></div>
                <div class="col-md-7 col-lg-7">E-Mail Address:<asp:TextBox runat="server" ID="EmailAddress"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="reg_email_addres" runat="server" ControlToValidate="EmailAddress" ErrorMessage="Email format not correct." ForeColor="Red"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">3. Name of Beneficiary *</div>
                <div class="col-md-7 col-lg-7">:<asp:TextBox runat="server" Width="550px" ID="NameOfBeneficiary"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="r_NoB" runat="server" ControlToValidate="NameOfBeneficiary" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px; top: 0px; left: 0px;">
                <div class="col-md-5 col-lg-5">4. Address of Beneficiary and Telephone Nos.*</div>
                <div class="col-md-7 col-lg-7">
                    :<asp:TextBox runat="server" Width="430px" ID="AddressOfBeneficiary"></asp:TextBox>
                    <asp:TextBox runat="server" Width="120px" ID="TelephoneOfBeneficiary" placeholder="Telephone No."></asp:TextBox>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TelephoneOfBeneficiary" ErrorMessage="Enter Number only" ForeColor="Red"  ValidationExpression="^[0-900]+$"></asp:RegularExpressionValidator>
 
                    <asp:RequiredFieldValidator ID="r_AoB" runat="server" ControlToValidate="AddressOfBeneficiary" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">
                    5. Nature of Guarantee Required
                </div>                <div class="col-md-7 col-lg-7">
                    <asp:RadioButtonList ID="NatureOfGuarantee" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="Bid Bond" Selected="True">Bid Bond</asp:ListItem>
                        <asp:ListItem>Performance Bond</asp:ListItem>
                        <asp:ListItem>Advance Payment</asp:ListItem>
                        <asp:ListItem>Others(Specify)</asp:ListItem>
                    </asp:RadioButtonList>

                    <asp:TextBox ID="OthersSpecify" runat="server" Width="235px"></asp:TextBox>

                    &nbsp;</div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">6. Currency and Amount of Guarantee</div>
                <div class="col-md-7 col-lg-7">
                    :<asp:TextBox runat="server" ID="CurrencyOfGuarantee"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="r_CoG" runat="server" ControlToValidate="CurrencyOfGuarantee" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="reg_currency" runat="server" ControlToValidate="CurrencyOfGuarantee" ErrorMessage="Enter Numbers only" ForeColor="Red"  ValidationExpression="^[0-900]+$"></asp:RegularExpressionValidator>
                     
                     <br />
                    In words:<asp:TextBox runat="server" Width="500px" ID="AmountOfGuarantee"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="r_AoG" runat="server" ControlToValidate="AmountOfGuarantee" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="reg_currInWord" runat="server" ControlToValidate="AmountOfGuarantee" ErrorMessage="Enter in Words only" ForeColor="Red"  ValidationExpression="^[a-zA-Z.\s]+$"></asp:RegularExpressionValidator>
 
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">7. Validity of Bond(Expiry)</div>
                <div class="col-md-7 col-lg-7">
                    :<asp:DropDownList ID="DayOfValidity" runat="server">
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
                  <asp:DropDownList ID="MonthOfValidity" runat="server">
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
                <p><i>(Specify the exact date in Julian calendar till which you want the guarantee to be valid)</i></p>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">8.Contract No. and Date</div>

                <div class="col-md-7 col-lg-7">
                    :<asp:TextBox runat="server" placeholder="Contract No." ID="ContractNo"></asp:TextBox>
                      <asp:DropDownList ID="DayOfContract" runat="server">
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
                  <asp:DropDownList ID="MonthOfContract" runat="server">
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
                <div class="col-md-5 col-lg-5">9.Details of Contract</div>
                <div class="col-md-7 col-lg-7">
                    :<textarea id="DetailsOfContract" cols="20" name="S1" rows="5" runat="server"></textarea>

                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">10. Contract Papers</div>
                <div class="col-md-7 col-lg-7">
                    <asp:RadioButtonList ID="ContractPaperEnclosed" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Enclosed</asp:ListItem>
                        <asp:ListItem Selected="True">Not Enclosed</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="col-md-12 col-lg-12" style="padding: 6px 6px 6px 6px;">
                <div class="col-md-5 col-lg-5">11. Counter Guarantee 
                </div>
                <div class="col-md-7 col-lg-7">
                    <asp:RadioButtonList ID="CounterGuarantee" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">Furnished</asp:ListItem>
                    <asp:ListItem>Will be Furnished By</asp:ListItem>
                    </asp:RadioButtonList>
                    </div>
            </div>
            <div class="col-md-5 col-lg-5">12.Please issue the Guarantee as per</div>
            <div class="col-md-7 col-lg-7">
                  <asp:RadioButtonList ID="IssueGuaranteeAsPer" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">Attached Sheet OR</asp:ListItem>
                    <asp:ListItem>Bank Format</asp:ListItem>
                </asp:RadioButtonList>
                <p><i>(Please tick appropriate one)</i></p>&nbsp;
            </div>
            <div>
                If any legal problem arises in the format we will be responsible.<br />
            </div>
        </asp:Panel>
        <div class="col-md-8 col-lg-8">
            <asp:Panel runat="server" BorderStyle="Solid" BorderWidth="1px">
                <p>1.	Please use our limit for the issuance of the above Guarantee.</p>
                <p>2.	Debit our A/C No.:
                    <asp:TextBox runat="server" ID="DebitAccountNo"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="r_DAcc" runat="server" ControlToValidate="DebitAccountNo" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;for your necessary cash margin and bank charges in connection of issuance of the captioned Guarantee:-</p>
                <p>Authorised Signature (s)  :</p>
                <p>Name of the Company:<asp:TextBox runat="server" ID="NameOfCompany"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="r_NoC" runat="server" ControlToValidate="NameOfCompany" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <p>Account No.
                    <asp:TextBox runat="server" ID="AccOfCompany"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="r_AoC" runat="server" ControlToValidate="AccOfCompany" ErrorMessage="*This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <p>Company Seal:</p>
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
                 </p>               </div>
        </div>
      
      
        <div class="col-md-12 col-lg-12">
           <p style="padding-top:15px;">  <asp:Button runat="server" Text="Submit" ID="SubmitBtn" OnClick="SubmitBtn_Click"></asp:Button>&nbsp;&nbsp;&nbsp; <asp:Button runat="server" ID="PrintBtn" OnClick="PrintBtn_Click" Text="Print"/></p>
          
        </div>
    </form>



</body>
</html>
