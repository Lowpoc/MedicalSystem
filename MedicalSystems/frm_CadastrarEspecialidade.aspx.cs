using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalSystems
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Request.QueryString["id"] == null)
                {
                    formularioEspecialidade.ChangeMode(FormViewMode.Insert);
                 
                }
                else
                {
                    formularioEspecialidade.ChangeMode(FormViewMode.Edit);
                    Titulo.InnerText = "Atualizando Especialidade";
                    subtitle.InnerText = "Área para atualizar os dados do Especialidade.";
                }
            }
        }
    }
}