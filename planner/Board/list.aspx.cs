﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Logout(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Response.Redirect("/Main.aspx");
    }
}