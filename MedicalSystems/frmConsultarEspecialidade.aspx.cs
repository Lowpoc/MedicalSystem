using MedicalSystems.controller;
using MedicalSystems.model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalSystems
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ObjectEspecialidade_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            
        }

        protected void ObjectEspecialidade_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {
             if((bool)e.ReturnValue == false)
            {
                   Response.Write(@"<script type='text/javascript'>
                        alert('nao possivel remover pois ja existe medico vinculado')
                   </script>");
            }
            else
            {
                Response.Write(@"<script type='text/javascript'>
                        alert('nao possivel remover pois ja existe medico vinculado')
                   </script>");
            }
        }
    }
}