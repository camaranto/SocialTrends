using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
/// <summary>
/// Descripción breve de Class1
/// </summary>
public class Class1
{
    String cadena = "Data Source=FAMILIA\\SQLEXPRESS; Integrated Security=true";
    public SqlConnection conectarbd = new SqlConnection();
	public Class1()
	{
        conectarbd.ConnectionString = cadena;
        
    }

    public void open(){
        try{

            conectarbd.Open();
            Console.WriteLine("conexion abierta");

        }catch(Exception ex){
            Console.WriteLine("conexion fallida" + ex.Message);
        }
    
    }

    public void close(){
        conectarbd.Close();
    }
}