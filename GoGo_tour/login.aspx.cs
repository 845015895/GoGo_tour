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
    public partial class login : System.Web.UI.Page
    {
        static string ConnStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection conn = new SqlConnection(ConnStr);
        protected void Page_Load(object sender, EventArgs e)
        {
           
            string cbMethod = Request.Form["call"];
            if (cbMethod == "getMess")
            {
                Response.Clear();
                Response.Write(Callback(Request.Form["text"]));
            }
            if (!string.IsNullOrEmpty(cbMethod))
            {
                Response.End();
            }

            Session.Remove("ViewName");
            Session.Clear();
        }


        private string Callback(string text)
        {
            string[] vals = text.Split('|');
            if (vals[0] == "LCB")
            {
                string name = vals[1];
                string pwd = vals[2];
                return UserLogin(name, pwd);
            }
            return "ERROR";
        }

        private string UserLogin(string name, string pwd)
        {

            string retFlag = string.Empty;

            System.Text.StringBuilder strSql = new System.Text.StringBuilder();
            strSql.Append("SELECT TOP(1) userName, viewName, password ");
            strSql.Append("FROM tour_user ");
            strSql.Append("WHERE userName = @name ");
            SqlParameter[] parameters = { new SqlParameter("name", DbType.Object) };
            parameters[0].Value = name;
            using (DataTable dt = DBAccess.SQLHelper.GetDataTable(strSql.ToString(), parameters))
            {
                if (dt == null || dt.Rows.Count == 0){
                    retFlag = "NoUser";  //NoUser用户不存在
                 
                }
                else
                {
                    if (dt.Rows[0]["password"].ToString() != pwd)
                    {
                        retFlag = "PWDError"; //密码错误
                       
                    }
                    else
                    {
                        retFlag = "LOK";//登录成功
                        if (dt.Rows[0]["userName"].ToString() == "admin")
                        {
                            Session["ViewName_admin"] = dt.Rows[0]["viewName"].ToString();
                        }
                        else
                        {

                            Session["ViewName"] = dt.Rows[0]["viewName"].ToString();
                        }
                       

                    }
                }
            }
            return retFlag;
        }
        protected void reg_button_Click(object sender, EventArgs e)
        {

            string userName = this.reg_userId.Value;
            string viewName = this.reg_viewName.Value;
            string password = this.reg_pwdId.Value;
            conn.Open();
            string sql = "select * from tour_user where userName = '"+userName+"'";
            SqlCommand comm = new SqlCommand(sql, conn);
            DataSet ds = new DataSet();
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.Read())
            {


                this.RegTip.InnerText = "用户名已存在";
                dr.Close();

            }else
            {
                dr.Close();
                sql = "insert into tour_user values('" + userName + "','" + password + "','" + viewName + "')";
                comm = new SqlCommand(sql, conn);
                int i = comm.ExecuteNonQuery();
           
                if (i > 0)
                {
                    this.RegTip.InnerHtml = "注册成功";
                    Response.Redirect("login.aspx?type=login");
                }
                
            }
            conn.Close();
       
           
        }
    }
}