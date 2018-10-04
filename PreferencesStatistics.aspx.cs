using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class ProfileImages_PreferencesStatistics : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    DataTable dtP = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Data.DataSet dataSetP = new System.Data.DataSet();
        SqlDataAdapter dataAdapterP = new SqlDataAdapter("SELECT COUNT(Preference) AS Number,Preference  FROM Preferences GROUP BY preference ORDER BY Number DESC", con);
        dataAdapterP.Fill(dataSetP, "Preferences");
        dtP = dataSetP.Tables["Preferences"];
        if (dtP.Rows.Count > 0)
        {
            RepeaterPreferences.DataSource = dtP;
            RepeaterPreferences.DataBind();

        }
    }
}