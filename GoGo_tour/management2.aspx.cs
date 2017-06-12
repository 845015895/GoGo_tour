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
    public partial class management2 : System.Web.UI.Page
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


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String userName = GridView1.DataKeys[e.RowIndex].Value.ToString();

            String sql = "delete from tour_user where userName = '" + userName + "'";

            SqlCommand cmd = new SqlCommand(sql,conn);

            conn.Open();

            conn.Close();
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            String sql_add = "insert into tour_user values ('"+add_username_tb.Text+"','"+add_pwd_tb.Text+"','"+add_viewname_tb.Text+"')";

            SqlCommand cmd_add = new SqlCommand(sql_add, conn);

            conn.Open();
            int i = cmd_add.ExecuteNonQuery();

            conn.Close();
            if(i>0){
                add_msg.Text = "添加成功";
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }


 
    }
}