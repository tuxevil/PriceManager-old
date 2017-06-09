<%@ Page Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="GrundFos.PriceManager.WebSite.admin.Importation.details" Title="Prices Manager Advanced - Importaci�n: Detalles" %>

<%@ Register Src="../../ctrl/Pager.ascx" TagName="Pager" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cplHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cplMain" runat="server">
    <div class="page_header"> 
        <div class="page_header_links"> 
            &nbsp;
        </div> 
      <h1>Informaci�n de Importaci�n</h1> 
    </div>

<div class="content">    
    <div id="form">
    <fieldset>
        <div id="filterForm" class="box">
                <h1>Detalle: <asp:Label ID="lblPriceImport" runat="server"></asp:Label></h1>
                <b>C�digo: </b><asp:Label ID="lblCod" runat="server"></asp:Label><br />
                <b>Archivo: </b><asp:Label ID="lblFile" runat="server"></asp:Label><br />
                <b>Usuario: </b><asp:Label ID="lblUser" runat="server"></asp:Label><br />
                <b>Fecha: </b><asp:Label ID="lblDate" runat="server"></asp:Label><br />
                <b>Estado: </b><asp:Label ID="lblStatus" runat="server"></asp:Label><br />
                
                
                <div style="text-align:center">
                
                </div>
        </div>
    </fieldset>
    </div>
    
    <div id="grid">
        <div class="actions">
            <span style="float:right">
                Registros por p�gina:&nbsp;<asp:DropDownList id="ddlPageSize" runat="server" Font-Size="Small" Width="50px" AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                <asp:ListItem Selected="True">10</asp:ListItem>
                <asp:ListItem>25</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                </asp:DropDownList>
            </span>
        </div>
        <div class="actions">
        <asp:UpdatePanel ID="upLinkButtons" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" >
        <ContentTemplate>
            <ul runat="server" id="ulCheck">
                <li runat="server" id="liAdd" ><asp:LinkButton ID="lnkAdd" runat="server" Text="Productos Nuevos" OnClick="lnkAdd_Click"></asp:LinkButton></li>
                <li>|</li>
                <li runat="server" id="liMod" ><asp:LinkButton ID="lnkMod" runat="server" Text="Productos a Modificar" OnClick="lnkMod_Click"></asp:LinkButton></li>
                <li>|</li>
                <li runat="server" id="liError" ><asp:LinkButton ID="lnkError" runat="server" Text="Productos con Errores" OnClick="lnkError_Click"></asp:LinkButton></li>
            </ul>
        </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        <br />
        <asp:UpdatePanel ID="upGrid" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" >
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Pager1" />
        <asp:AsyncPostBackTrigger ControlID="ddlPageSize" />
        <asp:AsyncPostBackTrigger ControlID="lnkAdd" />
        <asp:AsyncPostBackTrigger ControlID="lnkMod" />
        <asp:AsyncPostBackTrigger ControlID="lnkError" />
        </Triggers>
            <ContentTemplate>     
            <asp:Repeater ID="rpterPriceImportList" runat="server" >
                <HeaderTemplate>                
                        <table class="maingrid">
                        <thead>
                            <tr>
                                <th>C�digo Grundfos</th>
                                <th>C�digo Proveedor</th>
                                <th class="description">Modelo</th>
                                <th>Proveedor</th>
                                <th>Frecuencia</th>
                                <th>TP</th>
                                <th>GRP</th>
                                <th>PL</th>
                                <th>Cat1</th>
                                <th>Cat2</th>
                                <th>Cat3</th>
                                <th>Detalle</th>
                            </tr>
                        </thead><tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# DataBinder.Eval(Container, "DataItem.CodGrundfos") %></td>
                                <td class="description"><%# DataBinder.Eval(Container, "DataItem.CodProvider") %></td>
                                <td class="description" title="<%# DataBinder.Eval(Container, "DataItem.Description") %>"><%# DataBinder.Eval(Container, "DataItem.Model") %></td>
                                <td class="description"><%# DataBinder.Eval(Container, "DataItem.Provider") %></td>
                                <td><%# DataBinder.Eval(Container, "DataItem.Frequency") %></td>
                                <td><%# DataBinder.Eval(Container, "DataItem.TP") %></td>
                                <td><%# DataBinder.Eval(Container, "DataItem.GRP") %></td>
                                <td><%# DataBinder.Eval(Container, "DataItem.PL") %></td>
                                <td class="description"><%# DataBinder.Eval(Container, "DataItem.Cat1") %></td>
                                <td class="description"><%# DataBinder.Eval(Container, "DataItem.Cat2") %></td>
                                <td class="description"><%# DataBinder.Eval(Container, "DataItem.Cat3") %></td>
                                <td class="description"><%# DataBinder.Eval(Container, "DataItem.Detail") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                        </tbody></table>
                        </FooterTemplate>
                    </asp:Repeater>
            </ContentTemplate>
         </asp:UpdatePanel>
         
        <div class="actions">      
            <span style="float: right" class="pager">     
                <asp:UpdatePanel runat="server" ID="upPager" ChildrenAsTriggers="True" UpdateMode="Conditional" >
                <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlPageSize" />
                <asp:AsyncPostBackTrigger ControlID="lnkAdd" />
                <asp:AsyncPostBackTrigger ControlID="lnkMod" />
                <asp:AsyncPostBackTrigger ControlID="lnkError" />
                </Triggers>
                <ContentTemplate>                    
                    <uc1:Pager ID="Pager1" runat="server" /> 
                </ContentTemplate>
                </asp:UpdatePanel>
            </span>
            <asp:UpdatePanel runat="server" ID="UpdatePanel3" ChildrenAsTriggers="False" UpdateMode="Conditional">
            <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lnkAdd" />
            <asp:AsyncPostBackTrigger ControlID="lnkMod" />
            <asp:AsyncPostBackTrigger ControlID="lnkError" />
            </Triggers>
            <ContentTemplate>            <asp:Label ID="lblSelectedCount" runat="server" Text="0"></asp:Label>
                <asp:Label ID="lblQuantitystatus" runat="server" Text="Productos Nuevos"></asp:Label>
                listados.
             </ContentTemplate>
             </asp:UpdatePanel>
        </div>
        <div class="actions" style="text-align:center">
            <asp:Button ID="btnImport" runat="server" Text="Importar" CssClass="button" OnClick="btnImport_Click" /> o <asp:Button ID="btnErrorExport" CssClass="button" runat="server" Text="Exportar Errores" OnClick="btnErrorExport_Click" /> o <a class="close_popup" href="default.aspx">Volver</a><br />
                <asp:Label ID="lblError" runat="server" Visible="False" Font-Bold="True" Font-Size="Small" ForeColor="Red" ></asp:Label>
        </div>
    </div>
    
    
    </div>

    
            

    
    
    </asp:Content>
