using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace CURDPriyal
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
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
       
    }
}
