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
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    DataTable dt = new DataTable();
    DataTable dtP = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        System.Data.DataSet dataSet = new System.Data.DataSet();
        SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT Email,Name,LastName,City,Country,Phone,ImageProfile FROM Users WHERE Email='"+ Session["UserEmail"] + "'", con);
        dataAdapter.Fill(dataSet, "User");
        dt = dataSet.Tables["User"];
        Email.Text = dt.Rows[0][0].ToString();
        Name.Text = dt.Rows[0][1].ToString();
        LastName.Text = dt.Rows[0][2].ToString();
        City.Text = dt.Rows[0][3].ToString();
        Country.Text = dt.Rows[0][4].ToString();
        Phone.Text = dt.Rows[0][5].ToString();
        ProfileImg.ImageUrl = dt.Rows[0][6].ToString();
       
        System.Data.DataSet dataSetP = new System.Data.DataSet();
        SqlDataAdapter dataAdapterP = new SqlDataAdapter("SELECT Preference FROM Preferences WHERE UserID=" + Session["UserID"] + "", con);
        dataAdapterP.Fill(dataSetP, "Preferences");
        dtP = dataSetP.Tables["Preferences"];
        if (dtP.Rows.Count > 0)
        {
            RepeaterPreferences.DataSource = dtP;
            RepeaterPreferences.DataBind();

        }
        
        DataTable dt2 = new DataTable();
        System.Data.DataSet dataSet2 = new System.Data.DataSet();
        SqlDataAdapter dataAdapter2 = new SqlDataAdapter("SELECT TOP 3 ImageProfile,Name,LastName,UserID FROM Users WHERE (UserID IN (SELECT SenderID FROM Relation WHERE ( ReceiverID=" + Session["UserID"] + " AND Acepted=1))) OR (UserID IN (SELECT ReceiverID FROM Relation WHERE (SenderID=" + Session["UserID"] + "  AND Acepted=1)))", con);
        dataAdapter2.Fill(dataSet2, "friends");
        dt2 = dataSet2.Tables["friends"];
        if (dt2.Rows.Count > 0)
        {
            Repeater2.DataSource = dt2;
            Repeater2.DataBind();
        }
        con.Close();
    }
    protected void AddButton_Click(object sender, EventArgs e)
    {
        con.Open();
        string query = "INSERT INTO Preferences (UserID,Preference) values(" + Session["UserID"] + ",'" + PreferenceText.Text + "')";
        SqlCommand cmd2 = new SqlCommand(query, con);
        cmd2.ExecuteNonQuery();
        Response.Redirect("Count.aspx");
    }
}