using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MedicalSystems.classes;

namespace MedicalSystems
{
    public partial class frmCadastrarConsulta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    formularioConsulta.ChangeMode(FormViewMode.Insert);
                    ((RadioButtonList)formularioConsulta.FindControl("Turnos")).DataSource = Enum.GetNames(typeof(TurnoEnum));
                    ((RadioButtonList)formularioConsulta.FindControl("Turnos")).DataBind();
                    ((RadioButtonList)formularioConsulta.FindControl("Situacao")).DataSource = Enum.GetNames(typeof(SituacaoConsultaEnum));
                    ((RadioButtonList)formularioConsulta.FindControl("Situacao")).DataBind();
                }
                else
                {
                    formularioConsulta.ChangeMode(FormViewMode.Edit);
                    Titulo.InnerText = "Atualizando";
                    subtitle.InnerText = "Área para efetuar o atualizar de Consultas Medicas no sistema";
                    ((RadioButtonList)formularioConsulta.FindControl("Turnos")).DataSource = Enum.GetNames(typeof(TurnoEnum));
                    ((RadioButtonList)formularioConsulta.FindControl("Turnos")).DataBind();
                    ((RadioButtonList)formularioConsulta.FindControl("Situacao")).DataSource = Enum.GetNames(typeof(SituacaoConsultaEnum));
                    ((RadioButtonList)formularioConsulta.FindControl("Situacao")).DataBind();
                }
            }

        }
    }
}