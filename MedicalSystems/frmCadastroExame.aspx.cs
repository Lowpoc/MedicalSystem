using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalSystems
{
    public partial class frmCadastroExame : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    formularioExames.ChangeMode(FormViewMode.Insert);
                }
                else
                {
                    formularioExames.ChangeMode(FormViewMode.Edit);
                    Titulo.InnerText = "Atualizando";
                    subtitle.InnerText = "Área para efetuar o atualizar  Exames no sistema";
                }
            }
        }
    }
}