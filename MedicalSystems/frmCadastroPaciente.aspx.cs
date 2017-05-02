using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using MedicalSystems.classes;
using MedicalSystems.classes.contexto;
using Paciente = MedicalSystems.model.Paciente;

namespace MedicalSystems
{
    public partial class frmCadastroPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Request.QueryString["id"] == null)
                {
                    formularioPaciente.ChangeMode(FormViewMode.Insert);
                    ((RadioButtonList)formularioPaciente.FindControl("Sexos")).DataSource = Enum.GetNames(typeof(SexoEnum));
                    ((RadioButtonList)formularioPaciente.FindControl("Sexos")).DataBind();
                }
                else
                {
                    formularioPaciente.ChangeMode(FormViewMode.Edit);
                    Titulo.InnerText = "Atualizando Paciente";
                    subtitle.InnerText = "Área para atualizar os dados do Paciente.";
                }
            }
        }
        protected void Cadastrar(object sender, EventArgs e)
        {
            
        }

        protected void Cancelar(object sender, EventArgs e)
        {
        }

        private void ClearCampos()
        {
         
        }

        protected void CheckSexo(object sender, ObjectDataSourceMethodEventArgs e)
        {
            ((Paciente)e.InputParameters[0]).pa_sexo = Convert.ToInt32(Enum.Parse(typeof(SexoEnum), ((RadioButtonList)formularioPaciente.FindControl("Sexos")).SelectedValue));
        }
    }
}