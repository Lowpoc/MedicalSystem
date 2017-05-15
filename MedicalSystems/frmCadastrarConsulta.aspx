<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmCadastrarConsulta.aspx.cs" Inherits="MedicalSystems.frmCadastrarConsulta" %>
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
                    <p id="subtitle" runat="server">Área para efetuar o registro de Consulta Medica no sistema</p>
                </div>
                <form  runat="server">
                    <div class="row" style="display: none">
                        <div class="col-md-6" style="display: block">   
                            <div class="alert " id="msg" role="alert">
                                <strong>Cadastro Efetuado com sucesso.</strong>
                            </div>
                        </div>
                    </div>
                    <asp:FormView ID="formularioConsulta" runat="server" DataSourceID="ObjectConsulta" DataKeyNames="cs_id" DefaultMode="Insert" CssClass="form-horizontal">
                        <EditItemTemplate>
                            <asp:TextBox Text='<%# Bind("cs_id") %>' runat="server" ID="ex_idTextBox" CssClass="form-control" Visible="False" /><br />
                            <div class="form-group">
                                <label class="col-md-2 control-label">Nome</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("cs_nome") %>' runat="server" ID="ex_nomeTextBox" CssClass="form-control" /><br />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Telefone</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("cs_data") %>' runat="server" ID="ex_codigoTextBox" CssClass="form-control" /><br />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Observações</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("cs_observacao") %>' runat="server" ID="ex_observacaoTextBox" CssClass="form-control"  TextMode="MultiLine"/><br />
                                </div>
                            </div>
                            <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn btn-info" />&nbsp;
                            <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn btn-danger" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Paciente</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="listaPaciente" runat="server" DataSourceID="ObjectPaciente" DataTextField="pa_nome" DataValueField="pa_id"  SelectedValue='<%# Bind("pa_id") %>' CssClass="form-control" AppendDataBoundItems="True">
                                        <asp:ListItem Value="-1" Selected="True">Selecione Op&#231;&#227;o</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource runat="server" ID="ObjectPaciente"  SelectMethod="ConsultarComFiltros" TypeName="MedicalSystems.controller.PacienteController">
                                        <SelectParameters>
                                            <asp:Parameter Name="pa_nome" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="pa_cpf" Type="String"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Médico</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="listaMedico" runat="server" CssClass="form-control" DataSourceID="ObjectMedico" DataTextField="md_nome" DataValueField="md_id" SelectedValue='<%# Bind("md_id") %>' AppendDataBoundItems="True">
                                        <asp:ListItem Value="-1" Selected="True">Selecione Op&#231;&#227;o</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectMedico" runat="server"  SelectMethod="consultarComfiltros" TypeName="MedicalSystems.controller.MedicoController">
                                        <SelectParameters>
                                            <asp:Parameter Name="md_nome" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="md_crm" Type="String"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Convênio</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="listaConvenio" runat="server" CssClass="form-control" DataSourceID="ObjectConvenio" DataTextField="co_nome" DataValueField="co_id" SelectedValue='<%# Bind("co_id") %>' AppendDataBoundItems="True">
                                        <asp:ListItem Value="-1" Selected="True">Selecione Op&#231;&#227;o</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource runat="server" ID="ObjectConvenio"  SelectMethod="ConsultarTodos" TypeName="MedicalSystems.controller.ConvenioController">
                                        <SelectParameters>
                                            <asp:Parameter Name="co_nome" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="co_telefone" Type="String"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Data da Consulta  </label>
                                <div class="col-lg-8">
                                 <asp:Calendar ID="dataConsulta" SelectedDate='<%# Bind("cs_data") %>'  runat="server" ></asp:Calendar>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Turnos</label>
                                <div class="col-md-2 col-sm-offset-1">
                                    <div class="form-group-sm">
                                        <div class="radio radio-inline">
                                            <asp:RadioButtonList ID="Turnos" runat="server"></asp:RadioButtonList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Situação</label>
                                <div class="col-md-2 col-sm-offset-1">
                                    <div class="form-group-sm">
                                        <div class="radio radio-inline">
                                            <asp:RadioButtonList ID="Situacao" runat="server"></asp:RadioButtonList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Nome</label>
                                <div class="col-offset-2 col-md-8">
                                    <asp:TextBox Text='<%# Bind("cs_nome") %>'  runat="server" ID="TextBox1" CssClass="form-control" /><br />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Medicamentos</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("cs_observacao") %>' runat="server" ID="ex_observacaoTextBox" CssClass="form-control"  TextMode="MultiLine"/><br />
                                </div>
                            </div>
                            
                            <asp:LinkButton runat="server" Text="Cadastrar" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn btn-info" />&nbsp;
                            <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn  btn-danger" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            md_id:
                            <asp:Label Text='<%# Bind("cs_id") %>' runat="server" ID="md_idLabel" /><br />
                            md_nome:
                            <asp:Label Text='<%# Bind("cs_nome") %>' runat="server" ID="md_nomeLabel" /><br />
                            md_cpf:
                            <asp:Label Text='<%# Bind("cs_observacao") %>' runat="server" ID="md_cpfLabel" /><br />
                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;
                            <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="ObjectConsulta" runat="server" DataObjectTypeName="MedicalSystems.model.Consulta" InsertMethod="CadastrarExame" SelectMethod="ConsultarTodos" TypeName="MedicalSystems.controller.ConsultaController" UpdateMethod="AtualizarExame" >
                        <SelectParameters>
                            <asp:Parameter Name="cs_nome" Type="String"></asp:Parameter>
                            <asp:Parameter Name="cs_data" Type="String"></asp:Parameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
