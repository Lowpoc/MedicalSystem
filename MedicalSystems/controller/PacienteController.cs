using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using MedicalSystems.classes.contexto;
using MedicalSystems.model;
using Paciente = MedicalSystems.model.Paciente;

namespace MedicalSystems.controller
{
    [DataObject(true)]
    public class PacienteController
    {

        [DataObjectMethod(DataObjectMethodType.Select)]
        public bool CadastrarPaciente(Paciente p)
        {
            var contexto = Functions.retonarContexto();
            contexto.pa_Pacientes.Add(p);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Paciente> ConsultarComFiltros(string pa_nome , string pa_cpf)
        {
            var contexto = Functions.retonarContexto();
            return contexto.pa_Pacientes
                    .Where(p =>(p.pa_nome.Contains(pa_nome) || pa_nome == null) 
                     && (p.pa_cpf.Contains(pa_cpf) || pa_cpf == null))
                    .ToList();
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public bool RemoverPaciente(Int32 pa_id)
        {
            var contexto = Functions.retonarContexto();
            Paciente p = contexto.pa_Pacientes.Find(pa_id);
            contexto.pa_Pacientes.Remove(p);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false ;
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public bool AtualizarPaciente(Paciente p)
        {
            var contexto = Functions.retonarContexto();
            contexto.pa_Pacientes.AddOrUpdate(p);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false;
        }
    }
}