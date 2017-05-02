<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmConsultarPaciente.aspx.cs" Inherits="MedicalSystems.frmConsultarPaciente" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dev-page-content" >                    
        <!-- page content container -->
        <div class="container">
            <section id="main-content">
                <section class="wrapper">
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="page-header"><i class="fa fa-table" style="font-size:30px;"></i> Lista</h3>
                            <ol class="breadcrumb">
                                <li><i class="fa fa-home"></i><a href="index.aspx">Home</a></li>
                                <li><i class="fa fa-table"></i>Profissão</li>
                                <li><i class="fa fa-user-md" style="font-size:36px;"></i> Pacientes</li>
                            </ol>
                        </div>
                    </div>
                    <form runat="server">
                        <div class="row">
                            <div class="col-sm-6">
                                <section>
                                    <div class="form-group-one-unit">
                                        <div class="row">
                                            <div class="col-md-12">                        
                                                <div class="form-group form-group-custom form-control-clear">
                                                    <label>Filtro <span>Nome</span></label>
                                                    <div class="form-control-clear-wrap">
                                                        <asp:TextBox ID="Nome_filtro" CssClass="form-control" runat="server" BorderColor="black" ></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">                        
                                                <div class="form-group form-group-custom form-control-clear">
                                                    <label>Filtro <span>CPf</span></label>
                                                    <div class="form-control-clear-wrap">
                                                        <asp:TextBox ID="cpf_filtro" CssClass="form-control" runat="server" BorderColor="black" ></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <span class="help-block">Campos disponíveis para filtros</span>
                                            <div class="col-md-6">
                                                <asp:LinkButton runat="server" CommandName="consultarComfiltros" CssClass="btn btn-warning" Text="Consultar"></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <header class="panel-heading">
                                        <h1>Listagem</h1>
                                    </header>
                                    <asp:GridView runat="server" DataSourceID="ObjectPaciente" DataKeyNames="pa_id" AutoGenerateColumns="False" CssClass="table table-condensed" EmptyDataText="<div class='col-md-12'><h4>Não Contem nenhum Paciente com as caracteristicas deste filtros</h1></div>" AllowPaging="True">
                                        <Columns>
                                            <asp:BoundField DataField="pa_nome" HeaderText="Nome" SortExpression="pa_nome"></asp:BoundField>
                                            <asp:BoundField DataField="pa_cpf" HeaderText="CPF" SortExpression="pa_cpf"></asp:BoundField>
                                            <asp:BoundField DataField="es_Estados.es_nome" HeaderText="Estado" SortExpression="es_id"></asp:BoundField>
                                            <asp:BoundField DataField="cidade_descricao" HeaderText="Cidade" SortExpression="cidade_descricao"></asp:BoundField>
                                            <asp:BoundField DataField="pa_telefone" HeaderText="Telefone" SortExpression="pa_telefone"></asp:BoundField>
                                            <asp:BoundField DataField="pa_data_aniversario" HeaderText="Data Aniversário" SortExpression="pa_data_aniversario"></asp:BoundField>
                                            <asp:BoundField DataField="pa_sexo" HeaderText="Sexo" SortExpression="pa_sexo"></asp:BoundField>
                                            <asp:BoundField DataField="pl_Planos.pl_nome" HeaderText="Plano" SortExpression="pl_id"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Ações">
                                                <ItemTemplate>
                                                    <asp:LinkButton CommandName="Delete" runat="server" Height="38px"><i class=" glyphicon glyphicon-remove-sign" title="Remover" style="height: 38px; color: red"></i></asp:LinkButton>
                                                    <asp:LinkButton runat="server" ToolTip="Editar" PostBackUrl='<%# string.Format("~/frmCadastroPaciente.aspx?id={0}",Eval("pa_id"))%>'><i class="fa fa fa-book" title="Editar" style="height: 38px; color: chocolate"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerSettings Mode="Numeric"
                                            Position="Bottom"
                                            PageButtonCount="10" />

                                        <PagerStyle
                                            VerticalAlign="Bottom"
                                            HorizontalAlign="Center" />
                                    </asp:GridView>
                                </section>
                            </div>
                        </div>
                        <asp:ObjectDataSource ID="ObjectPaciente" runat="server" SelectMethod="consultarComfiltros" TypeName="MedicalSystems.controller.PacienteController" DeleteMethod="RemoverPaciente" >
                            <DeleteParameters>
                                <asp:Parameter Name="pa_id" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Nome_filtro" PropertyName="Text" Name="pa_nome" Type="String"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="cpf_filtro" PropertyName="Text" Name="pa_cpf" Type="String"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </form>
                </section>
            </section>
        </div>
    </div>
</asp:Content>
