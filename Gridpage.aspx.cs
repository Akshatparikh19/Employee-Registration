using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Newtonsoft.Json;
using System.Web.Services;


namespace WebApplication1
{
    public partial class GridPage : System.Web.UI.Page
    {
        static string str = ConfigurationManager.ConnectionStrings["DBConnStr"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }


        [WebMethod]
        public static string GetEmpData()
        {
            SqlConnection objCon = new SqlConnection();
            objCon = new SqlConnection(str);

            SqlCommand objCmd;

            DataTable dt = new DataTable();
            objCmd = new SqlCommand("Fill_Employee", objCon);
            objCmd.CommandType = CommandType.StoredProcedure;

            objCmd.CommandTimeout = 1000;
            SqlDataAdapter da = new SqlDataAdapter(objCmd);
            try
            {
                objCon.Open();
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                dt = null;
                throw ex;
            }
            finally { objCon.Close(); }


            string jsonresult = JsonConvert.SerializeObject(dt);

            return jsonresult;
        }

        [WebMethod]
        public static void Method1()
        {
        }
        protected DataTable Get_Datatable(string spname)
        {
            SqlConnection objCon = new SqlConnection();
            objCon = new SqlConnection(str);

            SqlCommand objCmd;

            DataTable dt = new DataTable();
            objCmd = new SqlCommand(spname, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;

            objCmd.CommandTimeout = 1000;
            SqlDataAdapter da = new SqlDataAdapter(objCmd);
            try
            {
                objCon.Open();
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                dt = null;
                throw ex;
            }
            finally { objCon.Close(); }



            return dt;
        }
    }
}
