<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmConsultarEspecialidade.aspx.cs" Inherits="MedicalSystems.WebForm2" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=17.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
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
                                                    <label>Filtro <span>Descricao</span></label>
                                                    <div class="form-control-clear-wrap">
                                                        <asp:TextBox ID="Descricao_filtro" CssClass="form-control" runat="server" BorderColor="black" ></asp:TextBox>
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
                                    <asp:ScriptManager runat="server" AjaxFrameworkMode="Enabled"  ></asp:ScriptManager>
                                    <asp:GridView runat="server" ID="gridEspecialidade" DataSourceID="ObjectEspecialidade" AutoGenerateColumns="False" CssClass="table table-condensed" DataKeyNames="esp_id" EmptyDataText="<div class='col-md-12'><h4>Não Contem nenhum exame com as caracteristicas deste filtros</h1></div>" AllowPaging="True">
                                        <Columns>
                                            <asp:BoundField DataField="esp_id" HeaderText="Registro" SortExpression="esp_id"></asp:BoundField>
                                            <asp:BoundField DataField="esp_nome" HeaderText="Nome" SortExpression="esp_nome"></asp:BoundField>
                                            <asp:BoundField DataField="esp_descricao" HeaderText="Descrição" SortExpression="esp_descricao"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Ações">
                                                <ItemTemplate>
                                                    <asp:LinkButton CommandName="Delete" ID="DeleteCommand" runat="server" Height="38px"><i class=" glyphicon glyphicon-remove-sign" title="Remover" style="height: 38px; color: red"></i></asp:LinkButton>
                                                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="DeleteCommand"
                                                                                       ConfirmText="Deseja realmente excluir este item?"   />
                                                    <asp:LinkButton runat="server" ToolTip="Editar" PostBackUrl='<%# string.Format("~/frm_CadastrarEspecialidade.aspx?id={0}",Eval("esp_id"))%>'><i class="fa fa fa-book" title="Editar" style="height: 38px; color: chocolate"></i></asp:LinkButton>
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
                        <asp:ObjectDataSource ID="ObjectEspecialidade" runat="server" SelectMethod="ConsultarTodos" TypeName="MedicalSystems.controller.EspecialidadeController" OnDeleting="ObjectEspecialidade_Deleting" OnDeleted="ObjectEspecialidade_Deleted" DeleteMethod="RemoverEspecialidade">
                            <DeleteParameters>
                                <asp:Parameter Name="esp_id" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Nome_filtro" PropertyName="Text" Name="esp_nome" Type="String"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="Descricao_filtro" PropertyName="Text" Name="esp_descricao" Type="String"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </form>
                </section>
            </section>
        </div>
    </div>
</asp:Content>
