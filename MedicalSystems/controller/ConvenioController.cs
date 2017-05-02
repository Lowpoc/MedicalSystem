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
    public class ConvenioController
    {


        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Convenio> ConsultarTodos(string co_nome , string co_telefone)
        {
            var contexto = Functions.retonarContexto();

            return contexto.co_Convenios.Where(p => (p.co_nome.Contains(co_nome) || p.co_nome == null) &&
            p.co_telefone.Contains(co_telefone)|| co_telefone == null).ToList();
        }


        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool CadastrarConvenio(Convenio con)
        {
            var contexto = Functions.retonarContexto();
            contexto.co_Convenios.Add(con);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false;
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public bool AtualizarConvenio(Convenio con)
        {
            var contexto = Functions.retonarContexto();
            contexto.co_Convenios.AddOrUpdate(con);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false ;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public bool RemoverConvenio(Int32 co_id)
        {
            var contexto = Functions.retonarContexto();
            Convenio objconvenio = contexto.co_Convenios.Find(co_id);
            contexto.co_Convenios.Remove(objconvenio);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true  : false ;
        }
    }
}