<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FiltersView.ascx.cs" Inherits="GrundFos.PriceManager.WebSite.ctrl.FiltersView" %>
<%@ Import Namespace="PriceManager.Business.Filters"%>

<div class="page_header"> 
    <div class="page_header_links"> 
        <a id="flip_filters" class="linkButton">Ocultar Filtros</a>
    </div> 
  <h1>&nbsp</h1> 
</div>
        
<div class="content">
    
    <div id="filters">
        <div id="filterForm" class="box">
            <asp:Panel id="pnFiltros" runat="server" DefaultButton="btnSearch" ValidationGroup="Filters">
                <h1>Filtros</h1>
                <fieldset>
                    <asp:UpdatePanel ID="upFilters" ChildrenAsTriggers="false" UpdateMode="Conditional" runat="server">
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="lnkCleanFilters" />
                    </Triggers>
                    <ContentTemplate>
                    <asp:PlaceHolder ID="plhFilters" runat="server"></asp:PlaceHolder>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                </fieldset>
                
                <div style="clear:both; text-align:center;">
                    <asp:Button ID="btnSearch" runat="server" Text="Filtrar" ValidationGroup="Filters" CssClass="button" TabIndex="30" OnClick="btnSearch_Click" /> o <asp:LinkButton ID="lnkCleanFilters" Text="Limpiar" OnClick="lnkCleanFilters_Click" runat="server" />                            
                </div>
                    
              </asp:Panel>  
            </div>
    </div>
    
    <div id="filters_data" class="hideme">
        <div class="blankBar">
          <p><asp:Label CssClass="big" runat="server" ID="lblFilterText"></asp:Label>
          <asp:PlaceHolder ID="plhCurrentFilters" runat="server"></asp:PlaceHolder>
              &nbsp;
          </p>
        </div>
    </div>
    

    

