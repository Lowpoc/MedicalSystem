using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using MedicalSystems.classes.contexto;
using MedicalSystems.model;
using Plano = MedicalSystems.model.Plano;

namespace MedicalSystems.controller
{
    [DataObject(true)]
    public class PlanoController
    {

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Plano> consultaPlanos()
        {
            var contexto = Functions.retonarContexto();
            return contexto.pl_Planos.ToList();
        }
    }
}