//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MedicalSystems.model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Requisicao
    {
        public int req_id { get; set; }
        public int pa_id { get; set; }
        public int ex_id { get; set; }
        public Nullable<System.DateTime> data { get; set; }
        public string req_obersavacao { get; set; }
        public Nullable<decimal> valor { get; set; }
        public int co_id { get; set; }
    
        public virtual Convenio co_Convenios { get; set; }
        public virtual Exame ex_Exames { get; set; }
        public virtual Paciente pa_Pacientes { get; set; }
    }
}
