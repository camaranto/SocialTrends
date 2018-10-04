using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (EmailText.Text.Length != 0 & PasswordText.Text.Length != 0)
        {
          
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            con.Open();
            string User_Checker = "SELECT COUNT(*) FROM Users WHERE Email='" + EmailText.Text+"'";
            SqlCommand cmd1 = new SqlCommand(User_Checker, con);
            int Temp = Convert.ToInt32(cmd1.ExecuteScalar().ToString());
            //cmd1.ExecuteNonQuery();
            con.Close();
            if(Temp == 1){
                con.Open();
                string Password_Checker = "SELECT Password FROM Users WHERE Email='" + EmailText.Text + "'";
                SqlCommand cmd2 = new SqlCommand(Password_Checker, con);
                string password= cmd2.ExecuteScalar().ToString();

                string UserID = "SELECT UserID FROM Users WHERE Email='" + EmailText.Text + "'";
                SqlCommand cmd3 = new SqlCommand(UserID, con);
                Session["UserID"] = cmd3.ExecuteScalar().ToString();

                if(password == PasswordText.Text){
                    Session["UserEmail"] = EmailText.Text;
                    Response.Redirect("Home.aspx");
                    //Response.Write("Succes");
                }else{
                    //Response.Write("No succes");
                    /*ClientScriptManager CSM = Page.ClientScript;
                    string strconfirm = "<script>if(!window.confirm('Email or Password incorrect')){window.location.href='Login.aspx'}</script>";
                    CSM.RegisterClientScriptBlock(this.GetType(), "Confirm", strconfirm, false);*/
                    string display = "Email Or Password incorrect!";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                }
            }
        }
        else
        {
            //error
        }
    }
}