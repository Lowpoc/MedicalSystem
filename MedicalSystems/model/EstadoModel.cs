using MedicalSystems.classes.contexto;
using MedicalSystems.conexao;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MedicalSystems.model
{
    public class EstadoModel : ConectDb
    {
        //public LinkedList<Estado> consultarTodosEstados()
        //{
        //    LinkedList<Estado> listaESTADO = new LinkedList<Estado>();
        //    try
        //    {
        //        this.OpenConcection();
        //        this.commad = new SqlCommand(@"SELECT * FROM es_Estados", this.connect);
        //        this.reader = this.commad.ExecuteReader();
        //        while (this.reader.Read())
        //        {
        //            Estado est = new Estado();
        //            est.es_id = (int) this.reader["es_id"];
        //            est.Es_nome = this.reader["es_nome"].ToString();
        //            est.es_sigla = this.reader["es_sigla"].ToString();
        //            listaESTADO.AddLast(est);
        //        }
        //        return listaESTADO;
        //    }
        //    catch (Exception)
        //    {

        //    }
        //    return listaESTADO;
        //}
    }
}