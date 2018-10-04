using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class SearchEvent : System.Web.UI.Page
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
        if (dt.Rows.Count > 0)
        {
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }

    }
}