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
    public partial class show_info : System.Web.UI.Page
    {

        static string ConnStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(ConnStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            string sql = "SELECT  tour_info.*, tour_introduce.* from tour_info INNER JOIN tour_introduce ON tour_info.id = tour_introduce.id and tour_introduce.id = '" + id + "'";
            conn.Open();
            SqlCommand comm = new SqlCommand(sql, conn);
            DataSet ds = new DataSet();
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.Read())
            {
                //下面两种都可以获得数据
                //this.TextBox1.Text = dr.GetString(1);
                //this.TextBox2.Text = dr.GetInt32(3).ToString();
                this.show_img.Src = dr.GetString(dr.GetOrdinal("img"));
                this.content_title.InnerText = dr.GetString(dr.GetOrdinal("name"));
                this.content_msg.InnerText = dr.GetString(dr.GetOrdinal("introduce"));
                this.now_addr.InnerText = dr.GetString(dr.GetOrdinal("addr"));
                this.now_rank.InnerText = dr.GetString(dr.GetOrdinal("rank"));
                this.now_price_text.InnerText = dr.GetInt32(dr.GetOrdinal("newPrice")).ToString();
                this.old_price.InnerText = dr.GetInt32(dr.GetOrdinal("oldPrice")).ToString();
                this.show_info_msg.InnerText = dr.GetString(dr.GetOrdinal("msg"));
              
            }
            dr.Close();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }
}