﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MedicalSystemEntities6 : DbContext
    {
        public MedicalSystemEntities6()
            : base("name=MedicalSystemEntities6")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Convenio> co_Convenios { get; set; }
        public virtual DbSet<Consulta> cs_Consulta { get; set; }
        public virtual DbSet<Estado> es_Estados { get; set; }
        public virtual DbSet<Especialidade> esp_Especialidade { get; set; }
        public virtual DbSet<Exame> ex_Exames { get; set; }
        public virtual DbSet<Medico> md_Medicos { get; set; }
        public virtual DbSet<Paciente> pa_Pacientes { get; set; }
        public virtual DbSet<Plano> pl_Planos { get; set; }
        public virtual DbSet<Requisicao> req_Requisao { get; set; }
    }
}
