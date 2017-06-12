using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace GoGo_tour
{
    public partial class management1 : System.Web.UI.Page
    {
        static string ConnStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(ConnStr);
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

        protected void find_btn_Click(object sender, EventArgs e)
        {
            Response.Write("hahah");
            find_tb.Text = "成功";
            String sql_find = "select * from tour_user where userName = '" + find_tb.Text + "'" ;

            SqlCommand cmd_add = new SqlCommand(sql_find, conn);

            conn.Open();
            conn.Close();
            GridView1.DataBind();
            //if (i > 0)
            //{
            //    GridView1.DataBind();
            //}
        }


    }
}