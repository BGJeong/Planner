using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Planner : System.Web.UI.Page
{
    [WebMethod]
    public static string[] GetSomeThings()
    {
        string conn = "server =(local) ; uid=Basic; pwd=1234; database=Basic;";
        string uid = "asdf";

        SqlConnection con = new SqlConnection(conn);
        SqlCommand cmd = new SqlCommand("Select lat,lng,addr, Id, title from planner where uid = '" + uid + "'");
        cmd.Connection = con;
        con.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        
        List<string> strings = new List<string>();
        
        while (sdr.Read())
        {
            
            strings.Add(sdr["lat"].ToString());
            strings.Add(sdr["lng"].ToString());
            strings.Add(sdr["addr"].ToString());
            strings.Add(sdr["title"].ToString());
            strings.Add(sdr["Id"].ToString());
            
        }

        return strings.ToArray<string>();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
         if (Session["uid"] == null) {
             Response.Redirect("/Account/Login.aspx");
         }
    }

    protected void Logout(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Response.Redirect("/Main.aspx");
    }

    protected void savePlan(object sender, EventArgs e)
    {
        
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "server =(local) ; uid=Basic; pwd=1234; database=Basic;";
        conn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;

        
        String Title = Request["title"];
        if(Title == null)
        {
            Title = "제목을 입력하세요";
        }

        Object uid = Session["uid"];
        String lat = Request["plan_lat"];
        String lng = Request["plan_lng"];
        String address = Request["plan_address"];

        cmd.CommandText = "insert into planner (uid, title, lat, lng, addr) values('" + uid + "','" + Title + "','" + lat + "','" + lng + "','" + address + "')";
        
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("/Planner.aspx");

        //Response.Write(Request["plan_lat"]);
    }

    [WebMethod]
    public static string delete(string id)
    {
        string Number = id;

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "server =(local) ; uid=Basic; pwd=1234; database=Basic;";
        conn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;

        cmd.CommandText = "delete from Planner where Id= '"+Number+"'";
        cmd.ExecuteNonQuery();
        conn.Close();

        return Number; 
    }

    [WebMethod(EnableSession = true)]
    public static string logout()
    {
        //Session["uid"] = null;
        HttpContext.Current.Session["uid"] = null;
        //Response.Redirect("/Main.aspx");

        return "success";
    }
}