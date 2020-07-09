using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Board_modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ModifyItems();
        }
    }

    private void ModifyItems()
    {
        string Num = Request.QueryString["param"];


        string connectionString = "server =(local) ; uid=Basic; pwd=1234; database=Basic;";
        SqlConnection scon = new SqlConnection(connectionString);
        SqlCommand scom = new SqlCommand();

        scom.Connection = scon;
        scom.CommandText = "SELECT uid,date,title,content FROM board WHERE id = '" + Num + "'";
        //scom.CommandText = "SELECT Name,PostDate,Title,Content FROM board";
        scon.Open();

        SqlDataReader sdr = scom.ExecuteReader();

        while (sdr.Read())
        {
            TB_Writer.Text = sdr["uid"].ToString();
            TB_Date.Text = sdr["date"].ToString();
            TB_Title.Text = sdr["title"].ToString();
            TB_Content.Text = sdr["content"].ToString();
        }
        sdr.Close();
        scon.Close();
    }

    protected void Logout(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Response.Redirect("/Main.aspx");
    }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        int num = int.Parse(Request["param"].ToString());
        Response.Redirect("/Board/view.aspx?param=" + num);
    }

    protected void Modify_Click(object sender, EventArgs e)
    {
        int num = int.Parse(Request["param"].ToString());
        
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "server =(local) ; uid=Basic; pwd=1234; database=Basic;";
        conn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;

        cmd.CommandText = "update board set title = '"
            + TB_Title.Text + "', content = '"
            + TB_Content.Text + "' where id like "
            + num;

        cmd.ExecuteNonQuery();

        conn.Close();



        Response.Redirect("/Board/view.aspx?param=" + num);
    }
}