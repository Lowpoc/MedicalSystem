using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MedicalSystems.classes.contexto
{
    public class Paciente
    {
        public Int32 pa_id { get; set; }
        public string pa_nome { get; set; }
        public string pa_cpf { get; set; }
        public string es_id { get; set; }
        public string cidade_descricao { get; set; }
        public string pa_telefone { get; set; }
        public DateTime pa_data_aniversario { get; set; }
        public Int32 sexo { get; set; }
        public Int32 pl_id { get; set; }

    }
}