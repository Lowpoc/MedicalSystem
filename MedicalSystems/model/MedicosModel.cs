using MedicalSystems.classes;
using MedicalSystems.conexao;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MedicalSystems.model
{
    public class MedicosModel : ConectDb
    {

        public  LinkedList<Medicos> consultarTodos(string md_nome,string md_crm)
        {
            LinkedList<Medicos> listaMedica = new LinkedList<Medicos>();
            this.OpenConcection();
            try
            {
                this.commad = new SqlCommand(@"SELECT * FROM md_Medicos
                                            WHERE (@nome is null or md_nome LIKE @nome)
                                            AND (@crm is null or md_crm LIKE @crm)

                ", this.connect);

                if (string.IsNullOrEmpty(md_nome))
                {
                    this.commad.Parameters.AddWithValue("@nome", DBNull.Value);
                }
                else
                {
                    this.commad.Parameters.AddWithValue("@nome","%"+md_nome+"%");
                }

                if (string.IsNullOrEmpty(md_crm))
                {
                    this.commad.Parameters.AddWithValue("@crm", DBNull.Value);
                }
                else
                {
                    this.commad.Parameters.AddWithValue("@crm","%"+md_crm+"%");
                }

                this.reader = this.commad.ExecuteReader();
                while (this.reader.Read())
                {
                    Medicos md = new Medicos();
                    md.md_nome = this.reader["md_nome"].ToString();
                    md.md_id = (int) this.reader["md_id"];
                    md.md_cpf = this.reader["md_cpf"].ToString();
                    md.md_crm = this.reader["md_crm"].ToString();
                    md.md_atendimentos_turnos = (int) this.reader["md_atendimentos_turnos"];
                    md.es_id = (int) this.reader["es_id"];
                    md.cidade_descricao = this.reader["cidade_descricao"].ToString();
                    md.md_endereco = this.reader["md_endereco"].ToString();
                    listaMedica.AddLast(md);
                }
                return listaMedica;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public  Boolean registrarMedicos(Medicos mdclass)
        {
            try
            {
                this.OpenConcection();

                this.commad = new SqlCommand(@"SELECT COUNT(md_nome) FROM md_Medicos
                WHERE md_cpf  = @validar or md_crm = @validar2");
                this.commad.Parameters.AddWithValue("@validar", mdclass.md_cpf);
                this.commad.Parameters.AddWithValue("@validar2", mdclass.md_crm);

                if(this.commad.ExecuteNonQuery() > 0 ){
                    return false;
                }

                this.commad = new SqlCommand(@"INSERT INTO 
                  md_Medicos(md_nome,md_cpf,md_crm,md_endereco,es_id,cidade_descricao,md_atendimentos_turnos)
                            VALUES(@MD_NOME,@MD_CPF,@MD_CRM,@MD_END,@ES_ID,@CID_DESC,@MD_ATEND)",this.connect);

                this.commad.Parameters.AddWithValue("@MD_NOME", mdclass.md_nome);
                this.commad.Parameters.AddWithValue("@MD_CPF", mdclass.md_cpf);
                this.commad.Parameters.AddWithValue("@MD_CRM", mdclass.md_crm);
                this.commad.Parameters.AddWithValue("@MD_END", mdclass.md_endereco);
                this.commad.Parameters.AddWithValue("@ES_ID", mdclass.es_id);
                this.commad.Parameters.AddWithValue("@CID_DESC", mdclass.cidade_descricao);
                this.commad.Parameters.AddWithValue("@MD_ATEND", mdclass.md_atendimentos_turnos);
                this.commad.ExecuteNonQuery();
                return true;

            }
            catch (Exception)
            {

                throw;
            }
            return false;

        }
    }
}