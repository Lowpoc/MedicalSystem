<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmConsultarExame.aspx.cs" Inherits="MedicalSystems.frmConsultarExame" %>
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
                                <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
                                <li><i class="fa fa-table"></i>Auxliares</li>
                                <li><i class="" style="font-size:36px;"></i> Convênios</li>
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
                                                    <label>Filtro <span>Codigo</span></label>
                                                    <div class="form-control-clear-wrap">
                                                        <asp:TextBox ID="Codigo_filtro" CssClass="form-control" runat="server" BorderColor="black" ></asp:TextBox>
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
                                    <asp:GridView runat="server" DataSourceID="ObjectExame" AutoGenerateColumns="False" CssClass="table table-condensed" DataKeyNames="ex_id" EmptyDataText="<div class='col-md-12'><h4>Não Contem nenhum exame com as caracteristicas deste filtros</h1></div>" AllowPaging="True">
                                        <Columns>
                                            <asp:BoundField DataField="ex_id" HeaderText="Registro" SortExpression="ex_id"></asp:BoundField>
                                            <asp:BoundField DataField="ex_nome" HeaderText="Nome" SortExpression="ex_nome"></asp:BoundField>
                                            <asp:BoundField DataField="ex_codigo" HeaderText="Codigo" SortExpression="ex_codigo"></asp:BoundField>
                                            <asp:BoundField DataField="ex_observacoes" HeaderText="Observações" SortExpression="ex_observações"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Ações">
                                                <ItemTemplate>
                                                    <asp:LinkButton CommandName="Delete" runat="server" Height="38px"><i class=" glyphicon glyphicon-remove-sign" title="Remover" style="height: 38px; color: red"></i></asp:LinkButton>
                                                    <asp:LinkButton runat="server" ToolTip="Editar" PostBackUrl='<%# string.Format("~/frmCadastroExame.aspx?id={0}",Eval("ex_id"))%>'><i class="fa fa fa-book" title="Editar" style="height: 38px; color: chocolate"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <pagersettings mode="Numeric"
                                                       position="Bottom"           
                                                       pagebuttoncount="10"
                            
                                        />
                                        <pagerstyle 
                                            verticalalign="Bottom"
                                            horizontalalign="Center"
                                        />
                                    </asp:GridView>
                                </section>
                            </div>
                        </div>
                        <asp:ObjectDataSource ID="ObjectExame" runat="server" SelectMethod="ConsultarTodos" TypeName="MedicalSystems.controller.ExameController" DeleteMethod="RemoverExame" >
                            <DeleteParameters>
                                <asp:Parameter Name="ex_id" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Nome_filtro" PropertyName="Text" Name="ex_nome" Type="String"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="Codigo_filtro" PropertyName="Text" Name="ex_codigo" Type="String"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </form>
                </section>
            </section>
        </div>
    </div>

</asp:Content>
