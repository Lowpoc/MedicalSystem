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
    public class RequisicaoController
    {
            [DataObjectMethod(DataObjectMethodType.Select)]
            public List<Requisicao> ConsultarTodos(Int32 pa_id, Int32 co_id)
            {
                var contexto = Functions.retonarContexto();

                return contexto.req_Requisao.Where(p => (p.pa_id.Equals(pa_id) || p.pa_id == null) &&
                                                     p.data.Equals(co_id) || co_id == null).ToList();
            }


            [DataObjectMethod(DataObjectMethodType.Insert)]
            public bool CadastrarRequisicao(Requisicao requi)
            {
                var contexto = Functions.retonarContexto();
                contexto.req_Requisao.Add(requi);
                var retorno = contexto.SaveChanges();
                return retorno == 1 ? true : false;
            }

            [DataObjectMethod(DataObjectMethodType.Update)]
            public bool AtualizarRequisicao(Requisicao csConsulta)
            {
                var contexto = Functions.retonarContexto();
                contexto.req_Requisao.AddOrUpdate(csConsulta);
                var retorno = contexto.SaveChanges();
                return retorno == 1 ? true : false;
            }

            [DataObjectMethod(DataObjectMethodType.Delete)]
            public bool RemoverRequisicao(Int32 req_id)
            {
                var contexto = Functions.retonarContexto();
            Requisicao objRequiscao = contexto.req_Requisao.Find(req_id);
                contexto.req_Requisao.Remove(objRequiscao);
                var retorno = contexto.SaveChanges();
                return retorno == 1 ? true : false;
            }
        }
    }