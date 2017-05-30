<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmCadastroExame.aspx.cs" Inherits="MedicalSystems.frmCadastroExame" %>
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
                                    <asp:RequiredFieldValidator runat="server"
                                                                ControlToValidate="ex_nomeTextBox" ID="validateNome" Display="Dynamic" ErrorMessage="Necessario preencher o campo nome"
                                                                CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" 
                                    >
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Telefone</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("ex_codigo") %>' runat="server" ID="ex_codigoTextBox" CssClass="form-control" /><br />
                                    <asp:RequiredFieldValidator runat="server"
                                                                ControlToValidate="ex_codigoTextBox" ID="RequiredFieldValidator1" Display="Dynamic" ErrorMessage="Necessario preencher o campo codigo"
                                                                CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" 
                                    >
                                    </asp:RequiredFieldValidator>
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
                                    <asp:RequiredFieldValidator runat="server"
                                                                ControlToValidate="ex_nomeTextBox" ID="validateNome" Display="Dynamic" ErrorMessage="Necessario preencher o campo nome"
                                                                CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" 
                                    >
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Codigo</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("ex_codigo") %>' runat="server" ID="ex_codigoTextBox" CssClass="form-control" /><br />
                                    <asp:RequiredFieldValidator runat="server"
                                                                ControlToValidate="ex_codigoTextBox" ID="RequiredFieldValidator1" Display="Dynamic" ErrorMessage="Necessario preencher o campo codigo"
                                                                CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" 
                                    >
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Observações</label>
                                <div class="col-md-8">
                                    <asp:TextBox Text='<%# Bind("ex_observacoes") %>' runat="server" ID="ex_observacaoTextBox" CssClass="form-control"  TextMode="MultiLine"/><br />
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-md-2 control-label">Convenios</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="listConvenios" runat="server" DataSourceID="ObjectConvenios" DataTextField="co_nome" DataValueField="co_id" SelectedValue='<%# Bind("co_id") %>' CssClass="form-control" AppendDataBoundItems="True">
                                        <asp:ListItem Value="-1">Selecione Op&#231;&#227;o</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource runat="server" ID="ObjectConvenios" SelectMethod="ConsultarTodos" TypeName="MedicalSystems.controller.ConvenioController">
                                        <SelectParameters>
                                            <asp:Parameter Name="co_nome" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="co_telefone" Type="String"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:ObjectDataSource><br />
                                    <asp:LinkButton runat="server" Text="Adicionar"  ID="LinkButton1" CausesValidation="True" CssClass="btn btn-info" />&nbsp;
                                </div>
                            <asp:GridView runat="server" DataSourceID="ObjetoConvenios" AutoGenerateColumns="False" CssClass="table table-no-bordered" DataKeyNames="co_id" EmptyDataText="<div class='col-md-12'><h4>Não Contem nenhum Medico com as caracteristicas deste filtros</h1></div>" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="co_id" HeaderText="Registro" SortExpression="co_is"></asp:BoundField>
                                <asp:BoundField DataField="co_nome" HeaderText="Nome" SortExpression="co_nome"></asp:BoundField>
                                <asp:BoundField DataField="co_telefone" HeaderText="Telefone" SortExpression="co_telefone"></asp:BoundField>
                                <asp:TemplateField HeaderText="Ações">
                                    <ItemTemplate>
                                        <asp:LinkButton id="DeleteCommand" CommandName="Delete" runat="server" >
                                            <i class="fa fa-close" title="Remover" style="color: red;"></i>
                                        </asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <pagersettings mode="Numeric"
                                           position="Bottom"
                                           pagebuttoncount="10"/>

                            <pagerstyle
                                verticalalign="Bottom"
                                horizontalalign="Center"/>
                        </asp:GridView>
                    </div>
                </div>
                <asp:ObjectDataSource ID="ObjetoConvenios" runat="server" SelectMethod="ConsultarTodos" TypeName="MedicalSystems.controller.ConvenioController" DeleteMethod="RemoverConvenio">
                    <DeleteParameters>
                        <asp:Parameter Name="co_id" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:Parameter Name="co_nome" Type="String"></asp:Parameter>
                        <asp:Parameter Name="co_telefone" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
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
