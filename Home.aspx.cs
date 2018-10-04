using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        string query = "SELECT COUNT(*) FROM Relation WHERE ReceiverID='"+Session["UserID"]+"' AND Acepted= 0";
        SqlCommand cmd1 = new SqlCommand(query, con);
        int sw = Convert.ToInt32(cmd1.ExecuteScalar().ToString());
        if(sw > 0){
            Bell.Style.Value = "color:red";
            NumNotifications.Text = sw.ToString();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        con.Open();
        Boolean sw = false;
        while (sw==false)
        {
            string query = "SELECT TOP 1 Email FROM Users ORDER BY NEWID()";
            SqlCommand cmd1 = new SqlCommand(query, con);
            String Name = cmd1.ExecuteScalar().ToString();
            if (Session["UserEmail"].ToString()!=Name)
            {
                sw = true;
                con.Close();
                Response.Redirect("Routine.aspx?Email=" + Name);
            }
       }
    }

}
