using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MedicalSystems.classes
{
    public class Medicos
    {
        public Int32 md_id { get; set; }
        public string md_nome { get; set; }
        public string md_cpf { get; set; }
        public string md_crm { get; set; }
        public string md_endereco { get; set; }
        public Int32 es_id { get; set; }
        public string cidade_descricao { get; set; }
        public Int32 md_atendimentos_turnos { get; set; }
    }
}