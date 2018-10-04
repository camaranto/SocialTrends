using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class UserProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    DataTable dt = new DataTable();
    DataTable dtP = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        System.Data.DataSet dataSet = new System.Data.DataSet();
        SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT Email,Name,LastName,City,Country,Phone,ImageProfile FROM Users WHERE UserID=" + Session["Other"] + "", con);
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
        SqlDataAdapter dataAdapterP = new SqlDataAdapter("SELECT Preference FROM Preferences WHERE UserID=" + Session["Other"] + "", con);
        dataAdapterP.Fill(dataSetP, "Preferences");
        dtP = dataSetP.Tables["Preferences"];
        if (dtP.Rows.Count > 0)
        {
            RepeaterPreferences.DataSource = dtP;
            RepeaterPreferences.DataBind();

        }
        string q1 = "SELECT COUNT(*) FROM Relation WHERE (SenderID=" + Session["UserID"] + " AND ReceiverID=" + Session["Other"] + "AND Acepted=1) OR (ReceiverID=" + Session["UserID"] + " AND SenderID=" + Session["Other"] + "AND Acepted=1)";
        SqlCommand cmd11 = new SqlCommand(q1, con);
        int sw1 = Convert.ToInt32(cmd11.ExecuteScalar().ToString());
        if (sw1 == 1)
        {
            FriendRequest.Text = "LETS'S SEE OTHER PEOPLE";

        }
        else {
            string q = "SELECT COUNT(*) FROM Relation WHERE (SenderID=" + Session["UserID"] + " AND ReceiverID=" + Session["Other"] + "AND Acepted=0) OR (ReceiverID=" + Session["UserID"] + " AND SenderID=" + Session["Other"] + "AND Acepted=0)";
            SqlCommand cmd1 = new SqlCommand(q, con);
            int sw = Convert.ToInt32(cmd1.ExecuteScalar().ToString());
            if(sw == 1){
                FriendRequest.Text = "WAITING CONFIRMATION";
                FriendRequest.Enabled = false;
                FriendRequest.Style.Value = "background-color:lightgray";
            }
        }
        con.Close();
    }
    protected void FriendRequest_click(object sender, EventArgs e)

    {
        con.Open();
        //string q = "SELECT COUNT(*) FROM Relation WHERE SenderID="+Session["UserID"]+" AND ReceiverID="+Session["Other"]+ "AND Acepted=0";
        //SqlCommand cmd1 = new SqlCommand(q, con);
        //int sw = Convert.ToInt32(cmd1.ExecuteScalar().ToString());
        if (FriendRequest.Text != "WAITING CONFIRMATION" && FriendRequest.Text != "LETS'S SEE OTHER PEOPLE")
        {
            string query = "INSERT INTO Relation (SenderID,ReceiverID,Acepted)  values(" + Session["UserID"] + "," + Session["Other"] + ",0)";
            SqlCommand cmd2 = new SqlCommand(query, con);
            cmd2.ExecuteNonQuery();
            Response.Redirect("UserProfile.aspx");
        }
        else {
            if (FriendRequest.Text == "LETS'S SEE OTHER PEOPLE")
            {
                string q = "DELETE FROM Relation WHERE (SenderID=" + Session["UserID"] + " AND ReceiverID=" + Session["Other"] + "AND Acepted=1) OR (ReceiverID=" + Session["UserID"] + " AND SenderID=" + Session["Other"] + "AND Acepted=1)";
                SqlCommand cmd1 = new SqlCommand(q, con);
                cmd1.ExecuteNonQuery();
                Response.Redirect("UserProfile.aspx");
            }
            
        }
        con.Close();
    }
}