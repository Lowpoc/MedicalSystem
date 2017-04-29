using MedicalSystems.classes.contexto;
using MedicalSystems.model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace MedicalSystems.controller
{
    [DataObject(true)]
    public class EstadoController
    {

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Estado> Consultar()
        {
            var contexto = Functions.retonarContexto();
            return contexto.Estadoes.ToList();
        }
    }
}