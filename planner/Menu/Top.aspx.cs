using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Menu_Top : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("aa");
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