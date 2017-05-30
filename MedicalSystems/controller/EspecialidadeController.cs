using MedicalSystems.classes.contexto;
using MedicalSystems.model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace MedicalSystems.controller
{
    [DataObject(true)]
    public class EspecialidadeController
    {

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Especialidade> ConsultarTodos(string esp_nome, string esp_descricao)
        {
            var contexto = Functions.retonarContexto();

            return contexto.esp_Especialidade.Where(p => (p.esp_nome.Contains(esp_nome) || esp_nome == null) &&
                                                 p.esp_descricao.Contains(esp_descricao) || esp_descricao == null).ToList();
        }


        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool CadastrarEspecialidade(Especialidade esp)
        {
            var contexto = Functions.retonarContexto();
            contexto.esp_Especialidade.Add(esp);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false;
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public bool AtualizarEspecialidade(Especialidade espobj)
        {
            var contexto = Functions.retonarContexto();
            contexto.esp_Especialidade.AddOrUpdate(espobj);
            var retorno = contexto.SaveChanges();
            return retorno == 1 ? true : false;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public bool RemoverEspecialidade(Int32 esp_id)
        {
            var contexto = Functions.retonarContexto();
            if (ValidateRemocao(esp_id) == 0)
            {
                Especialidade objEspecialidade = contexto.esp_Especialidade.Find(esp_id);
                contexto.esp_Especialidade.Remove(objEspecialidade);
                var retorno = contexto.SaveChanges();
                return retorno == 1 ? true : false;
            }
            return false;
          
        }

        public int ValidateRemocao(Int32 esp_id)
        {
            var contexto = Functions.retonarContexto();
            return contexto.md_Medicos.Include("Especialidade")
                    .Where(x => x.esp_id == esp_id).Count();
            
        }
    }
}