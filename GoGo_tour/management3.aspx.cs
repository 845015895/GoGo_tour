using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoGo_tour
{
    public partial class management3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ViewName_admin"] != null)
            {
                string viewname = Session["ViewName_admin"].ToString();
                this.head_right.InnerHtml = "欢迎使用勾勾网管理系统," + viewname + ",<a href=\"login.aspx\" >退出</a>";
            }
            else
            {
                Response.Redirect("login.apsx");
            }
        }
    }
}