using MedicalSystems.classes;
using MedicalSystems.classes.contexto;
using MedicalSystems.model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace MedicalSystems.controller
{
    [DataObject(true)]
    public class MedicoController
    {

        #region Cadastrar
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public bool registrar(Medico medicoClass)
        {
            var ctx = Functions.retonarContexto();
            ctx.md_Medicos.Add(medicoClass);
            var retorno = ctx.SaveChanges();
            return retorno == 1 ? true : false;
        }
        #endregion

        #region SelecionarMedicos
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Medico> consultarComfiltros(string md_nome, string md_crm)
        {
            var contexto = Functions.retonarContexto();
            return contexto.md_Medicos
                .Where(p => (p.md_nome.Contains(md_nome) || md_nome == null) &&
                            (p.md_crm.Contains(md_crm) || md_crm == null))
                .ToList();
        }
        #endregion

        #region UpdateMedico
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void AtualizarMedico(Medico medicosClass)
        {
            var contexto = Functions.retonarContexto();
            contexto.md_Medicos.AddOrUpdate(medicosClass);
            contexto.SaveChanges();
        }

        #endregion

        #region RemoverMedico
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public bool RemoverMedico(Int32 md_id)
        {
            var contexto = Functions.retonarContexto();
           var medico =  contexto.md_Medicos.Find(md_id);
            contexto.md_Medicos.Remove(medico);
            contexto.SaveChanges();
            return true;
        }
        

        #endregion
    }







}
