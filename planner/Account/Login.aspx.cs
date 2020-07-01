using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Logout(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Response.Redirect("/Main.aspx");
    }

    protected void LogIn(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(UserName.Text))
        {
            username_label.Text = "아이디를 입력해주세요.";
            return;
        }

        if (string.IsNullOrEmpty(Password.Text))
        {
            password_label.Text = "비밀번호를 입력해주세요.";
            return;
        }
        
        string id = UserName.Text;
        string pwd = Password.Text;

        if (Authenticate(id, pwd))//아이디/비번이 true면
        {
            System.Web.Security.FormsAuthentication.SetAuthCookie(id, false);

            Session["uid"] = id;
            Response.Redirect("~/Main.aspx");
        }
        else//아니면
        {
            alert_label.Text = "아이디 또는 비밀번호를 다시 확인하세요.<br />등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.";
            //Response.Redirect("/Account/Login.aspx");
        }
    }

    private bool Authenticate(string id, string pwd)
    {
        bool blnResult = false;
        SqlConnection objcon = new SqlConnection();
        objcon.ConnectionString =
            "server =(local) ; uid=Basic; pwd=1234; database=Basic;";
        objcon.Open();

        SqlCommand objcmd = new SqlCommand();
        objcmd.Connection = objcon;
        objcmd.CommandText = "select uid from member where uid= '" + id + "' and pwd = '" + pwd + "'";
        objcmd.CommandType = System.Data.CommandType.Text;

        SqlDataReader objdr = objcmd.ExecuteReader();
        if (objdr.HasRows)
        {
            blnResult = true;
            objdr.Close();
        }
        else
        {
            blnResult = false;
        }
        objcon.Close();
        return blnResult;
    }



    protected void Regis(object sender, EventArgs e)
    {
        Response.Redirect("~/Account/Register.aspx");
    }
}