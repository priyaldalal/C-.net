using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class loopajax1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string IfExample(int number)
        {
            string str = "";
            int num = number;
            if (num % 2 == 0)
            {
                //Console.WriteLine("It is even number");  
                str = "it is even number";
                
            }
            return str;
        }

    }
}
