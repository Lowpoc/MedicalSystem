using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MedicalSystems.classes.contexto
{
    public class Plano
    {
        public Int32 pl_id { get; set; }
        public string pl_nome { get; set; }
        public Int32 pl_desconto { get; set; }
    }
}