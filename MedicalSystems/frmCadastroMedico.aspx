<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmCadastroMedico.aspx.cs" Inherits="MedicalSystems.frmCadastroMedico" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dev-page-content" style="height: 1503px;">                    
    <!-- page content container -->
    <div class="container">
                        
        <!-- page title -->
        <div class="page-title">
            <ul class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">Cadastro Médicos</a></li>
                <li>Médicos</li>
            </ul>
        </div>                        
        <!-- ./page title -->                           
                        
        <!-- Horizontal Form -->
        <div class="wrapper wrapper-white">
            <div class="page-subtitle">
                <h3 id="Titulo"  runat="server">Cadastro</h3>
                <p id="subtitle" runat="server">Área para efetuar o registro do médico no sistema</p>
            </div>
            <form  runat="server">
                <div class="row" style="display: none">
                <div class="col-md-6" style="display: block">   
                    <div class="alert " id="msg" role="alert">
                        <strong>Cadastro Efetuado com sucesso.</strong>
                    </div>
                </div>
                </div>
                <asp:FormView ID="formularioMedico" runat="server" DataSourceID="ObjectMedico" DataKeyNames="md_id" DefaultMode="Insert" CssClass="form-horizontal">
                    <EditItemTemplate>
                        <asp:TextBox Text='<%# Bind("md_id") %>' runat="server" ID="md_idTextBox" CssClass="form-control" Visible="False" /><br />
                        <div class="form-group">
                            <label class="col-md-2 control-label">Nome</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("md_nome") %>' runat="server" ID="md_nomeTextBox" CssClass="form-control" /><br />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">CPF</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("md_cpf") %>' runat="server" ID="md_cpfTextBox" CssClass="form-control" /><br />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">CRM</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("md_crm") %>' runat="server" ID="md_crmTextBox" CssClass="form-control" /><br />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Cidade</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("md_endereco") %>' runat="server" ID="md_enderecoTextBox" CssClass="form-control" /><br />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Estados</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="EstadosLista" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="ObjectEstado" DataTextField="es_nome" DataValueField="es_id" SelectedValue='<%# Bind("es_id") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource runat="server" ID="ObjectEstado" SelectMethod="Consultar" TypeName="MedicalSystems.controller.EstadoController"></asp:ObjectDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Cidade</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("cidade_descricao") %>' runat="server" ID="cidade_descricaoTextBox" CssClass="form-control" /><br />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Turnos</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="Turnos" runat="server" CssClass="form-control"></asp:DropDownList>
                               <%-- <asp:TextBox Text='<%# Bind("md_atendimentos_turnos") %>' runat="server" ID="md_atendimentos_turnosTextBox" CssClass="form-control" /><br />--%>
                            </div>
                        </div>
                        <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn btn-info" />&nbsp;
                        <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn btn-danger" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Nome</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("md_nome") %>' runat="server" CssClass="form-control" ID="md_nomeTextBox" required /><br />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">CPF</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("md_cpf") %>' runat="server" ID="md_cpfTextBox" CssClass="form-control" required /><br />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">CRM</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("md_crm") %>' runat="server" ID="md_crmTextBox" CssClass="form-control" required /><br />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Endereço</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("md_endereco") %>' runat="server" ID="md_enderecoTextBox" CssClass="form-control" required /><br />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Cidade</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("cidade_descricao") %>' runat="server" ID="cidade_descricaoTextBox" CssClass="form-control" /><br />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Turnos</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="Turnos" runat="server" CssClass="form-control"></asp:DropDownList>
                                <%--<asp:TextBox Text='<%# Bind("md_atendimentos_turnos") %>' runat="server" ID="md_atendimentos_turnosTextBox" TextMode="number"  CssClass="form-control"/><br />--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Estados</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="EstadosLista" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="ObjectEstado" DataTextField="es_nome" DataValueField="es_id" SelectedValue='<%# Bind("es_id") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource runat="server" ID="ObjectEstado" SelectMethod="Consultar" TypeName="MedicalSystems.controller.EstadoController"></asp:ObjectDataSource>
                            </div>
                        </div>
                        <asp:LinkButton runat="server" Text="Cadastrar" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn btn-info" />&nbsp;
                        <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn  btn-danger" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        md_id:
                        <asp:Label Text='<%# Bind("md_id") %>' runat="server" ID="md_idLabel" /><br />
                        md_nome:
                        <asp:Label Text='<%# Bind("md_nome") %>' runat="server" ID="md_nomeLabel" /><br />
                        md_cpf:
                        <asp:Label Text='<%# Bind("md_cpf") %>' runat="server" ID="md_cpfLabel" /><br />
                        md_crm:
                        <asp:Label Text='<%# Bind("md_crm") %>' runat="server" ID="md_crmLabel" /><br />
                        md_endereco:
                        <asp:Label Text='<%# Bind("md_endereco") %>' runat="server" ID="md_enderecoLabel" /><br />
                        es_id:
                        <asp:Label Text='<%# Bind("es_id") %>' runat="server" ID="es_idLabel" /><br />
                        cidade_descricao:
                        <asp:Label Text='<%# Bind("cidade_descricao") %>' runat="server" ID="cidade_descricaoLabel" /><br />
                        md_atendimentos_turnos:
                        <asp:Label Text='<%# Bind("md_atendimentos_turnos") %>' runat="server" ID="md_atendimentos_turnosLabel" /><br />
                        es_Estados:
                        <asp:Label Text='<%# Bind("es_Estados") %>' runat="server" ID="es_EstadosLabel" /><br />
                        <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;
                        <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                    </ItemTemplate>

                </asp:FormView>
                <asp:ObjectDataSource ID="ObjectMedico" runat="server" DataObjectTypeName="MedicalSystems.model.Medico"  SelectMethod="consultarComfiltros" TypeName="MedicalSystems.controller.MedicoController" UpdateMethod="AtualizarMedico" InsertMethod="registrar" OnInserting="ObjectMedico_OnInserting">
                    <SelectParameters>
                        <asp:Parameter Name="md_nome" Type="String"></asp:Parameter>
                        <asp:Parameter Name="md_crm" Type="String"></asp:Parameter>
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="medicoClass" Type="Object"/>
                    </InsertParameters>
                </asp:ObjectDataSource>
            </form>
        </div>
    </div>
</div>
</asp:Content>



