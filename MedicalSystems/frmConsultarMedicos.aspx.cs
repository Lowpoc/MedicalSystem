using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MedicalSystems.model;

namespace MedicalSystems
{
    public partial class frmConsultarMedicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var contexto = new MedicalSystemEntities1();
           
        }
    }
}