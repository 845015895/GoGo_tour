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
    public partial class index : System.Web.UI.Page
    {

        static string ConnStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(ConnStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            String flag = Request.QueryString["flag"];
            if (flag == "unLogin")
            {
                Session["ViewName"] = null;
            }

            if (Session["ViewName"] == null)
            {
                this.head_left.InnerHtml = "欢迎来到勾勾旅游网，请 <a href='login.aspx?type=login'>登录</a> | <a href='login.aspx?type=regist'>注册</a> 吧！";
            }
            else
            {
                string viewname = Session["ViewName"].ToString();
                this.head_left.InnerHtml = "欢迎来到勾勾旅游网," + viewname + ",<a href=\"index.aspx?flag=unLogin\" >退出</a>";
            }
          
            conn.Open();
            string sql = "SELECT  tour_info.*, tour_introduce.* from tour_info INNER JOIN tour_introduce ON tour_info.id = tour_introduce.id and tour_introduce.id = 1";
            SqlCommand comm = new SqlCommand(sql, conn);
            DataSet ds = new DataSet();
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.Read())
            {
                this.img_1.Src = dr.GetString(dr.GetOrdinal("img"));
                this.title_1.InnerText = dr.GetString(dr.GetOrdinal("name"));
                this.add_text1.InnerText = dr.GetString(dr.GetOrdinal("introduce"));
                this.newPrice_1.InnerText ="￥"+ dr.GetInt32(dr.GetOrdinal("newPrice")).ToString();
                this.oldPrice_1.InnerText = "￥"+dr.GetInt32(dr.GetOrdinal("oldPrice")).ToString();  

            }
            dr.Close();

            sql = "SELECT  tour_info.*, tour_introduce.* from tour_info INNER JOIN tour_introduce ON tour_info.id = tour_introduce.id and tour_introduce.id = 2";
            comm = new SqlCommand(sql, conn);
            ds = new DataSet();
            dr = comm.ExecuteReader();
            if (dr.Read())
            {
                this.img_2.Src = dr.GetString(dr.GetOrdinal("img"));
                this.title_2.InnerText = dr.GetString(dr.GetOrdinal("name"));
                this.add_text2.InnerText = dr.GetString(dr.GetOrdinal("introduce"));
                this.newPrice_2.InnerText = "￥" + dr.GetInt32(dr.GetOrdinal("newPrice")).ToString();
                this.oldPrice_2.InnerText = "￥" + dr.GetInt32(dr.GetOrdinal("oldPrice")).ToString();

            }
            dr.Close();

            sql = "SELECT  tour_info.*, tour_introduce.* from tour_info INNER JOIN tour_introduce ON tour_info.id = tour_introduce.id and tour_introduce.id = 3";
            comm = new SqlCommand(sql, conn);
            ds = new DataSet();
            dr = comm.ExecuteReader();
            if (dr.Read())
            {
                this.img_3.Src = dr.GetString(dr.GetOrdinal("img"));
                this.title_3.InnerText = dr.GetString(dr.GetOrdinal("name"));
                this.add_text3.InnerText = dr.GetString(dr.GetOrdinal("introduce"));
                this.newPrice_3.InnerText = "￥" + dr.GetInt32(dr.GetOrdinal("newPrice")).ToString();
                this.oldPrice_3.InnerText = "￥" + dr.GetInt32(dr.GetOrdinal("oldPrice")).ToString();

            }
            dr.Close();
            sql = "SELECT  tour_info.*, tour_introduce.* from tour_info INNER JOIN tour_introduce ON tour_info.id = tour_introduce.id and tour_introduce.id = 4";
            comm = new SqlCommand(sql, conn);
            ds = new DataSet();
            dr = comm.ExecuteReader();
            if (dr.Read())
            {
                this.img_4.Src = dr.GetString(dr.GetOrdinal("img"));
                this.title_4.InnerText = dr.GetString(dr.GetOrdinal("name"));
                this.add_text4.InnerText = dr.GetString(dr.GetOrdinal("introduce"));
                this.newPrice_4.InnerText = "￥" + dr.GetInt32(dr.GetOrdinal("newPrice")).ToString();
                this.oldPrice_4.InnerText = "￥" + dr.GetInt32(dr.GetOrdinal("oldPrice")).ToString();

            }
            dr.Close();
            sql = "SELECT  tour_info.*, tour_introduce.* from tour_info INNER JOIN tour_introduce ON tour_info.id = tour_introduce.id and tour_introduce.id = 5";
            comm = new SqlCommand(sql, conn);
            ds = new DataSet();
            dr = comm.ExecuteReader();
            if (dr.Read())
            {
                this.img_5.Src = dr.GetString(dr.GetOrdinal("img"));
                this.title_5.InnerText = dr.GetString(dr.GetOrdinal("name"));
                this.add_text5.InnerText = dr.GetString(dr.GetOrdinal("introduce"));
                this.newPrice_5.InnerText = "￥" + dr.GetInt32(dr.GetOrdinal("newPrice")).ToString();
                this.oldPrice_5.InnerText = "￥" + dr.GetInt32(dr.GetOrdinal("oldPrice")).ToString();

            }
            dr.Close();


           
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }

        }

        protected void search_img_Click(object sender, EventArgs e)
        {
            conn.Open();
            String serch_str = this.search_input.Value;
            string sql = "select * from tour_info where name like '%"+serch_str+"%'";
            SqlCommand comm = new SqlCommand(sql, conn);
            DataSet ds = new DataSet();
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.Read())
            {
                String id = dr.GetInt32(dr.GetOrdinal("id")).ToString();
                Response.Redirect("show_info.aspx?id="+id);
            }
            dr.Close();

            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }

   
    }
}