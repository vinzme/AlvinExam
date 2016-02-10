Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Label1.Text = Session("myUserName")
            Session("myUserName") = "alvin"
            GetMenuAccess()

        End If
    End Sub

    Private Sub GetMenuAccess()

        Dim ConnStr As String
        Dim sSql As String
        Dim i As Integer

        ConnStr = "Data Source=localhost\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"

        Dim MySqlConn As New SqlConnection(ConnStr)
        MySqlConn.Open()
        Try
            i = 0

            sSql = "SELECT Tbl_test_access.menu_id, Tbl_test_menu.menu_desc FROM Tbl_test_access " & _
                    "INNER JOIN Tbl_test_menu ON Tbl_test_access.menu_id = Tbl_test_menu.menu_id " & _
                    "WHERE Tbl_test_access.userid = '" & Session("myUserName") & "'"

            Dim MySqlCmd As New SqlCommand(sSql, MySqlConn)
            Dim mReader As SqlDataReader

            mReader = MySqlCmd.ExecuteReader()
            If mReader.HasRows Then
                While mReader.Read()

                    ' Create the menu item for Year.
                    Dim newMenuItem = New MenuItem()

                    ' Add the menu item
                    menuBar.Items.Add(newMenuItem)

                    menuBar.Items(i).Text = mReader("menu_desc".Trim)
                    menuBar.Items(i).Value = mReader("menu_id".Trim)

                    If i = 0 Then
                        menuBar.Items(0).Selected = True

                    End If

                    i = i + 1

                End While

            End If

        Catch ex As Exception

        Finally
            MySqlConn.Close()
        End Try

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged

        Dim cryRpt As New ReportDocument
        cryRpt.Load(Server.MapPath("CrystalReportTest.rpt"))

        Dim crParameterFieldDefinitions As ParameterFieldDefinitions
        Dim crParameterFieldDefinition As ParameterFieldDefinition
        Dim crParameterValues As New ParameterValues
        Dim crParameterDiscreteValue As New ParameterDiscreteValue

        crParameterDiscreteValue.Value = DropDownList1.SelectedItem.Text.Trim

        crParameterFieldDefinitions = cryRpt.DataDefinition.ParameterFields
        crParameterFieldDefinition = crParameterFieldDefinitions.Item("Utility")
        crParameterValues = crParameterFieldDefinition.CurrentValues

        crParameterValues.Clear()
        crParameterValues.Add(crParameterDiscreteValue)
        crParameterFieldDefinition.ApplyCurrentValues(crParameterValues)

        CrystalReportViewer1.ReportSource = cryRpt
        'CrystalReportViewer1.Refresh()

    End Sub

    Private Sub BindCrystalReport()
        Dim crystalReport As New ReportDocument()
        Dim SqlStr As String
        crystalReport.Load(Server.MapPath("~/CrystalReportTest.rpt"))
        SqlStr = "Select * from Tbl_test_Report2 where Utility = '" & DropDownList1.SelectedItem.Text.Trim & "'"
        Dim dsUtility As Utility = GetData(SqlStr)
        crystalReport.SetDataSource(dsUtility)
        CrystalReportViewer1.ReportSource = crystalReport
    End Sub

    Private Function GetData(ByVal query As String) As Utility

        Dim conString As String = ConfigurationManager.ConnectionStrings("connectionstring").ConnectionString
        Dim cmd As New SqlCommand(query)
        Using con As New SqlConnection(conString)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con

                sda.SelectCommand = cmd
                Using dsUtility As New Utility()
                    sda.Fill(dsUtility, "Utility")
                    Return dsUtility
                End Using
            End Using
        End Using
    End Function

End Class
