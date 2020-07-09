using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Register : System.Web.UI.Page
{
    [WebMethod]
    public static string CheckUserName(string name)
    {
        string connectionString = "server =(local) ; uid=Basic; pwd=1234; database=Basic;";
        string query = "SELECT uid FROM member WHERE uid = '" + name + "'";

        SqlConnection scon = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(query, scon);
        scon.Open();
        cmd.CommandType = System.Data.CommandType.Text;

        SqlDataReader sdr = cmd.ExecuteReader();

        if (sdr.Read())
        {
            return "failed";
        }
        else
        {
            return "success";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUser_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "server =(local) ; uid=Basic; pwd=1234; database=Basic;";
        conn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;

        cmd.CommandText = "insert into member (uid, pwd) values('"
            + UserName.Text + "','"
            + Password.Text + "')";

        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("/Account/Login.aspx");
    }

    protected void Logout(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Response.Redirect("/Main.aspx");
    }
}