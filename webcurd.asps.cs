using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Services;
using System.IO;

namespace CURDPriyal
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string Save(string fname, string lname, string email, string subject)
        {
            string str = "";
            SqlConnection con = new SqlConnection("Data Source=CMP28;Initial Catalog=PRIYAL;User ID=sa;Password=jinee@123;");
            SqlCommand cmd;
            SqlDataAdapter adapt;
            cmd = new SqlCommand("insert into employee(fname,lname,email,subject) values('" + fname + "','" + lname + "','" + email + "','" + subject + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            str = "Record Inserted Successfully";
            return str;
        }
        [WebMethod]
        public static string update(string fname, string lname, string email, string subject, int userid)
        {
            string str = "";
            SqlConnection con = new SqlConnection("Data Source=CMP28;Initial Catalog=PRIYAL;User ID=sa;Password=jinee@123;");
            SqlCommand cmd;
            SqlDataAdapter adapt;
            cmd = new SqlCommand("update employee set fname='" + fname + "',lname='" + lname + "',email='" + email + "',subject='" + subject + "' where userid= " + userid + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            str = "Record update Successfully";
            return str;
        }
        [WebMethod]
        public static string delelte(int userid)
        {
            string str = "";
            SqlConnection con = new SqlConnection("Data Source=CMP28;Initial Catalog=PRIYAL;User ID=sa;Password=jinee@123;");
            SqlCommand cmd;
            cmd = new SqlCommand("Delete from employee where userid= " + userid + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            str = "Record Deleted Successfully";
            return str;
        }
        [WebMethod]
        public static string getAlldata(int userid)
        {
            string str = "";
            SqlConnection con = new SqlConnection("Data Source=CMP28;Initial Catalog=PRIYAL;User ID=sa;Password=jinee@123;");
            SqlCommand cmd;
            cmd = new SqlCommand("Select * from employee where userid=" + userid + " order by userid desc", con);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            dt.TableName = "tblData";
            if (dt.Rows.Count > 0)
            {
                using (StringWriter sw = new StringWriter())
                {
                    dt.WriteXml(sw);
                    str = sw.ToString();
                }

            }
            con.Close();
            return str;
        }
    }
}
