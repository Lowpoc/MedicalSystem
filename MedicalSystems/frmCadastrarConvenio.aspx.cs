using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalSystems
{
    public partial class frmCadastrarConvenio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    formularioConvenio.ChangeMode(FormViewMode.Insert);
                }
                else
                {
                    formularioConvenio.ChangeMode(FormViewMode.Edit);
                    Titulo.InnerText = "Atualizando";
                    subtitle.InnerText = "Área para efetuar o atualizar do Convênios no sistema";
                }
            }
        }
    }
}