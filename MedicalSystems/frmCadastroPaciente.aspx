<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmCadastroPaciente.aspx.cs" Inherits="MedicalSystems.frmCadastroPaciente" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dev-page-content" style="height: 1503px;">                    
    <!-- page content container -->
    <div class="container">
                        
        <!-- page title -->
        <div class="page-title">
            <h1></h1>
                            
            <ul class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">Clientes</a></li>
                <li>Pacientes</li>
            </ul>
        </div>                        
        <!-- ./page title -->                        
                        
        <!-- Horizontal Form -->
        <div class="wrapper wrapper-white">
            <div class="page-subtitle">
                <h3 id="Titulo" runat="server" >Cadastro</h3>
                <p id="subtitle" runat="server">Área para efetuar o registro do pacientes no sistema</p>
            </div>
                            
            <form class="form-horizontal" runat="server">
                <asp:FormView ID="formularioPaciente" runat="server" DataSourceID="ObjectPaciente" DefaultMode="Insert" DataKeyNames="pa_id" EmptyDataText="<h1>Não encontrou niguem!!</h1>">
                    <EditItemTemplate>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Nome</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("pa_nome") %>' runat="server" ID="pa_nomeTextBox" CssClass="form-control" /><br />
                                <asp:RequiredFieldValidator runat="server"
                                                            ControlToValidate="pa_nomeTextBox" ID="validateNome" Display="Dynamic" ErrorMessage="Necessario preencher o campo nome"
                                                            CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" 
                                >
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">CPF</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("pa_cpf") %>' runat="server" ID="pa_cpfTextBox" CssClass="form-control" /><br />
                                <asp:RequiredFieldValidator runat="server"
                                                            ControlToValidate="pa_cpfTextBox" ID="RequiredFieldValidator1" Display="Dynamic" ErrorMessage="Necessario preencher o cpf"
                                                            CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" 
                                >
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Estados</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="ListaDeEstados" runat="server" AppendDataBoundItems="true" CssClass="form-control " SelectedValue='<%# Bind("es_id") %>' DataSourceID="ObjectEstado" DataTextField="es_nome" DataValueField="es_id">
                                    <asp:ListItem Text="Selecione uma opção" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator  ValidationGroup="g1" SetFocusOnError="True"  ControlToValidate="ListaDeEstados" ID="RequiredFieldValidator5"
                                                             CssClass="alert alert-danger col-sm-5" ErrorMessage="Por favor selecione um estado"
                                                             InitialValue="-1"  runat="server"  Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Planos</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="ListaPlanos" runat="server" AppendDataBoundItems="true" CssClass="form-control " SelectedValue='<%# Bind("pl_id") %>' DataSourceID="ObjectPlano" DataTextField="pl_nome" DataValueField="pl_id">
                                    <asp:ListItem Text="Selecione uma opção" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator  ValidationGroup="g2" SetFocusOnError="True"  ControlToValidate="ListaPlanos" ID="RequiredFieldValidator6"
                                                             CssClass="alert alert-danger col-sm-5" ErrorMessage="Por favor selecione um plano"
                                                             InitialValue="-1"  runat="server"  Display="Dynamic">
                                </asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Cidade</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("cidade_descricao") %>' runat="server" ID="cidade_descricaoTextBox" CssClass="form-control" /><br />
                                <asp:RequiredFieldValidator runat="server"
                                                            ControlToValidate="cidade_descricaoTextBox" ID="RequiredFieldValidator2" Display="Dynamic" ErrorMessage="Necessario preencher o cidade"
                                                            CssClass="alert alert-danger col-sm-5" SetFocusOnError="True"
                                >
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Telefone</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("pa_telefone") %>' runat="server" ID="pa_telefoneTextBox" CssClass="form-control" /><br />
                                <asp:RequiredFieldValidator runat="server"
                                                            ControlToValidate="pa_telefoneTextBox" ID="RequiredFieldValidator3" Display="Dynamic" ErrorMessage="Necessario preencher o telefone"
                                                            CssClass="alert alert-danger col-sm-5" SetFocusOnError="True"
                                >
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                        <label class="col-md-2 control-label">Aniversário</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("pa_data_aniversario", "{0:d}") %>' runat="server" ID="pa_data_aniversarioTextBox" CssClass="form-control" TextMode="DateTime" /><br />
                            <asp:RequiredFieldValidator runat="server"
                                                        ControlToValidate="pa_data_aniversarioTextBox" ID="RequiredFieldValidator4" Display="Dynamic" ErrorMessage="Necessario preencher o campo"
                                                        CssClass="text-danger" SetFocusOnError="True"
                            >
                            </asp:RequiredFieldValidator>
                                <div>
                                </div>
                        <div class="form-group">
                            <div class="col-sm-4">
                                <div class="radio">
                                    <asp:RadioButtonList ID="Sexos" runat="server"></asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn btn-info" />&nbsp;
                        <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn btn-danger" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="form-group">
                        <label class="col-md-2 control-label">Nome</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("pa_nome") %>' runat="server" ID="pa_nomeTextBox" CssClass="form-control" /><br />
                                <asp:RequiredFieldValidator runat="server"
                                                            ControlToValidate="pa_nomeTextBox" ID="validateNome" Display="Dynamic" ErrorMessage="Necessario preencher o campo nome"
                                                            CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" 
                                >
                                </asp:RequiredFieldValidator>
                              </div>
                        </div>
                        <div class="form-group">
                        <label class="col-md-2 control-label">CPF</label>
                        <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("pa_cpf") %>' runat="server" ID="pa_cpfTextBox" CssClass="form-control" /><br />
                            <asp:RequiredFieldValidator runat="server"
                                                        ControlToValidate="pa_cpfTextBox" ID="RequiredFieldValidator1" Display="Dynamic" ErrorMessage="Necessario preencher o cpf"
                                                        CssClass="alert alert-danger col-sm-5" SetFocusOnError="True" 
                            >
                            </asp:RequiredFieldValidator>
                        </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Estados</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="ListaDeEstados" runat="server" AppendDataBoundItems="true" ValidationGroup="g1"  CssClass="form-control " SelectedValue='<%# Bind("es_id") %>' DataSourceID="ObjectEstado" DataTextField="es_nome" DataValueField="es_id">
                                    <asp:ListItem Text="Selecione uma opção" Value="-1"></asp:ListItem>
                                  
                                </asp:DropDownList> <br/>
                                <asp:RequiredFieldValidator  ValidationGroup="g1" SetFocusOnError="True"  ControlToValidate="ListaDeEstados" ID="RequiredFieldValidator5"
                                                             CssClass="alert alert-danger col-sm-5" ErrorMessage="Por favor selecione um estado"
                                                            InitialValue="-1"  runat="server"  Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Planos</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="ListaPlanos" runat="server" ValidationGroup="g2" AppendDataBoundItems="true" CssClass="form-control " SelectedValue='<%# Bind("pl_id") %>' DataSourceID="ObjectPlano" DataTextField="pl_nome" DataValueField="pl_id">
                                    <asp:ListItem Text="Selecione uma opção" Value="-1"></asp:ListItem>
                                </asp:DropDownList></br>
                                <asp:RequiredFieldValidator  ValidationGroup="g2" SetFocusOnError="True"  ControlToValidate="ListaPlanos" ID="RequiredFieldValidator6"
                                                             CssClass="alert alert-danger col-sm-5" ErrorMessage="Por favor selecione um plano"
                                                             InitialValue="-1"  runat="server"  Display="Dynamic">
                                </asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Cidade</label>
                        <div class="col-md-8">
                            <asp:TextBox Text='<%# Bind("cidade_descricao") %>' runat="server" ID="cidade_descricaoTextBox" CssClass="form-control" /><br />
                            <asp:RequiredFieldValidator runat="server"
                                                        ControlToValidate="cidade_descricaoTextBox" ID="RequiredFieldValidator2" Display="Dynamic" ErrorMessage="Necessario preencher o cidade"
                                                        CssClass="alert alert-danger col-sm-5" SetFocusOnError="True"
                            >
                            </asp:RequiredFieldValidator>
                         </div>
                        </div>
                        <div class="form-group">
                        <label class="col-md-2 control-label">Telefone</label>
                        <div class="col-md-8">
                        <asp:TextBox Text='<%# Bind("pa_telefone") %>' runat="server" ID="pa_telefoneTextBox" CssClass="form-control" /><br />
                            <asp:RequiredFieldValidator runat="server"
                                                        ControlToValidate="pa_telefoneTextBox" ID="RequiredFieldValidator3" Display="Dynamic" ErrorMessage="Necessario preencher o telefone"
                                                        CssClass="alert alert-danger col-sm-5" SetFocusOnError="True"
                            >
                            </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        <div class="form-group">
                        <label class="col-md-2 control-label">Aniversário</label>
                            <div class="col-md-8">
                                <asp:TextBox Text='<%# Bind("pa_data_aniversario", "{0:G}") %>' runat="server" ID="pa_data_aniversarioTextBox" CssClass="form-control" TextMode="DateTime" /><br />
                            <asp:RequiredFieldValidator runat="server"
                                                        ControlToValidate="pa_data_aniversarioTextBox" ID="RequiredFieldValidator4" Display="Dynamic" ErrorMessage="Necessario preencher o campo"
                                                        CssClass="text-danger" SetFocusOnError="True"
                            >
                            </asp:RequiredFieldValidator>
                            <div>
                        </div>
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <div class="radio">
                                        <asp:RadioButtonList ID="Sexos" runat="server"></asp:RadioButtonList> <br/>
                                        <asp:RequiredFieldValidator runat="server"
                                                                    ControlToValidate="Sexos" ID="RequiredFieldValidator7" Display="Dynamic" ErrorMessage="Necessario escolher um sexo"
                                                                    CssClass="text-danger" SetFocusOnError="True"
                                        >
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>   
                        <asp:LinkButton runat="server" Text="Cadastrar" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn btn-info" />&nbsp;
                        <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn btn-danger" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        pa_id:
                        <asp:Label Text='<%# Bind("pa_id") %>' runat="server" ID="pa_idLabel" /><br />
                        pa_nome:
                        <asp:Label Text='<%# Bind("pa_nome") %>' runat="server" ID="pa_nomeLabel" /><br />
                        pa_cpf:
                        <asp:Label Text='<%# Bind("pa_cpf") %>' runat="server" ID="pa_cpfLabel" /><br />
                        es_id:
                        <asp:Label Text='<%# Bind("es_id") %>' runat="server" ID="es_idLabel" /><br />
                        cidade_descricao:
                        <asp:Label Text='<%# Bind("cidade_descricao") %>' runat="server" ID="cidade_descricaoLabel" /><br />
                        pa_telefone:
                        <asp:Label Text='<%# Bind("pa_telefone") %>' runat="server" ID="pa_telefoneLabel" /><br />
                        pa_data_aniversario:
                        <asp:Label Text='<%# Bind("pa_data_aniversario") %>' runat="server" ID="pa_data_aniversarioLabel" /><br />
                        pl_id:
                        <asp:Label Text='<%# Bind("pl_id") %>' runat="server" ID="pl_idLabel" /><br />
                        pl_Planos:
                        <asp:Label Text='<%# Bind("pl_Planos") %>' runat="server" ID="pl_PlanosLabel" /><br />
                        <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="ObjectPaciente" runat="server" DataObjectTypeName="MedicalSystems.model.Paciente" InsertMethod="CadastrarPaciente" SelectMethod="ConsultarComFiltros" TypeName="MedicalSystems.controller.PacienteController" UpdateMethod="AtualizarPaciente" OnInserting="CheckSexo">
                    <SelectParameters>
                        <asp:Parameter Name="pa_nome" Type="String"></asp:Parameter>
                        <asp:Parameter Name="pa_cpf" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectEstado" runat="server"  SelectMethod="Consultar" TypeName="MedicalSystems.controller.EstadoController"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectPlano" runat="server"  SelectMethod="consultaPlanos" TypeName="MedicalSystems.controller.PlanoController"></asp:ObjectDataSource>
            </form>
        </div>
    </div>
  </div>
</asp:Content>
