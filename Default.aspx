<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Altisource</title>
    <link href="StyleSheet.css" rel="Stylesheet" type="text/css"/>    
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="MainScriptManager" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <customControls:Header ID="Header1" runat="server" />
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
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
            
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
                    EmptyDataText="There are no data records to display." ForeColor="#333333" 
                    GridLines="None" Width="100%">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="PropertyCode" HeaderText="PropertyCode" 
                            SortExpression="PropertyCode" />
                        <asp:BoundField DataField="Utility" HeaderText="Utility" 
                            SortExpression="Utility" />
                        <asp:BoundField DataField="USP" HeaderText="USP" SortExpression="USP" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AdventureWorksConnectionString1 %>" 
                    ProviderName="<%$ ConnectionStrings:AdventureWorksConnectionString1.ProviderName %>" 
                    
                    SelectCommand="SELECT [USP], [PropertyCode], [Utility] FROM [Tbl_test_Raw2]" 
                    InsertCommand="INSERT INTO Tbl_test_Raw2(USP, PropertyCode, Utility) VALUES (@USP, @PropertyCode, @Utility)" 
                    UpdateCommand="UPDATE Tbl_test_Raw2 SET USP = @USP, PropertyCode = @PropertyCode, Utility = @Utility">
                    <UpdateParameters>
                        <asp:Parameter Name="USP" />
                        <asp:Parameter Name="PropertyCode" />
                        <asp:Parameter Name="Utility" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="USP" />
                        <asp:Parameter Name="PropertyCode" />
                        <asp:Parameter Name="Utility" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:DetailsView ID="DetailsView1" runat="server" 
                    AutoGenerateInsertButton="True" AutoGenerateRows="False" CellPadding="4" 
                    DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" 
                    GridLines="None" Height="50px" Width="274px">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <Fields>
                        <asp:TemplateField HeaderText="Property Code">
                            <EditItemTemplate>
                                <asp:TextBox ID="PropertyCode" runat="server"
                                    Text="<%# Bind('PropertyCode') %>" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="PropertyCode" Display="None" ErrorMessage="Property Code is required"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Utility">
                            <EditItemTemplate>
                                 <asp:TextBox ID="Utility" runat="server"
                                      Text="<%# Bind('Utility') %>" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                     ControlToValidate="Utility" Display="None" ErrorMessage="Utility is required"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="USP">
                            <EditItemTemplate>
                                <asp:TextBox ID="USP" runat="server"
                                    Text="<%# Bind('USP') %>" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="USP" Display="None" ErrorMessage="USP is required"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        
                    </Fields>
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:DetailsView>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                <br />
            
            </asp:View>
            
            <asp:View ID="View2" runat="server">
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Utility"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                                <asp:ListItem>Electric</asp:ListItem>
                                <asp:ListItem>Gas</asp:ListItem>
                                <asp:ListItem>Electric and Gas</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:MultiView ID="MultiView3" runat="server">
                    
                <asp:View ID="View8" runat="server">
                
                    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
                        AutoDataBind="True" DisplayGroupTree="False" Height="801px" 
                        ReportSourceID="CrystalReportSource1" Width="1103px" />
                    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                        <Report FileName="CrystalReportTest.rpt">
                        </Report>
                    </CR:CrystalReportSource>
                
                </asp:View>
                
                <asp:View ID="View9" runat="server">
                
                    <CR:CrystalReportViewer ID="CrystalReportViewer2" runat="server" 
                        AutoDataBind="True" DisplayGroupTree="False" 
                        ReportSourceID="CrystalReportSource2" Height="801px" Width="1103px" />
                
                    <CR:CrystalReportSource ID="CrystalReportSource2" runat="server">
                        <Report FileName="CrystalReportTest2.rpt">
                        </Report>
                    </CR:CrystalReportSource>
                
                </asp:View>
                
                <asp:View ID="View10" runat="server">
                
                    <CR:CrystalReportViewer ID="CrystalReportViewer3" runat="server" 
                        AutoDataBind="True" DisplayGroupTree="False" Height="801px" 
                        ReportSourceID="CrystalReportSource3" Width="1103px" />
                    <CR:CrystalReportSource ID="CrystalReportSource3" runat="server">
                        <Report FileName="CrystalReportTest3.rpt">
                        </Report>
                    </CR:CrystalReportSource>
                
                </asp:View>

                </asp:MultiView>

            </asp:View>        

            <asp:View ID="View3" runat="server">
            </asp:View>        

            <asp:View ID="View4" runat="server">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal" Width="167px">
                    <asp:ListItem Selected="True" Value="0">Users</asp:ListItem>
                    <asp:ListItem Value="1">Access</asp:ListItem>
                    <asp:ListItem Value="2">Menu</asp:ListItem>
                </asp:RadioButtonList>
                <asp:MultiView ID="MultiView2" runat="server">
                    <asp:View ID="View5" runat="server">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataKeyNames="userid" DataSourceID="SqlDataSource2" 
                            EmptyDataText="There are no data records to display." ForeColor="#333333" 
                            GridLines="None" Width="181px">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="userid" HeaderText="User ID" ReadOnly="True" 
                                    SortExpression="userid" />
                                <asp:BoundField DataField="password" HeaderText="Password" 
                                    SortExpression="password" />
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:AdventureWorksConnectionString1 %>" 
                            DeleteCommand="DELETE FROM [Tbl_test_users] WHERE [userid] = @userid" 
                            InsertCommand="INSERT INTO [Tbl_test_users] ([userid], [password]) VALUES (@userid, @password)" 
                            ProviderName="<%$ ConnectionStrings:AdventureWorksConnectionString1.ProviderName %>" 
                            SelectCommand="SELECT [userid], [password] FROM [Tbl_test_users]" 
                            UpdateCommand="UPDATE [Tbl_test_users] SET [password] = @password WHERE [userid] = @userid">
                            <DeleteParameters>
                                <asp:Parameter Name="userid" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="userid" Type="String" />
                                <asp:Parameter Name="password" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="password" Type="String" />
                                <asp:Parameter Name="userid" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
                            CellPadding="4" DataKeyNames="userid" DataSourceID="SqlDataSource2" 
                            DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
                            Width="182px">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <Fields>
                                <asp:BoundField DataField="userid" HeaderText="User ID" ReadOnly="True" 
                                    SortExpression="userid" />
                                <asp:BoundField DataField="password" HeaderText="Password" 
                                    SortExpression="password" />
                                <asp:CommandField ShowInsertButton="True" />
                            </Fields>
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>
                        <br />
                    </asp:View>        
                    <asp:View ID="View6" runat="server">
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataKeyNames="userid" DataSourceID="SqlDataSource4" 
                            EmptyDataText="There are no data records to display." ForeColor="#333333" 
                            GridLines="None" Width="220px">
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:TemplateField HeaderText="User ID">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("userid") %>'></asp:Label>                                    
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:AdventureWorksConnectionString1 %>" 
                            DeleteCommand="DELETE FROM [Tbl_test_users] WHERE [userid] = @userid" 
                            InsertCommand="INSERT INTO [Tbl_test_users] ([userid], [password]) VALUES (@userid, @password)" 
                            ProviderName="<%$ ConnectionStrings:AdventureWorksConnectionString1.ProviderName %>" 
                            SelectCommand="SELECT [userid], [password] FROM [Tbl_test_users]" 
                            UpdateCommand="UPDATE [Tbl_test_users] SET [password] = @password WHERE [userid] = @userid">
                            <UpdateParameters>
                                <asp:Parameter Name="password" Type="String" />
                                <asp:Parameter Name="userid" Type="String" />
                            </UpdateParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="userid" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="userid" Type="String" />
                                <asp:Parameter Name="password" Type="String" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True">
                        </asp:CheckBoxList>
                        <asp:Button ID="Button1" runat="server" Text="Update" Width="101px" />
                        <br />
                    </asp:View>        
                    <asp:View ID="View7" runat="server">
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataKeyNames="menu_id" DataSourceID="SqlDataSource3" 
                            EmptyDataText="There are no data records to display." ForeColor="#333333" 
                            GridLines="None" Width="236px">
                            <RowStyle BackColor="#E3EAEB" />
                            <Columns>
                                <asp:CommandField ShowEditButton="True" />
                                <asp:BoundField DataField="menu_id" HeaderText="Serial" ReadOnly="True" 
                                    SortExpression="menu_id" />
                                <asp:BoundField DataField="menu_desc" HeaderText="Description" 
                                    SortExpression="menu_desc" />
                            </Columns>
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:AdventureWorksConnectionString1 %>" 
                            DeleteCommand="DELETE FROM [Tbl_test_menu] WHERE [menu_id] = @menu_id" 
                            InsertCommand="INSERT INTO [Tbl_test_menu] ([menu_id], [menu_desc]) VALUES (@menu_id, @menu_desc)" 
                            ProviderName="<%$ ConnectionStrings:AdventureWorksConnectionString1.ProviderName %>" 
                            SelectCommand="SELECT [menu_id], [menu_desc] FROM [Tbl_test_menu]" 
                            UpdateCommand="UPDATE [Tbl_test_menu] SET [menu_desc] = @menu_desc WHERE [menu_id] = @menu_id">
                            <UpdateParameters>
                                <asp:Parameter Name="menu_desc" Type="String" />
                                <asp:Parameter Name="menu_id" Type="Int32" />
                            </UpdateParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="menu_id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="menu_id" Type="Int32" />
                                <asp:Parameter Name="menu_desc" Type="String" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" 
                            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" DataKeyNames="menu_id" DataSourceID="SqlDataSource3" 
                            DefaultMode="Insert" Height="50px" Width="238px">
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <Fields>
                                <asp:BoundField DataField="menu_id" HeaderText="Serial" ReadOnly="True" 
                                    SortExpression="menu_id" />
                                <asp:BoundField DataField="menu_desc" HeaderText="Description" 
                                    SortExpression="menu_desc" />
                                <asp:CommandField ShowInsertButton="True" />
                            </Fields>
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        </asp:DetailsView>
                        <br />
                    </asp:View>        

                </asp:MultiView>
                <br />
            </asp:View>        

        
        </asp:MultiView>  
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
