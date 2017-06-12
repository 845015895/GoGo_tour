using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DBAccess
{
    public abstract class SQLHelper
    {
        // <summary>
        /// 得到web.config里配置项的数据库连接字符串
        /// </summary>
        /// <returns>数据库连接字符串</returns>
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }


        /// <summary>
        /// 执行查询语句，返回DataTable
        /// </summary>
        /// <param name="strSql">SQL查询语句</param>
        /// <returns>DataSet</returns>
        public static DataTable GetDataTable(string strSql, params SqlParameter[] cmdParms)
        {
            return GetDataTable(GetConnectionString(), strSql, cmdParms);
        }
        /// <summary>
        /// 执行查询语句，返回DataTable
        /// </summary>
        /// <param name="strSql">SQL查询语句</param>
        /// <param name="connString">数据库连接字符串</param>
        /// <returns>DataTable</returns>
        public static DataTable GetDataTable(string connString, string strSql, params SqlParameter[] cmdParms)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand();
                PrepareCommand(cmd, conn, null, strSql, cmdParms);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    try
                    {
                        da.Fill(dt);
                        cmd.Parameters.Clear();
                        return dt;
                    }
                    catch
                    {
                        return dt;
                    }
                    finally
                    {
                        dt.Dispose();
                        cmd.Dispose();
                        conn.Close();
                    }
                }
            }
        }

        /// <summary>
        /// 执行查询语句，返回DataSet
        /// </summary>
        /// <param name="sqlText">查询语句</param>
        /// <returns>DataSet</returns>
        public static DataSet GetDataSet(string strSql, params SqlParameter[] cmdParms)
        {
            return GetDataSet(GetConnectionString(), strSql, cmdParms);
        }

        /// <summary>
        /// 执行查询语句，返回DataSet
        /// </summary>
        /// <param name="sqlText">查询语句</param>
        /// <returns>DataSet</returns>
        public static DataSet GetDataSet(string connString, string strSql, params SqlParameter[] cmdParms)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand();
                PrepareCommand(cmd, conn, null, strSql, cmdParms);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    try
                    {
                        da.Fill(ds, "ds");
                        cmd.Parameters.Clear();
                        return ds;
                    }
                    catch
                    {
                        return ds;
                    }
                    finally
                    {
                        ds.Dispose();
                        cmd.Dispose();
                        conn.Close();
                    }
                }
            }
        }

        private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, string cmdText, SqlParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();

            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;//cmdType;
            cmd.CommandText = cmdText;

            if (trans != null)
                cmd.Transaction = trans;

            if (cmdParms != null)
            {
                cmd.Parameters.Clear();
                foreach (SqlParameter parameter in cmdParms)
                {
                    if ((parameter.Direction == ParameterDirection.InputOutput || parameter.Direction == ParameterDirection.Input) && (parameter.Value == null))
                        parameter.Value = DBNull.Value;
                    cmd.Parameters.Add(parameter);
                }
            }
        }
    }
}
