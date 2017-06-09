<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PriceMasterList.ascx.cs" Inherits="GrundFos.PriceManager.WebSite.ctrl.PriceMasterList" %>
<%@ Register Src="FiltersView.ascx" TagName="FiltersView" TagPrefix="uc1" %>
<%@ Register Src="Pager.ascx" TagName="Pager" TagPrefix="uc2" %>
 
    <uc1:FiltersView id="ucFilters" runat="server"></uc1:FiltersView>
       
    <div id="grid">
    
     <div class="actions">
            <span style="float:right">
            Registros por página:&nbsp;<asp:DropDownList id="ddlPageSize" runat="server" Font-Size="Small" Width="50px" AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged"></asp:DropDownList>
            </span>
            <asp:UpdatePanel ID="upMarked" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" >
            <Triggers>
            <asp:AsyncPostBackTrigger ControlID="grdItems" />
            </Triggers>
            <ContentTemplate>  
             <asp:PlaceHolder ID="phCreation" runat="server"></asp:PlaceHolder>          
            <ul runat="server" id="ulCheck">
                <li runat="server" id="MarkedAll" ><asp:LinkButton ID="lnkCheckAll" runat="server" Text="Marcar todos" OnClick="lnkCheckAll_Click"></asp:LinkButton></li>
                <li>|</li>
                <li runat="server" id="UnMarkedAll" ><asp:LinkButton ID="lnkUnCheckAll" runat="server" Text="Desmarcar todos" OnClick="lnkUnCheckAll_Click" Enabled="false"></asp:LinkButton></li>
            </ul>
            </ContentTemplate>
            </asp:UpdatePanel>
     </div>
     
    <asp:UpdatePanel ID="upGrid" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" >
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID="Pager1" />
    <asp:AsyncPostBackTrigger ControlID="lnkCheckAll" />
    <asp:AsyncPostBackTrigger ControlID="lnkUnCheckAll" />
    <asp:AsyncPostBackTrigger ControlID="ddlPageSize" />
    </Triggers>
        <ContentTemplate>
        
        <asp:GridView AllowPaging="false" CssClass="maingrid" AutoGenerateColumns="false" AllowSorting="true" ID="grdItems" runat="server">
             <Columns>
				<asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="chbSel" runat="server" AutoPostBack="true" OnCheckedChanged="grdItemsCheck_CheckedChanged" ValidationGroup='<%# DataBinder.Eval(Container, "DataItem.Id") %>' />
                    </ItemTemplate>
                    <ItemStyle CssClass="action" />
				</asp:TemplateField>
				
            </Columns>        
        </asp:GridView>
             
      </ContentTemplate>
     </asp:UpdatePanel>
     
     <div class="actions">      
     <span style="float: right" class="pager">
    <asp:UpdatePanel runat="server" ID="upPager" ChildrenAsTriggers="True" UpdateMode="Conditional">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddlPageSize" />              
    </Triggers>
    <ContentTemplate>                    
     <uc2:Pager ID="Pager1" runat="server" />
     </ContentTemplate>
     </asp:UpdatePanel>
     </span>
    <asp:UpdatePanel runat="server" ID="upMarkedCount" ChildrenAsTriggers="False" UpdateMode="Conditional">
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID="lnkCheckAll" />
    <asp:AsyncPostBackTrigger ControlID="lnkUnCheckAll" />
    <asp:AsyncPostBackTrigger ControlID="grdItems" />
    </Triggers>
    <ContentTemplate>            
     <span id="lblCount" runat="server"></span>
     </ContentTemplate>
     </asp:UpdatePanel>
     </div>

     <div class="actions">
    <asp:UpdatePanel runat="server" ID="upActions" ChildrenAsTriggers="True" UpdateMode="Conditional">
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID="lnkCheckAll" />
    <asp:AsyncPostBackTrigger ControlID="lnkUnCheckAll" />
    <asp:AsyncPostBackTrigger ControlID="grdItems" />
    </Triggers>
    <ContentTemplate>     
     <asp:PlaceHolder ID="plhActions" runat="server"></asp:PlaceHolder>
     </ContentTemplate>
     </asp:UpdatePanel>
     </div>
  </div>
</div>  <!--Comes from filter do not remove -->   
    
    <script language="javascript" type="text/javascript" src="/js/jquery.bgiframe.pack.js"></script>
    <script language="javascript" type="text/javascript" src="/js/UControlpricelist.js"></script>
    <script language="javascript" type="text/javascript" src="/js/pricelist-netajax.js"></script>
    <script language="javascript" type="text/javascript">

/**************************************************
JQUERY EVENTS TO LOAD JUST THE FIRST TIME PAGE LOAD
**************************************************/

function loadPage()
{
    if ("<% = Type %>" == "PriceGroupView")
    { 
        $(".maingrid td").not(".action").click(openChangePricePopup).css("cursor", "pointer");
        $(".maingrid td :image").click(openChangePricePopup);
    }
    else
        if("<% = Type %>" == "Import")
        {
            $(".maingrid td").not(".action").click(ImportModifyRedirect).css("cursor", "pointer");
            $(".maingrid td :image").click(ImportModifyRedirect);  
        }
        else
            if("<% = Type %>" == "AdminView")
            {
                $(".maingrid td").not(".action").click(AdminModifyProduct).css("cursor", "pointer");
                $(".maingrid td :image").click(AdminModifyProduct);  
            }
    $("#flip_filters").click(flip_filters);     
}

function AdminModifyProduct()
{
    var id = $(this).parents("tr").eq(0).attr("id").replace(/pp/,"");
    window.location = "addproduct.aspx?id=" + id;
}

function ImportModifyRedirect()
{
    var id = $(this).parents("tr").eq(0).attr("id").replace(/pp/,"");
    window.location = "details.aspx?id=" + id;
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

function openChangePricePopupTotal(ev) {
    $('div#price_change_mark').dialog('option','title','Modificación Masiva').dialog('open').parent().appendTo(jQuery("form:first"));
    $("#<% = txtModValor.ClientID%>").val("");
    $("#<% = txtModCTR.ClientID%>").val("");
    $("#<% = txtModValor.ClientID%>").focus();
    
}

function openAddSelectionPopup(ev) {
    $('div#add_selection').dialog('option','title','Elija Selección').dialog('open').parent().appendTo(jQuery("form:first"));
   if( $("#<%=ddlSelecciones.ClientID%>")[0].length == 1)
        ShowNewSelection();
}

function UnbindROUserClicks()
{
    $(".maingrid td :image").unbind('click');
    $(".maingrid td").not('.action').unbind('click');
}

function ShowNewSelection()
{
    $("#<%=ddlSelecciones.ClientID%>").val("0"); $("#new_selection").show();
    $("#choose_selection").hide();
    $("#<% = txtNewSelection.ClientID %>").focus(); 
}

function ShowChooseSelection()
{
    $("#<%=txtNewSelection.ClientID%>").val("");
    $("#choose_selection").show(); 
    $("#new_selection").hide();
}

function openAddCategoryPopup(ev) {
    $('div#add_category').dialog('option','title','Elija Categoría').dialog('open').parent().appendTo(jQuery("form:first"));
}

function openRemoveCategoryPopup(ev) {
    $('div#remove_from_category').dialog('option','title','Elija Categoría').dialog('open').parent().appendTo(jQuery("form:first"));
}

function openAddPricegoupPopup(ev) {
    $('div#add_to_pricegroup').dialog('option','title','Elija País').dialog('open').parent().appendTo(jQuery("form:first"));
}

function price_keypress(e)
{
    if (e.which == 46 || e.which == 190 || (e.which >= 48 && e.which <= 57)) 
    {
        if ($(this).attr("id") != "price_val")
            $("#price_val").val("");
            
        if ($(this).attr("id") != "price_pct")
            $("#price_pct").val("")
            
        if ($(this).attr("id") != "price_ctr")
            $("#price_ctr").val("");
            
        if ($(this).attr("id") != "<% = txtModValor.ClientID%>")
            $("#<% = txtModValor.ClientID%>").val("");
            
        if ($(this).attr("id") != "<% = txtModCTR.ClientID%>")
            $("#<% = txtModCTR.ClientID%>").val("");
    }
    else 
    {
        if (e.which == 13)
          {
            e.preventDefault();
            
            if($("#price_val").val()!="" || $("#price_pct").val() != "" || $("#price_ctr").val() != "" )
                saveData();
            else
               {
               $("#final_val").html("Ingrese alg&uacute;n valor.").css("color", "red"); 
               }
           }
    }
}

function closePopup(ev)
{
    $(".popup").dialog('close');
    
    $(":text","#price_change").val("");
    $("#final_val").text("");
    $("#<%=txtNewSelection.ClientID%>").val("");
    $("#<%=ddlSelecciones.ClientID%>").val("0");
}

</script>

    <div id="price_change_mark" class="popup">
            <fieldset>
              <div>
                <label for="price_pct">Valor (%)</label>
                <asp:TextBox ID="txtModValor" runat="server" MaxLength="7" autocomplete="off" CssClass="input pricefield" ></asp:TextBox>
              </div>
              <div>
                <label for="ctr">CTR (%)</label>
                      <asp:TextBox ID="txtModCTR" runat="server" MaxLength="7" autocomplete="off" TabIndex="1" CssClass="input pricefield" ></asp:TextBox>
              </div>
           <div style="text-align:center">
                  <asp:Button ID="btnUpdateChecked" runat="server" CssClass="button" Enabled="true" OnClick="btnUpdateChecked_Click" Text="Actualizar Marcados" TabIndex="2" Width="138px" />
                  &nbsp<a tabindex="3" class="close_popup">Cerrar</a>
              </div>   
           </fieldset>
    </div>

    <div id="price_change" class="popup">
            <fieldset>
              <div id="group_val">
                <label for="price">Valor:</label>
                <input type="text" name="price_val" maxlength="12" autocomplete="off" id="price_val" tabindex="1" class="input pricefield" />
                <span id="usd_val" class="message"></span>
               
              </div>

              <div>
                <label for="price_pct">Valor (%)</label>
                <input type="text" name="price_pct" id="price_pct" autocomplete="off" maxlength="7" tabindex="2" class="input pricefield"/>
              </div>

              <div>
                <label for="ctr">CTR (%)</label>
                <input type="text" name="price_ctr" id="price_ctr" autocomplete="off" maxlength="7" tabindex="3" class="input pricefield"/>
                <span id="ctr_val" class="message"></span>
              </div>
              
              <div id="group_result">
                <label>Precio Final:</label>
                <span id="final_val" class="result"></span>
            
              </div>

              <div style="text-align:center">
                  <input id="save_val" class="button" type="button" tabindex="4" value="Actualizar"/>&nbsp<a tabindex="5" class="close_popup">Cerrar</a>

              </div>
           
           </fieldset>
    </div>
 
    <div id="add_selection" class="popup">
        <fieldset id="choose_selection">
          <div>
            <label for="selection">Selecci&oacute;n:</label>
              <asp:DropDownList ID="ddlSelecciones" runat="server">
                  <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
              </asp:DropDownList>&nbsp<b><a id="do_new_selection">O cree una nueva...</a></b>
          </div>
        </fieldset>

        <fieldset id="new_selection" style="display:none">
          <div>
            <label for="description">Descripci&oacute;n:</label>
            <asp:TextBox ID="txtNewSelection" autocomplete="off" runat="server" ></asp:TextBox>&nbsp<b><a id="do_choose_selection">Seleccionar...</a></b>
          </div>
        </fieldset>
        <div style="text-align:center;margin-top:5px;">
            <asp:Button ID="btnAddToSelection" runat="server" Text="Actualizar" CausesValidation="false" CssClass="button" OnClick="btnAddToSelection_Click"/> &nbsp <a class="close_popup">Cerrar</a>
        </div> 

</div>  

    <div id="add_category" style="width:600px;" class="popup">
        <fieldset id="choose_category">
          <div>
            <label for="category"></label>
              <asp:DropDownList ID="ddlCategory" runat="server">
                  <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
              </asp:DropDownList><br />
           </div>
        </fieldset>
        
        <div style="text-align:center">
            <asp:Button ID="btnAddToCategory" runat="server" Text="Actualizar" CausesValidation="false" CssClass="button" OnClick="btnAddToCategory_Click" /> o <a class="close_popup" >Cerrar</a>
        </div>  
        
</div>

    <div id="remove_from_category" style="width:600px;" class="popup">
        <fieldset id="Fieldset1">
          <div>
            <label for="category"></label>
              <asp:DropDownList ID="ddlCategoryRemove" runat="server">
                  <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
              </asp:DropDownList><br />
           </div>
        </fieldset>
        
        <div style="text-align:center">
            <asp:Button ID="btnRemoveFromCategory" runat="server" Text="Borrar" CausesValidation="false" CssClass="button" OnClick="btnRemoveFromCategory_Click" /> o <a class="close_popup" >Cerrar</a>
        </div>  
        
    </div>
    
    <div id="add_to_pricegroup" style="width:600px;" class="popup">
        <fieldset id="choose_pricegroup">
          <div>
            <label for="pricegroup"></label>
              <asp:DropDownList ID="ddlPricegroup" runat="server">
                  <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
              </asp:DropDownList><br />
           </div>
        </fieldset>
        
        <div style="text-align:center">
            <asp:Button ID="btnAddToPricegroup" runat="server" Text="Actualizar" CausesValidation="false" CssClass="button" OnClick="btnAddToPriceGroup_Click" /> o <a class="close_popup" >Cerrar</a>
        </div>  
        
</div>
</div>
