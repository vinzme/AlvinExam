Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim pubCount As Integer = 0
    Dim pubMenuNo As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetMenuAccess()
            ListMenuOptions()
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

                    ' Create the menu item
                    Dim newMenuItem = New MenuItem()

                    ' Add the menu item
                    menuBar.Items.Add(newMenuItem)

                    menuBar.Items(i).Text = mReader("menu_desc".Trim)
                    menuBar.Items(i).Value = mReader("menu_id".Trim)

                    If i = 0 Then
                        menuBar.Items(0).Selected = True
                        MultiView1.ActiveViewIndex = mReader("menu_id".Trim)

                    End If

                    i = i + 1

                End While

            End If

        Catch ex As Exception

        Finally
            MySqlConn.Close()
        End Try

    End Sub

    Protected Sub menuBar_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles menuBar.MenuItemClick
        MultiView1.ActiveViewIndex = menuBar.SelectedValue

        Select Case MultiView1.ActiveViewIndex
            Case 0
            Case 1
                MultiView3.ActiveViewIndex = 0
            Case 2
            Case 3
                MultiView2.ActiveViewIndex = 0

        End Select

    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        Select Case RadioButtonList1.SelectedIndex
            Case 0
                MultiView2.ActiveViewIndex = 0
            Case 1
                MultiView2.ActiveViewIndex = 1
            Case 2
                MultiView2.ActiveViewIndex = 2
        End Select
    End Sub

    Protected Sub GridView4_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView4.RowCommand
        Select Case e.CommandName
            Case "Select"
                Dim rowindex As Integer = CInt(e.CommandArgument)
                Dim row As GridViewRow = GridView4.Rows(rowindex)

                Dim tuserid As Label = DirectCast(row.FindControl("Label2"), Label)

                Session("pubUser") = tuserid.Text.Trim
                UserAccess()
        End Select

    End Sub

    Private Sub ListMenuOptions()

        CheckBoxList1.ClearSelection()
        CountMenu()
        AddMenuList()

    End Sub

    Private Sub AddMenuList()

        Dim ConnStr As String = "Data Source=localhost\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"
        Dim sSql As String
        Dim MySqlConn As New SqlConnection(ConnStr)
        MySqlConn.Open()
        Try
            sSql = "select a.userid, b.menu_desc from Tbl_test_access a inner join Tbl_test_menu b " & _
                    "on a.menu_id = b.menu_id where a.userid = 'admin' order by b.menu_id"

            Dim MySqlCmd As New SqlCommand(sSql, MySqlConn)
            Dim mReader As SqlDataReader

            mReader = MySqlCmd.ExecuteReader()
            If mReader.HasRows Then

                While mReader.Read()
                    CheckBoxList1.Items.Add(mReader("menu_desc"))

                End While

            End If

        Catch ex As Exception

        Finally
            MySqlConn.Close()
        End Try

    End Sub

    Private Sub CountMenu()

        Dim ConnStr As String = "Data Source=localhost\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"
        Dim sSql As String
        Dim MySqlConn As New SqlConnection(ConnStr)
        MySqlConn.Open()
        Try
            sSql = "select count(menu_id) as menu_count from Tbl_test_menu"

            Dim MySqlCmd As New SqlCommand(sSql, MySqlConn)
            Dim mReader As SqlDataReader

            mReader = MySqlCmd.ExecuteReader()
            If mReader.HasRows Then

                While mReader.Read()
                    pubCount = mReader("menu_count")

                End While

            End If

        Catch ex As Exception

        Finally
            MySqlConn.Close()
        End Try

    End Sub

    Private Sub UserAccess()
        CheckBoxList1.ClearSelection()

        Dim ConnStr As String = "Data Source=localhost\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"
        Dim sSql As String
        Dim MySqlConn As New SqlConnection(ConnStr)
        MySqlConn.Open()
        Try
            sSql = "select a.userid, b.menu_desc, b.menu_id from Tbl_test_access a inner join Tbl_test_menu b " & _
                    "on a.menu_id = b.menu_id where a.userid = '" & Session("pubUser").ToString.Trim & "' order by b.menu_id"

            Dim MySqlCmd As New SqlCommand(sSql, MySqlConn)
            Dim mReader As SqlDataReader

            mReader = MySqlCmd.ExecuteReader()
            If mReader.HasRows Then

                While mReader.Read()
                    CheckBoxList1.Items(mReader("menu_id")).Selected = True
                End While

            End If

        Catch ex As Exception

        Finally
            MySqlConn.Close()
        End Try

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        DeleteMenuAccess()
        UpdateMenuAccess()
    End Sub

    Private Sub UpdateMenuAccess()

        Dim i As Integer = 0

        For i = 0 To CheckBoxList1.Items.Count - 1
            If CheckBoxList1.Items(i).Selected = True Then
                pubMenuNo = i
                InsertMenuAccess()
            End If
        Next

    End Sub

    Private Sub InsertMenuAccess()

        Dim ConnStr As String = "Data Source=localhost\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"
        Dim MySqlConn As New SqlConnection(ConnStr)

        Dim cmdUpdate As New SqlCommand

        cmdUpdate.CommandText = "insert into dbo.Tbl_test_access(userid, menu_id) values('" & Session("pubUser").ToString.Trim & "','" & pubMenuNo & "')"

        cmdUpdate.Connection = MySqlConn
        cmdUpdate.Connection.Open()
        cmdUpdate.ExecuteNonQuery()
        MySqlConn.Close()


    End Sub

    Private Sub DeleteMenuAccess()

        Dim ConnStr As String = "Data Source=localhost\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"
        Dim MySqlConn As New SqlConnection(ConnStr)

        Dim cmdUpdate As New SqlCommand

        cmdUpdate.CommandText = "delete from dbo.Tbl_test_access where userid = '" & Session("pubUser").ToString.Trim & "'"

        cmdUpdate.Connection = MySqlConn
        cmdUpdate.Connection.Open()
        cmdUpdate.ExecuteNonQuery()
        MySqlConn.Close()

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        Select Case DropDownList1.SelectedValue
            Case "Electric"
                MultiView3.ActiveViewIndex = 0
            Case "Gas"
                MultiView3.ActiveViewIndex = 1
            Case "Electric and Gas"
                MultiView3.ActiveViewIndex = 2
        End Select

    End Sub
End Class
