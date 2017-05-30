using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using MedicalSystems.classes;
using System.Data.Entity;
using MedicalSystems.classes.contexto;
using MedicalSystems.model;
using MedicalSystems.controller;

namespace MedicalSystems
{
    public partial class frmCadastroMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
                if (Request.QueryString["id"] == null)
                {
                    formularioMedico.ChangeMode(FormViewMode.Insert);
                    ((DropDownList)formularioMedico.FindControl("Turnos")).DataSource =
                        Enum.GetNames(typeof(TurnoEnum));
                    ((DropDownList)formularioMedico.FindControl("Turnos")).DataBind();
                }
                else
                {
                    formularioMedico.ChangeMode(FormViewMode.Edit);
                    Titulo.InnerText = "Atualizando Médico";
                    subtitle.InnerText = "Área para atualizar os dados do Médico.";
                    ((DropDownList)formularioMedico.FindControl("Turnos")).DataSource =
                        Enum.GetNames(typeof(TurnoEnum));
                    ((DropDownList)formularioMedico.FindControl("Turnos")).DataBind();
                }
            }

        }

        protected void InserirMedico(object sender, EventArgs e)
        {

            
        }

        protected void Cadastrar(object sender, EventArgs e)
        {
            //Medico md = new Medico();
            //MedicoController mdControl = new MedicoController();
            //md.md_nome = nome.Value;
            //md.md_crm = crm.Value;
            //md.md_endereco = endereco.Value;
            //md.md_cpf = cpf.Value;
            //md.es_id = (Int32)ListaDeEstados.SelectedIndex;
            //md.md_atendimentos_turnos = Convert.ToInt32(turno.Value);
            //md.cidade_descricao = cidade.Value;
            //if (mdControl.registrar(md))
            //{
            //    confir.Value= "Cadastrado";
            //    this.ClearCampos();
            //}
            //else
            //{
            //    Response.Write(@"<script type='text/javascript'>
            //         $('#respostaMsg').attr('class','alert alert-block alert-danger fade in');
            //         $('#respostaMsg').text('Falha ao cadastrar');
            //         $('#respostaMsg').show();
            //    </script>");
            //}
        }

        protected void Cancelar(object sender, EventArgs e)
        {
            Medico md = new Medico();
        }

        private void ClearCampos()
        {
            //nome.Value = "";
            //crm.Value = "";
            //endereco.Value = "";
            //cpf.Value = "";
            //ListaDeEstados.SelectedIndex = -1;
            //turno.Value = "";
            //cidade.Value = "";

        }

        protected void formularioMedico_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               Functions.carregarLista("estado", ((DropDownList)sender));
            }
        }


        protected void ObjectMedico_OnInserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            ((Medico) e.InputParameters[0]).md_atendimentos_turnos = (int) Enum.Parse(typeof(TurnoEnum),((DropDownList)formularioMedico.FindControl("Turnos")).SelectedValue);
            ((Medico)e.InputParameters[0]).esp_id = ((DropDownList)formularioMedico.FindControl("Especialidade")).SelectedIndex;
        }
    }
}