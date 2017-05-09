<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmCadastrarConvenio.aspx.cs" Inherits="MedicalSystems.frmCadastrarConvenio" %>
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
                    <p id="subtitle" runat="server">Área para efetuar o registro do Convênios no sistema</p>
                </div>
                <form  runat="server">
                    <div class="row" style="display: none">
                        <div class="col-md-6" style="display: block">   
                            <div class="alert " id="msg" role="alert">
                                <strong>Cadastro Efetuado com sucesso.</strong>
                            </div>
                        </div>
                    </div>
                    <asp:FormView ID="formularioConvenio" runat="server" DataSourceID="ObjectConvenio" DataKeyNames="co_id" DefaultMode="Insert" CssClass="form-horizontal">
                        <EditItemTemplate>
                            <asp:TextBox Text='<%# Bind("co_id") %>' runat="server" ID="co_idTextBox" CssClass="form-control" Visible="False" /><br />
                            <div class="form-group">
                                <label class="col-md-2 control-label">Nome</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("co_nome") %>' runat="server" ID="co_nomeTextBox" CssClass="form-control" /><br />
                                    <asp:RequiredFieldValidator runat="server"
                                                                ControlToValidate="co_nomeTextBox" ID="validateNome" Display="Dynamic" ErrorMessage="Necessario preencher o campo nome"
                                                                CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" 
                                    >
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Telefone</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("co_telefone") %>' runat="server" ID="co_telefoneTextBox" CssClass="form-control" /><br />
                                    <asp:RequiredFieldValidator runat="server"
                                                                ControlToValidate="co_telefoneTextBox" ID="RequiredFieldValidator1" Display="Dynamic" ErrorMessage="Necessario preencher o telefone"
                                                                CssClass="alert alert-danger col-sm-5" SetFocusOnError="True"
                                    >
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn btn-info" />&nbsp;
                            <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn btn-danger" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Nome</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("co_nome") %>' runat="server" CssClass="form-control" ID="co_nomeTextBox" /><br />
                                    <asp:RequiredFieldValidator runat="server"
                                                                ControlToValidate="co_nomeTextBox" ID="validateNome" Display="Dynamic" ErrorMessage="Necessario preencher o campo nome"
                                                                CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" 
                                    >
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Telefone</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("co_telefone") %>' runat="server" ID="co_telefoneTextBox" CssClass="form-control" /><br />
                                    <asp:RequiredFieldValidator runat="server"
                                                                ControlToValidate="co_telefoneTextBox" ID="RequiredFieldValidator1" Display="Dynamic" ErrorMessage="Necessario preencher o telefone"
                                                                CssClass="alert alert-danger col-sm-5" SetFocusOnError="True"
                                    >
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <asp:LinkButton runat="server" Text="Cadastrar" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn btn-info" />&nbsp;
                            <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn  btn-danger" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            md_id:
                            <asp:Label Text='<%# Bind("co_id") %>' runat="server" ID="md_idLabel" /><br />
                            md_nome:
                            <asp:Label Text='<%# Bind("co_nome") %>' runat="server" ID="md_nomeLabel" /><br />
                            md_cpf:
                            <asp:Label Text='<%# Bind("co_telefone") %>' runat="server" ID="md_cpfLabel" /><br />
                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;
                            <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="ObjectConvenio" runat="server" DataObjectTypeName="MedicalSystems.model.Convenio" InsertMethod="CadastrarConvenio" SelectMethod="ConsultarTodos" TypeName="MedicalSystems.controller.ConvenioController" UpdateMethod="AtualizarConvenio">
                        <SelectParameters>
                            <asp:Parameter Name="co_nome" Type="String"></asp:Parameter>
                            <asp:Parameter Name="co_telefone" Type="String"></asp:Parameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
