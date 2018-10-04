using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

public partial class EditProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    DataTable dt = new DataTable();
    //String ImageProfile = "";
    protected void Page_Load(object sender, EventArgs e)

    {
        if(!IsPostBack){
            con.Open();
            System.Data.DataSet dataSet = new System.Data.DataSet();
            SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT Email,Name,LastName,City,Phone,ImageProfile FROM Users WHERE Email='" + Session["UserEmail"] + "'", con);
            dataAdapter.Fill(dataSet, "User");
            dt = dataSet.Tables["User"];
            Email.Text = dt.Rows[0][0].ToString();
            Name.Text = dt.Rows[0][1].ToString();
            LastName.Text = dt.Rows[0][2].ToString();
            City.SelectedValue = dt.Rows[0][3].ToString();
            //Country.Text = dt.Rows[0][4].ToString();
            Phone.Text = dt.Rows[0][4].ToString();
            Session["ImageProfile"] = dt.Rows[0][5].ToString();
            con.Close();
        }     
        
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        
        if (Email.Text.Length != 0 && Name.Text.Length != 0 && LastName.Text.Length != 0 && Phone.Text.Length != 0)
        {
            con.Open();
            if (FileUpload1.HasFile)
            {
                string ruta = "~/ProfileImages/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(ruta));
                //File.Delete(ImageProfile);
                Session["ImageProfile"] = ruta;
            }
            string query = "UPDATE Users SET Email='" + Email.Text + "',Name='" + Name.Text + "',LastName='" + LastName.Text + "',City='" + City.SelectedValue + "',Phone='" + Phone.Text + "',ImageProfile='" + Session["ImageProfile"] + "' WHERE UserID = '" + Session["UserID"].ToString() + "'";
            SqlCommand cmd2 = new SqlCommand(query, con);
            cmd2.ExecuteNonQuery();
            Session["UserEmail"] = Email.Text;
            con.Close();
            Response.Redirect("Count.aspx");
        }
        
        
        
    }

}