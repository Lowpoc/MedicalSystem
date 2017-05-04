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
    public class ExameController
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Exame> ConsultarTodos(string ex_nome, string ex_codigo)
        {
            var contexto = Functions.retonarContexto();

            return contexto.ex_Exames.Where(p => (p.ex_nome.Contains(ex_nome) || p.ex_nome == null) &&
                                                    p.ex_codigo.Contains(ex_codigo) || ex_codigo == null).ToList();
        }


        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool CadastrarExame(Exame exa)
        {
            var contexto = Functions.retonarContexto();
            contexto.ex_Exames.Add(exa);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false;
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public bool AtualizarExame(Exame exa)
        {
            var contexto = Functions.retonarContexto();
            contexto.ex_Exames.AddOrUpdate(exa);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public bool RemoverExame(Int32 ex_id)
        {
            var contexto = Functions.retonarContexto();
            Exame objExame = contexto.ex_Exames.Find(ex_id);
            contexto.ex_Exames.Remove(objExame);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false;
        }
    }
}
