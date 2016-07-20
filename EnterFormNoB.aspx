<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterFormNoB.aspx.cs" Inherits="BankGuarantee.EnterFormNoB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <asp:Panel runat="server">
            <div style="">
            <asp:Label runat="server">Please Enter Form No.</asp:Label>
            <asp:TextBox runat="server" ID="formNo"></asp:TextBox>
            <asp:Button runat="server" Text="Go" ID="LoadForm" OnClick="LoadForm_Click"/>
                </div>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
