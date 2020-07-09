using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Board_write : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSaveClick(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "server =(local) ; uid=Basic; pwd=1234; database=Basic;";
        conn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;

        if (Session["uid"]!=null)
        {
            cmd.CommandText = "insert into board (uid, title, date, content) values('"
          + Session["uid"] + "','"
          + title.Text + "',"
          + "Getdate()" + ",'"
          + content.Text + "')";

            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("list.aspx");
        }
        else
        {
            Response.Redirect("/Account/Login.aspx");
        }
    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("list.aspx");
    }

    protected void Logout(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Response.Redirect("/Main.aspx");
    }

    protected void CreateUser_Click(object sender, EventArgs e)
    {

    }
}