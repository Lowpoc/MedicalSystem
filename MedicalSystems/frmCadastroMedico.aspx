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
                <h3>Cadastro</h3>
                <p>Área para efetuar o registro do médico no sistema</p>
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
                        md_id:
                        <asp:TextBox Text='<%# Bind("md_id") %>' runat="server" ID="md_idTextBox" /><br />
                        md_nome:
                        <asp:TextBox Text='<%# Bind("md_nome") %>' runat="server" ID="md_nomeTextBox" /><br />
                        md_cpf:
                        <asp:TextBox Text='<%# Bind("md_cpf") %>' runat="server" ID="md_cpfTextBox" /><br />
                        md_crm:
                        <asp:TextBox Text='<%# Bind("md_crm") %>' runat="server" ID="md_crmTextBox" /><br />
                        md_endereco:
                        <asp:TextBox Text='<%# Bind("md_endereco") %>' runat="server" ID="md_enderecoTextBox" /><br />
                        es_id:
                        <asp:TextBox Text='<%# Bind("es_id") %>' runat="server" ID="es_idTextBox" /><br />
                        cidade_descricao:
                        <asp:TextBox Text='<%# Bind("cidade_descricao") %>' runat="server" ID="cidade_descricaoTextBox" /><br />
                        md_atendimentos_turnos:
                        <asp:TextBox Text='<%# Bind("md_atendimentos_turnos") %>' runat="server" ID="md_atendimentos_turnosTextBox" /><br />
                        <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="form-group">
                        <label class="col-md-2 control-label">Nome</label>
                        <div class="col-md-8">
                            <asp:TextBox Text='<%# Bind("md_nome") %>' runat="server" CssClass="form-control" ID="md_nomeTextBox" /><br />
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
                        <label class="col-md-2 control-label">Endereço</label>
                        <div class="col-md-8">
                            <asp:TextBox Text='<%# Bind("md_endereco") %>' runat="server" ID="md_enderecoTextBox" CssClass="form-control" /><br />
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
                        <asp:TextBox Text='<%# Bind("md_atendimentos_turnos") %>' runat="server" ID="md_atendimentos_turnosTextBox" TextMode="number"  CssClass="form-control"/><br />
                            </div>
                        </div>
                        <div class="form-group">
                        <label class="col-md-2 control-label">Estados</label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="EstadosLista" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="ObjectEstado" DataTextField="es_nome" DataValueField="es_id" SelectedValue='<%# Bind("es_id") %>'>
                            </asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="ObjectEstado"  SelectMethod="Consultar" TypeName="MedicalSystems.controller.EstadoController"></asp:ObjectDataSource>
                        </div>
                        </div>
                        <asp:LinkButton runat="server" Text="Cadastrar" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;
                        <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
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
                <asp:ObjectDataSource ID="ObjectMedico" runat="server" DataObjectTypeName="MedicalSystems.model.Medico"  SelectMethod="consultarComfiltros" TypeName="MedicalSystems.controller.MedicoController" UpdateMethod="AtualizarMedico" InsertMethod="registrar">
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
               
<%--                <input   value="" Visible="False"  runat="server" id="confir" />
                <%
                    if (!String.IsNullOrEmpty(confir.Value))
                    {
                        Response.Write(@"<div class='alert alert-success fade in' id='respostaMsg'><i class='fa fa-info-circle'></i> Cadastro Efetuado com sucesso!</div>'");
                    }
                %>;
                <div class="form-group">
                    <label class="col-md-2 control-label">Nome</label>
                    <div class="col-md-8">
                        <input type="text" runat="server"  name="md_nome" id="nome" class="form-control" required="required"   />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">CPF</label>
                    <div class="col-md-8">
                        <input type="text" runat="server"  name="md_cpf" id="cpf" class="form-control" required="required"   />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">CRM</label>
                    <div class="col-md-8">
                        <input type="text" runat="server"  name="md_crm" id="crm" class="form-control" required="required"   />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">Endereço</label>
                    <div class="col-md-8">
                         <input type="text" runat="server"  name="md_endereco" id="endereco"  class="form-control" required="required"   />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">Cidade</label>
                    <div class="col-md-8">
                        <input type="text" runat="server"  name="cidade_descricao" id="cidade" class="form-control" required="required"   />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">Turnos</label>
                    <div class="col-md-8">
                         <input type="number" runat="server"  name="md_turno" class="form-control" id="turno" required="required"   />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-8">
                        <div class="checkbox">
                            <input type="checkbox" id="check_1" checked="">
                            <label for="check_1">Check me up</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">Estados</label>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ListaDeEstados" runat="server" AppendDataBoundItems="true" CssClass="form-control " >
                            <asp:ListItem Text="Selecione uma opção" Value="-1"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-8">
                        <asp:Button runat="server" OnClick="Cadastrar" CssClass="btn btn-info" Text="Cadastrar"/>
                    </div>
                    <div class="col-md-2 col-md-8">
                        <asp:Button runat="server" OnClick="Cancelar" CssClass="btn btn-danger" Text="Cancelar"/>
                    </div>
                </div>--%>
     
<%--    <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-file-text-o"></i>Área Médica</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.aspx">Pagina Inicial</a></li>
						<li><i class="icon_document_alt"></i>Cadastro</li>
						<li><i class="fa fa-file-text-o"></i>Medicos</li>
					</ol>
				</div>
			</div>
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                             Cadastro Médico
                          </header>
                          <div class="panel-body">
                              <form class="form-horizontal col-lg-10"  runat="server">
                
                                  <div class="form-group">
                                             <label class="col-sm-2 control-label">Nome</label>
                                                <div class="col-sm-10">
                                                    <input type="text" runat="server"  name="md_nome" id="nome" class="form-control" required="required"   />
                                                </div>
                                         </div>
                                          <div class="form-group">
                                             <label class="col-sm-2 control-label">Cpf</label>
                                                <div class="col-sm-10">
                                                    <input type="text" runat="server"  name="md_cpf" id="cpf" class="form-control" required="required"   />
                                                </div>
                                         </div>
                                         <div class="form-group">
                                             <label class="col-sm-2 control-label">CRM</label>
                                                <div class="col-sm-10">
                                                    <input type="text" runat="server"  name="md_crm" id="crm" class="form-control" required="required"   />
                                                </div>
                                         </div>
                                         <div class="form-group">
                                             <label class="col-lg-2 control-label">Endereço   </label>
                                                <div class="col-sm-10">
                                                    <input type="text" runat="server"  name="md_endereco" id="endereco"  class="form-control" required="required"   />
                                                </div>
                                         </div>    
                                          <div class="form-group">
                                             <label class="col-sm-2 control-label">Cidade</label>
                                                <div class="col-sm-10">
                                                    <input type="text" runat="server"  name="cidade_descricao" id="cidade" class="form-control" required="required"   />
                                                </div>
                                         </div>
                                          <div class="form-group">
                                             <label class="col-md-2 Control-label">Nº  Por Turno:</label>
                                                <div class="col-sm-10">
                                                    <input type="number" runat="server"  name="md_turno" class="form-control" id="turno" required="required"   />
                                                </div>
                                         </div>
                                          <div class="form-group">
                                               <label class="col-sm-2 control-label">Estado</label>
                                              <div class="col-lg-4">
                                                  <asp:DropDownList ID="ListaDeEstados" runat="server" AppendDataBoundItems="true" CssClass="form-control " >
                                                      <asp:ListItem Text="Selecione uma opção" Value="-1"></asp:ListItem>
                                                  </asp:DropDownList>
                                              </div>

                              </form>
                          </div>
                      </section>--%>
    
</asp:Content>



