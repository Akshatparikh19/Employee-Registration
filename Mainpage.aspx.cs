using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace WebApplication1
{
    public partial class mainpage : System.Web.UI.Page
    {
        //string str = "Data Source=LAPTOP-UMH233PV;Initial Catalog=Employee_Reg;Integrated Security=True;Pooling=False";
        string str = ConfigurationManager.ConnectionStrings["DBConnStr"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = Get_Datatable("Fill_Department");
                DropDownList1.DataSource = dt;
                DropDownList1.DataBind();
                DropDownList1.DataTextField = "department_name";
                DropDownList1.DataValueField = "ID";
                DropDownList1.DataBind();

                DataTable dt2 = Get_Datatable("Fill_Designation");
                DropDownList2.DataSource = dt2;
                DropDownList2.DataBind();
                DropDownList2.DataTextField = "designation_name";
                DropDownList2.DataValueField = "ID";
                DropDownList2.DataBind();
            }

        }

        protected void Button1_Click1(object sender, EventArgs e)
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
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con = new SqlConnection(str);
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = "Execute InsertData @Name,@mail,@Phone,@Department,@Designation,@doj,@created_on,@created_by";

            cmd.Parameters.Add("@Name", SqlDbType.VarChar, 50).Value = name.Text.ToString();
            cmd.Parameters.Add("@mail", SqlDbType.VarChar, 50).Value = Email.Text.ToString();
            cmd.Parameters.Add("@Phone", SqlDbType.BigInt, 50).Value = Phone.Text.ToString();
            cmd.Parameters.Add("@Department", SqlDbType.VarChar, 100).Value = DropDownList1.Text.ToString();
            cmd.Parameters.Add("@Designation", SqlDbType.VarChar, 50).Value = DropDownList2.Text.ToString();
            cmd.Parameters.Add("@doj",SqlDbType.Date).Value=Convert.ToDateTime(doj.Text);
            cmd.Parameters.Add("@created_on", SqlDbType.Date).Value = DateTime.Now;
            cmd.Parameters.Add("@created_by", SqlDbType.VarChar, 50).Value = Convert.ToString(name.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            //Response.Redirect(Request.Url.ToString());
            Response.Redirect("GridPage.aspx");

        }
    }
}
