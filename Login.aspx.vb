Imports System.Data.SqlClient

Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Button_Login_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_Login.Click
        GetUser()
    End Sub

    Private Sub GetUser()

        Dim ConnStr As String = ConfigurationManager.ConnectionStrings("AdventureWorksConnectionString1").ConnectionString.ToString()
        Dim sSql As String
        ConnStr = "Data Source=localhost\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"

        Dim MySqlConn As New SqlConnection(ConnStr)
        MySqlConn.Open()
        Try

            sSql = "Select userid, password from Tbl_test_users where userid = '" & TextBoxUsername.Text.Trim & "'"

            Dim MySqlCmd As New SqlCommand(sSql, MySqlConn)
            Dim mReader As SqlDataReader

            mReader = MySqlCmd.ExecuteReader()
            If mReader.HasRows Then
                While mReader.Read()
                    'check password
                    If Trim(mReader("password")) = TextBoxPassword.Text.Trim Then
                        Session("myUserName") = TextBoxUsername.Text
                        Response.Redirect("Default.aspx")
                    Else
                        LabelMessage.Visible = True
                        LabelMessage.Text = "User ID and Password is invalid..."
                    End If

                End While
            Else
                LabelMessage.Visible = True
                LabelMessage.Text = "User ID and Password is invalid..."
            End If

        Catch ex As Exception

        Finally
            MySqlConn.Close()
        End Try

    End Sub

End Class
