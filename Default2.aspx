<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>

<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="Stylesheet" type="text/css"/>    
</head>
<body>
    <form id="form1" runat="server">
    <customControls:Header runat="server" />
    <asp:Menu ID="menuBar" 
            runat="server" Orientation="Horizontal" 
Width="100%" 
CssClass="MenuBar" MaximumDynamicDisplayLevels="10">
                <StaticMenuStyle CssClass="StaticMenuItem" />
                <StaticMenuItemStyle CssClass="StaticMenuItemStyle" />
                <StaticHoverStyle CssClass="StaticHoverStyle" />  
                <StaticSelectedStyle CssClass="StaticSelectedStyle" />              
                <DynamicMenuItemStyle CssClass="DynamicMenuItemStyle" />
                <DynamicHoverStyle CssClass="DynamicHoverStyle" />
            </asp:Menu>
    <div>
    
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
            AutoDataBind="True" DisplayGroupTree="False" Height="801px" 
            ReportSourceID="CrystalReportSource1" Width="1286px" 
            EnableDrillDown="False" EnableParameterPrompt="False" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="CrystalReportTest.rpt">
            </Report>
        </CR:CrystalReportSource>
    
    </div>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
        <asp:ListItem Value="0">Electric</asp:ListItem>
        <asp:ListItem Value="1">Gas</asp:ListItem>
        <asp:ListItem Value="2">Electric + Gas</asp:ListItem>
    </asp:DropDownList>
    </form>
</body>
</html>
