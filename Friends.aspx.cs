using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Friends : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            DataTable dt = new DataTable();
            con.Open();
            System.Data.DataSet dataSet = new System.Data.DataSet();
            SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT Email,ImageProfile,Name,LastName,UserID FROM Users WHERE (UserID IN (SELECT SenderID FROM Relation WHERE ( ReceiverID=" + Session["UserID"] + " AND Acepted=1))) OR (UserID IN (SELECT ReceiverID FROM Relation WHERE (SenderID=" + Session["UserID"] + "  AND Acepted=1)))", con);
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
            case "ButtonBye":
                string baID = e.CommandArgument.ToString();
                string q = "DELETE FROM Relation WHERE (SenderID=" + Session["UserID"] + " AND ReceiverID=" + baID + "AND Acepted=1) OR (ReceiverID=" + Session["UserID"] + " AND SenderID=" + baID + "AND Acepted=1)";
                SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                con1.Open();
                SqlCommand cmd4 = new SqlCommand(q, con1);
                cmd4.ExecuteNonQuery();
                con1.Close();
                Response.Redirect("Friends.aspx");
                break;
        }
    }
}