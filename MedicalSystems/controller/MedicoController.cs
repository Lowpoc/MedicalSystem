using MedicalSystems.classes;
using MedicalSystems.classes.contexto;
using MedicalSystems.model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MedicalSystems.controller
{
    [DataObject(true)]
    public class MedicoController
    {

        public bool registrar(Medico medicoClass)
        {
            var ctx = new MedicalSystemEntities();
            ctx.Medicos.Add(medicoClass);
            var retorno = ctx.SaveChanges();

            return retorno == 1 ? true : false;
        }


        [DataObjectMethod(DataObjectMethodType.Select)]
        public LinkedList<Medicos> consultarComfiltros(string md_nome, string md_crm)
        {
            LinkedList<Medicos> lista = new LinkedList<Medicos>();
            MedicosModel model = new MedicosModel();
            return model.consultarTodos(md_nome, md_crm);
        }
    }







}
