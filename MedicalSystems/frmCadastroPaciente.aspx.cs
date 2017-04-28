using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MedicalSystems.classes.contexto;

namespace MedicalSystems
{
    public partial class frmCadastroPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Functions.carregarLista("Estado",ListaDeEstados);
                Functions.carregarLista("plano", ListaPlanos);
                Functions.generateRadioButtonList('M',Masculino);
                Functions.generateRadioButtonList('F',Feminino);
            }
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
            //    confir.Value = "Cadastrado";
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
            //Medico md = new Medico();
            this.ClearCampos();
        }

        private void ClearCampos()
        {
            nome.Value = "";
            telefone.Value = "";
            endereco.Value = "";
            cpf.Value = "";
            ListaDeEstados.SelectedIndex = -1;
            data.Value = "";
            cidade.Value = "";

        }
    }
}