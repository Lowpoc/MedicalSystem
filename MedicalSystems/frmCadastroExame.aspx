﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmCadastroExame.aspx.cs" Inherits="MedicalSystems.frmCadastroExame" %>
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
                <form  runat="server">
                    <div class="row" style="display: none">
                        <div class="col-md-6" style="display: block">   
                            <div class="alert " id="msg" role="alert">
                                <strong>Cadastro Efetuado com sucesso.</strong>
                            </div>
                        </div>
                    </div>
                    <asp:FormView ID="formularioExames" runat="server" DataSourceID="ObjectExame" DataKeyNames="ex_id" DefaultMode="Insert" CssClass="form-horizontal">
                        <EditItemTemplate>
                            <asp:TextBox Text='<%# Bind("ex_id") %>' runat="server" ID="ex_idTextBox" CssClass="form-control" Visible="False" /><br />
                            <div class="form-group">
                                <label class="col-md-2 control-label">Nome</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("ex_nome") %>' runat="server" ID="ex_nomeTextBox" CssClass="form-control" /><br />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Telefone</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("ex_codigo") %>' runat="server" ID="ex_codigoTextBox" CssClass="form-control" /><br />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Observações</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("ex_observacoes") %>' runat="server" ID="ex_observacaoTextBox" CssClass="form-control"  TextMode="MultiLine"/><br />
                                </div>
                            </div>
                            <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn btn-info" />&nbsp;
                            <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn btn-danger" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Nome</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("ex_nome") %>' runat="server" CssClass="form-control" ID="ex_nomeTextBox" required /><br />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Codigo</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("ex_codigo") %>' runat="server" ID="ex_codigoTextBox" CssClass="form-control" /><br />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Observações</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("ex_observacoes") %>' runat="server" ID="ex_observacaoTextBox" CssClass="form-control"  TextMode="MultiLine"/><br />
                                </div>
                            </div>
                            <asp:LinkButton runat="server" Text="Cadastrar" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn btn-info" />&nbsp;
                            <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn  btn-danger" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            md_id:
                            <asp:Label Text='<%# Bind("ex_id") %>' runat="server" ID="md_idLabel" /><br />
                            md_nome:
                            <asp:Label Text='<%# Bind("ex_nome") %>' runat="server" ID="md_nomeLabel" /><br />
                            md_cpf:
                            <asp:Label Text='<%# Bind("ex_codigo") %>' runat="server" ID="md_cpfLabel" /><br />
                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;
                            <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="ObjectExame" runat="server" DataObjectTypeName="MedicalSystems.model.Exame" InsertMethod="CadastrarExame" SelectMethod="ConsultarTodos" TypeName="MedicalSystems.controller.ExameController" UpdateMethod="AtualizarExame" >
                        <SelectParameters>
                            <asp:Parameter Name="ex_nome" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ex_codigo" Type="String"></asp:Parameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </form>
            </div>
        </div>
    </div>

</asp:Content>
