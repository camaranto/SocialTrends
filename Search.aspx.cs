using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
        DataTable dt = new DataTable();
        con.Open();
        System.Data.DataSet dataSet = new System.Data.DataSet();
        SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT Email,Name,LastName,ImageProfile FROM Users WHERE NOT Email='" + Session["UserEmail"] + "' AND( Email LIKE '%" + SearchText.Text + "%' OR Name LIKE '%" + SearchText.Text + "%')", con);
        dataAdapter.Fill(dataSet, "User");
        dt = dataSet.Tables["User"];
        if(dt.Rows.Count > 0){
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
        con.Close();
    
    }
    protected void NaughtyButton_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
        DataTable dt = new DataTable();
        con.Open();
        System.Data.DataSet dataSet = new System.Data.DataSet();
        SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT DISTINCT Email,ImageProfile,Name,LastName FROM Users INNER JOIN Preferences ON Preferences.UserID=Users.UserID WHERE (Preference IN (SELECT Preference FROM Preferences WHERE Preferences.UserID = '"+Session["UserID"]+"') AND NOT Users.UserID ='"+Session["UserID"]+"')", con);
        dataAdapter.Fill(dataSet, "User");
        dt = dataSet.Tables["User"];
        if (dt.Rows.Count > 0)
        {
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
        con.Close();
    
    }
    
    protected void Elements_Command(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "ButtonSender":
                string caS = e.CommandArgument.ToString();
                //Cualquier procedimiento con coneccion
                string query = "SELECT UserID FROM Users WHERE Email='"+caS+"'";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                con.Open();
                SqlCommand cmd3 = new SqlCommand(query, con);
                Session["Other"] = cmd3.ExecuteScalar().ToString();
                con.Close();
                Response.Redirect("UserProfile.aspx");
                break;

        }
    }
}