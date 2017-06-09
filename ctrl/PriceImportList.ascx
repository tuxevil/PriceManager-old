<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PriceImportList.ascx.cs" Inherits="GrundFos.PriceManager.WebSite.ctrl.PriceImportList" %>
<%@ Register Src="FiltersView.ascx" TagName="FiltersView" TagPrefix="uc1" %>
<%@ Register Src="Pager.ascx" TagName="Pager" TagPrefix="uc2" %>
 
    <uc1:FiltersView id="ucFilters" runat="server"></uc1:FiltersView>
       
    <div id="grid">
    
     <div class="actions">
            <span style="float:right">
            Registros por página:&nbsp;<asp:DropDownList id="ddlPageSize" runat="server" Font-Size="Small" Width="50px" AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged"></asp:DropDownList>
            </span>
     </div>
     <br/>
    <asp:UpdatePanel ID="upGrid" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" >
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID="Pager1" />
    <asp:AsyncPostBackTrigger ControlID="ddlPageSize" />
    <asp:AsyncPostBackTrigger ControlID="ucFilters" />
    </Triggers>
        <ContentTemplate>     
     <asp:Repeater ID="rpterProductList" runat="server" OnItemDataBound="rpterProductList_ItemDataBound">
            <HeaderTemplate>                
                    <table class="maingrid">
                    <thead>
                        <tr>
                            <th class="description">Descripción</th>
                            <th>Archivo</th>
                            <th>Usuario</th>
                            <th>Nuevos</th>
                            <th>Modificados</th>
                            <th>Errores</th>
                            <th>Fecha</th>
                            <th>Estado</th>
                        </tr>
                    </thead><tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr id='<%# "pp" + DataBinder.Eval(Container, "DataItem.Id").ToString() %>'>
                            <td class="description" onclick="<%# "location.href = 'details.aspx?id=" + DataBinder.Eval(Container, "DataItem.Id").ToString() + "';"%>"><%# DataBinder.Eval(Container, "DataItem.Description") %></td>
                            <td onclick="<%# "location.href = 'details.aspx?id=" + DataBinder.Eval(Container, "DataItem.Id").ToString() + "';"%>"><%# DataBinder.Eval(Container, "DataItem.File") %></td>
                            <td onclick="<%# "location.href = 'details.aspx?id=" + DataBinder.Eval(Container, "DataItem.Id").ToString() + "';"%>"><%# DataBinder.Eval(Container, "DataItem.User") %></td>
                            <td onclick="<%# "location.href = 'details.aspx?id=" + DataBinder.Eval(Container, "DataItem.Id").ToString() + "';"%>"><%# DataBinder.Eval(Container, "DataItem.Newregs") %></td>
                            <td onclick="<%# "location.href = 'details.aspx?id=" + DataBinder.Eval(Container, "DataItem.Id").ToString() + "';"%>"><%# DataBinder.Eval(Container, "DataItem.Modregs") %></td>
                            <td onclick="<%# "location.href = 'details.aspx?id=" + DataBinder.Eval(Container, "DataItem.Id").ToString() + "';"%>"><%# DataBinder.Eval(Container, "DataItem.Errorregs") %></td>
                            <td onclick="<%# "location.href = 'details.aspx?id=" + DataBinder.Eval(Container, "DataItem.Id").ToString() + "';"%>"><%# Convert.ToDateTime(DataBinder.Eval(Container, "DataItem.DateImported")).ToShortDateString() %></td>
                            <td id="tdStatus" onclick="<%# "location.href = 'details.aspx?id=" + DataBinder.Eval(Container, "DataItem.Id").ToString() + "';"%>"><%# DataBinder.Eval(Container, "DataItem.ImportStatus")%></td>
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
    <asp:UpdatePanel runat="server" ID="upPager" ChildrenAsTriggers="True" UpdateMode="Conditional">
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID="ddlPageSize" />  
    <asp:AsyncPostBackTrigger ControlID="ucFilters" />            
    </Triggers>
    <ContentTemplate>                    
     <uc2:Pager ID="Pager1" runat="server" />
     </ContentTemplate>
     </asp:UpdatePanel>
     </span>
    <asp:UpdatePanel runat="server" ID="UpdatePanel3" ChildrenAsTriggers="False" UpdateMode="Conditional">
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID="rpterProductList" />
    <asp:AsyncPostBackTrigger ControlID="ucFilters" />
    </Triggers>
    <ContentTemplate>            
     Registros <strong><asp:Label ID="lblSelectedCount" runat="server" Text="0"></asp:Label></strong> listados.</span>
     </ContentTemplate>
     </asp:UpdatePanel>
     </div>
    
    <div>
       <a href="/admin/Importation/new.aspx">Subir Nuevo Archivo</a>
    </div>
     
  </div>
</div>  <!--Comes from filter do not remove -->   
    
    
<script language="javascript" type="text/javascript">

/**************************************************
JQUERY EVENTS TO LOAD JUST THE FIRST TIME PAGE LOAD
**************************************************/

$(document).ready(function() {
    $(".maingrid tr").hover(markOverRow, markOverRow);
    $("#flip_filters").click(flip_filters);     
});

function markOverRow(ev) 
{
    if ($(this).hasClass("over"))
        $(this).removeClass("over");
    else
        $(this).addClass("over");
}

function flip_filters()
{
    if ($("#flip_filters").text() == "Ocultar Filtros")
    {
        $("#filters").hide();
        $("#filters_data").animate({
              "opacity": "show"
            }, "slow");
        $("#flip_filters").text("Mostrar Filtros");
    }
    else 
    {
        $("#filters").animate({
              "opacity": "show"
            }, "slow");
        $("#filters_data").hide();
        $("#flip_filters").text("Ocultar Filtros");
    }
}

</script>
    
    </div>