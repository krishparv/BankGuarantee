using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BankGuarantee
{
    public class SqlHelper
    {
        SqlConnection conn = null;

        public void _Connect()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLDbConnection"].ConnectionString);
            conn.Open();
        }
        public SqlHelper()
        {
            _Connect();
        }

  
        public int ExecuteNonQuery (string query, params object [] args)
    {
       
            //conn.Open();
            //  SqlDataReader sqlreader = null;
            SqlCommand sqlcmd = new SqlCommand(query, conn);
            sqlcmd.CommandType = CommandType.Text;
            for (int i = 0; i < args.Length; i++)
            {
                sqlcmd.Parameters.AddWithValue(args[i].ToString(), args[i++]);
            }           
           
           return sqlcmd.ExecuteNonQuery();       


        //    conn.Close();

    }

        public SqlDataReader ExecuteReader(string query,params object [] args)
        {
            SqlDataReader sqlreader = null;
            SqlCommand sqlcmd = new SqlCommand(query, conn);
            sqlcmd.CommandType = CommandType.Text;
            for (int i = 0; i < args.Length; i++)
            {
                sqlcmd.Parameters.AddWithValue(args[i].ToString(), args[i++]);
            }

           sqlreader=sqlcmd.ExecuteReader();
           return sqlreader;
            

        }

        public void Disconnect()
        {
            conn.Close();
        }
    }
}