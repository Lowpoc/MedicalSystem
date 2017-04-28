using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI.WebControls;
using MedicalSystems.model;

namespace MedicalSystems.classes.contexto
{
    public class Functions
    {

    public static void carregarLista(string tipo, DropDownList objDownList) {

            switch (tipo.ToLower())
            {
            case "estado":
                var ctx = new MedicalSystemEntities();
                objDownList.DataSource = ctx.Estadoes.ToList();
                objDownList.DataTextField = "es_nome";
                objDownList.DataValueField = "es_id";
                objDownList.DataBind();
            break;
            default:
              new Exception("Nao esta configurado ! esta ação escolhida:"+tipo);
            break;
            }
    }
    }



}
