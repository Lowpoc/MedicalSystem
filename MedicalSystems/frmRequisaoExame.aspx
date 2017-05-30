<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmRequisaoExame.aspx.cs" Inherits="MedicalSystems.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="dev-page-content" style="height: 1503px;">                    
        <!-- page content container -->
        <div class="container">
                        
            <!-- page title -->
            <div class="page-title">
                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Cadastro Médicos</a></li>
                    <li>Convênios</li>
                </ul>
            </div>                        
            <!-- ./page title -->                           
                        
            <!-- Horizontal Form -->
            <div class="wrapper wrapper-white">
                <div class="page-subtitle">
                    <h3 id="Titulo"  runat="server">Cadastro</h3>
                    <p id="subtitle" runat="server">Área para efetuar o registro de Exames no sistema</p>
                </div>
<form id="form" runat="server">
    <span runat="server" ID="funcaoPagina" class="ks-text">Requisicao Exame</span>
<asp:FormView ID="formularioRequisicao" runat="server" DataSourceID="ObjectRequisicao" DataKeyNames="req_id" DefaultMode="Insert">
<EditItemTemplate>
    <asp:TextBox Text='<%# Bind("RequisicaoId") %>' runat="server" ID="md_idTextBox" CssClass="form-control" Visible="False"/><br/>
    <div class="form-group ">
        <div class="col-md-6">
            <label class="col-md-2 form-control-label">Paciente</label>
            <div class="col-md-10">
                <asp:DropDownList ID="Lista" runat="server" AppendDataBoundItems="True" CssClass="form-control" style="width: 100%;" DataSourceID="listaPaciente" DataTextField="Nome" DataValueField="PacienteId" SelectedValue='<%# Bind("PacienteId") %>'>
                    <asp:ListItem Text="Selecione uma opção" Value="-1"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="Lista" ID="RequiredFieldValidator15" Display="Dynamic" ErrorMessage="Selecione um estado"
                                            CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" InitialValue="-1">
                </asp:RequiredFieldValidator>
                <asp:ObjectDataSource runat="server" ID="listaPaciente" SelectMethod="ObterPacientes" TypeName="WebCLI.Infra.Repositorio.PlanoSaudeRepositorio"></asp:ObjectDataSource>
            </div>
        </div>
        <div class="col-md-6 form-inline">
            <label class="col-md-2 form-control-label">Exame</label>
            <div class="col-md-10">
                <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="True" CssClass="form-control" style="width: 100%;" DataSourceID="listaExames" DataTextField="Nome" DataValueField="PacienteId" SelectedValue='<%# Bind("PacienteId") %>'>
                    <asp:ListItem Text="Selecione uma opção" Value="-1"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="DropDownList4" ID="RequiredFieldValidator1" Display="Dynamic" ErrorMessage="Selecione um estado"
                                            CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" InitialValue="-1">
                </asp:RequiredFieldValidator>
                <asp:ObjectDataSource runat="server" ID="listaExames" SelectMethod="ObterPacientes" TypeName="WebCLI.Infra.Repositorio.PlanoSaudeRepositorio"></asp:ObjectDataSource>
            </div>
        </div>
    </div>
    <div class="form-group form-inline">
        <div class="col-md-6 form-inline">
            <label class="col-md-2 form-control-label">Data Aniversário</label>
            <div class="col-md-10">
                <asp:TextBox Text='<%# Bind("DataExame", "{0:G}") %>' runat="server" ID="TextBox5" CssClass="form-control" TextMode="Date" /><br />
                <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="pa_data_aniversarioTextBox" ID="RequiredFieldValidator3" Display="Dynamic" ErrorMessage="Necessario preencher o campo"
                                            CssClass="text-danger" SetFocusOnError="True"
                >
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="col-md-6 form-inline">
            <label class="col-md-2 form-control-label">Observações</label>
            <div class="col-md-10">
                <asp:RadioButtonList ID="particularConvenio" runat="server" CssClass="ks-radio" RepeatLayout="Flow" AutoPostBack="true" >
                                    <asp:ListItem Text="Particular" Value="Particular"/>
                                    <asp:ListItem Text="Convênio" Value="Convenio"/>
                </asp:RadioButtonList>
            </div>
        </div>
    </div>
    <div class="form-group form-inline">
        <div class="col-md-6 form-inline">
            <label class="col-md-2 form-control-label">Valor</label>
            <div class="col-md-10">
                <asp:TextBox Text='<%# Bind("Valor") %>' runat="server" ID="Cidade" CssClass="form-control" style="width: 100%;"/><br/>
            </div>
        </div>
        <div class="col-md-6 form-inline">
            <label class="col-md-2 form-control-label">Convênio</label>
            <div class="col-md-10">
                <asp:DropDownList ID="Turnos" runat="server" CssClass="form-control" DataSourceID="listaPlanoSaude" AppendDataBoundItems="True" style="width: 100%;" DataTextField="Nome" DataValueField="PlanoSaudeId" >
                    <asp:ListItem Text="Selecione uma opção" Value="-1" Selected="True"></asp:ListItem>
                </asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="listaPlanoSaude" TypeName="WebCLI.Infra.Repositorio.PlanoSaudeRepositorio" SelectMethod="ObterTodos"></asp:ObjectDataSource>
            </div>
        </div>
    </div>
    <br/>
    <div class="text-center">
        <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn btn-info"/>
    </div>
</EditItemTemplate>
<InsertItemTemplate>
    <div class="form-group form-inline">
        <div class="col-md-6 form-inline">
            <label class="col-md-2 form-control-label">Paciente</label>
            <div class="col-md-10">
                <asp:DropDownList ID="listaPacientes" runat="server" AppendDataBoundItems="True" CssClass="form-control" Style="width: 100%;" DataSourceID="ObjPaciente" DataTextField="pa_nome" DataValueField="pa_id" SelectedValue='<%# Bind("pa_id") %>'>
                    <asp:ListItem Text="Selecione uma opção" Value="-1"></asp:ListItem>
                </asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="ObjPaciente"  SelectMethod="ConsultarComFiltros" TypeName="MedicalSystems.controller.PacienteController">
                    <SelectParameters>
                        <asp:Parameter Name="pa_nome" Type="String"></asp:Parameter>
                        <asp:Parameter Name="pa_cpf" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="col-md-6 form-inline">
            <label class="col-md-2 form-control-label">Exame</label>
            <div class="col-md-10">
                <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="True" CssClass="form-control" Style="width: 100%;" DataSourceID="ObjectExame" DataTextField="ex_nome" DataValueField="ex_id" SelectedValue='<%# Bind("PacienteId") %>'>
                    <asp:ListItem Text="Selecione uma opção" Value="-1"></asp:ListItem>
                </asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="ObjectExame"  SelectMethod="ConsultarTodos" TypeName="MedicalSystems.controller.ExameController">
                    <SelectParameters>
                        <asp:Parameter Name="ex_nome" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ex_codigo" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
    <div class="form-group form-inline">
        <div class="col-md-6 form-inline">
            <label class="col-md-2 form-control-label">Data</label>
            <div class="col-md-10">
                <asp:TextBox Text='<%# Bind("DataExame", "{0:G}") %>' runat="server" ID="TextBox5" CssClass="form-control" TextMode="Date" /><br />
            </div>
        </div>
        <div class="col-md-6 ">
            <label class="col-md-2 form-control-label">Observações</label>
            <div class="col-md-10">
                <asp:RadioButtonList ID="particularConvenio" runat="server" CssClass="ks-radio" RepeatLayout="Flow" >
                                    <asp:ListItem Text="Particular" Value="Particular"/>
                                    <asp:ListItem Text="Convênio" Value="Convenio"/>
                </asp:RadioButtonList>
            </div>
        </div>
    </div>
    <div class="form-group form-inline">
        <div class="col-md-6 form-inline">
            <label class="col-md-2 form-control-label">Valor</label>
            <div class="col-md-10">
                <asp:TextBox Text='<%# Bind("Valor") %>' runat="server" ID="dinheiro" CssClass="form-control" style="width: 100%;"/><br/>
            </div>
        </div>
        <div class="col-md-6 form-inline">
            <label class="col-md-2 form-control-label">Convênio</label>
            <div class="col-md-10">
                <asp:DropDownList ID="Convenios" runat="server" CssClass="form-control" DataSourceID="ObjectConvenio" AppendDataBoundItems="True" Style="width: 100%;" DataTextField="co_nome" DataValueField="co_id">
                    <asp:ListItem Text="Selecione uma opção" Value="-1" Selected="True"></asp:ListItem>
                </asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="ObjectConvenio"  SelectMethod="ConsultarTodos" TypeName="MedicalSystems.controller.ConvenioController">
                    <SelectParameters>
                        <asp:Parameter Name="co_nome" Type="String"></asp:Parameter>
                        <asp:Parameter Name="co_telefone" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="Convenios" ID="RequiredFieldValidator6" Display="Dynamic" ErrorMessage="Selecione um Convenios"
                                            CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" InitialValue="-1">
                </asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
    <br/>
    <div class="text-center">
        <asp:LinkButton runat="server" Text="Cadastrar" CommandName="Insert" ID="InsertButton" CausesValidation="false" CssClass="btn btn-info"/>
    </div>
</InsertItemTemplate>
<ItemTemplate>
</ItemTemplate>
</asp:FormView>
    </form>
    <asp:ObjectDataSource ID="ObjectRequisicao" runat="server" DataObjectTypeName="MedicalSystems.model.Requisicao" InsertMethod="CadastrarRequisicao" OldValuesParameterFormatString="original_{0}" SelectMethod="ConsultarTodos" TypeName="MedicalSystems.controller.RequisicaoController" UpdateMethod="AtualizarRequisicao">
        <SelectParameters>
            <asp:Parameter Name="pa_id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="co_id" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
