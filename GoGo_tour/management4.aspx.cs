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
    public partial class management4 : System.Web.UI.Page
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


        //protected void tour_info_grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    int id = Convert.ToInt32(tour_info_grid.DataKeys[e.RowIndex].Value);

        //    String sql = "delete from tour_info where id = '" + id + "'";

        //    SqlCommand cmd = new SqlCommand(sql, conn);

        //    conn.Open();

        //    conn.Close();
        //    tour_info_grid.DataBind();
        //}
        
        protected void tour_info_grid_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}