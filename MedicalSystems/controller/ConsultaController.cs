using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using MedicalSystems.classes.contexto;
using MedicalSystems.model;

namespace MedicalSystems.controller
{
    [DataObject(true)]
    public class ConsultaController
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Consulta> ConsultarTodos(string cs_nome, string cs_data)
        {
            var contexto = Functions.retonarContexto();

            return contexto.cs_Consulta.Where(p => (p.cs_nome.Contains(cs_nome) || p.cs_nome == null) &&
                                                 p.cs_data.Equals(cs_data) || cs_data == null).ToList();
        }


        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool CadastrarExame(Consulta cos)
        {
            var contexto = Functions.retonarContexto();
            contexto.cs_Consulta.Add(cos);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false;
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public bool AtualizarExame(Consulta csConsulta)
        {
            var contexto = Functions.retonarContexto();
            contexto.cs_Consulta.AddOrUpdate(csConsulta);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public bool RemoverExame(Int32 cs_id)
        {
            var contexto = Functions.retonarContexto();
            Consulta objConsulta = contexto.cs_Consulta.Find(cs_id);
            contexto.cs_Consulta.Remove(objConsulta);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false;
        }
    }
}