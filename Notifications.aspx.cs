using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Notifications : System.Web.UI.Page
{
    /*
         * SELECT DISTINCT Email,ImageProfile,Name,LastName 
           FROM Users 
           INNER JOIN Relation ON Relation.SenderID=Users.UserID 
           WHERE Users.UserID IN (SELECT SenderID FROM Relation WHERE ReceiverID = 2)
         */
    protected void Page_Load(object sender, EventArgs e)

    {
        if(!IsPostBack){
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            DataTable dt = new DataTable();
            con.Open();
            System.Data.DataSet dataSet = new System.Data.DataSet();
            SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT DISTINCT Email,Name,LastName,ImageProfile,UserID FROM Users INNER JOIN Relation ON Relation.SenderID=Users.UserID WHERE Users.UserID IN (SELECT SenderID FROM Relation WHERE ReceiverID = " + Session["UserID"] + "AND Acepted =0)", con);
            dataAdapter.Fill(dataSet, "User");
            dt = dataSet.Tables["User"];
            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            con.Close();
        }
        
    }
    protected void Elements_Command(object sender, CommandEventArgs e)
    {
        
        switch (e.CommandName)
        {

            case "ButtonSender":
                string caS = e.CommandArgument.ToString();
                //Cualquier procedimiento con coneccion
                string query = "SELECT UserID FROM Users WHERE Email='" + caS + "'";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                con.Open();
                SqlCommand cmd3 = new SqlCommand(query, con);
                Session["Other"] = cmd3.ExecuteScalar().ToString();
                con.Close();
                Response.Redirect("UserProfile.aspx");
                break;
            case "ButtonAccept":
                string baID = e.CommandArgument.ToString();
                string query1 = "UPDATE Relation SET Acepted = 1 WHERE ReceiverID=" + Session["UserID"] + " AND SenderID=" + baID;
                SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                con1.Open();
                SqlCommand cmd4 = new SqlCommand(query1, con1);
                cmd4.ExecuteNonQuery();
                con1.Close();
                Response.Redirect("Notifications.aspx");
                break;
            case "ButtonDenied":
                string bdID = e.CommandArgument.ToString();
                string query2 = "DELETE FROM Relation WHERE ReceiverID=" + Session["UserID"] + " AND SenderID=" + bdID;
                SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                con2.Open();
                SqlCommand cmd5 = new SqlCommand(query2, con2);
                cmd5.ExecuteNonQuery();
                con2.Close();
                Response.Redirect("Notifications.aspx");
                break;
        }
    }
}