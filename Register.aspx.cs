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

    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile & City.SelectedItem.Value != "0" & EmailText.Text.Length != 0 & PasswordText.Text.Length != 0 & TxtName.Text.Length != 0 & TxtLastName.Text.Length != 0)
        {
            //si hay una archivo.
            string nombreArchivo = FileUpload1.FileName;
            string ruta = "~/ProfileImages/" + nombreArchivo;
            FileUpload1.SaveAs(Server.MapPath(ruta));
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            DateTime fecha = DateTime.Now;
            con.Open();
            string query_Rep = "INSERT INTO Users (Name,LastName,Phone,Country,City,Password,Email,ImageProfile) values('" + TxtName.Text + "','" + TxtLastName.Text + "','" + TxtPhone.Text + "','Colombia','" + City.SelectedItem.ToString() + "','" + PasswordText.Text + "','" + EmailText.Text + "','" + ruta + "')";
            SqlCommand cmd1 = new SqlCommand(query_Rep, con);
            cmd1.ExecuteNonQuery();
            con.Close();

        }
        else
        {
            //error
        }
    }
}