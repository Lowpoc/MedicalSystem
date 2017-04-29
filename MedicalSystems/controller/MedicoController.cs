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
            ctx.Medicos.Add(medicoClass);
            var retorno = ctx.SaveChanges();
            return retorno == 1 ? true : false;
        }
        #endregion

        #region SelecionarMedicos
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Medico> consultarComfiltros(string md_nome, string md_crm)
        {
            var contexto = Functions.retonarContexto();
            return contexto.Medicos
                .Where(p => (p.md_nome.Equals(md_nome) || md_nome == null) &&
                            (p.md_crm.Equals(md_crm) || md_crm == null))
                .ToList();
        }
        #endregion

        #region UpdateMedico
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void AtualizarMedico(Medico medicosClass)
        {
            var contexto = Functions.retonarContexto();
            contexto.Medicos.AddOrUpdate(medicosClass);
            contexto.SaveChanges();
        }

        #endregion

        #region RemoverMedico
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public bool RemoverMedico(Medico medico)
        {
            var contexto = Functions.retonarContexto();
            contexto.Medicos.Remove(medico);
            return true;
        }
        

        #endregion
    }







}
