<%@ Page Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="GrundFos.PriceManager.WebSite.admin.Products.addproduct" Title="Price Manager - Agregar Producto" %>
<%@ Register Src="~/ctrl/PagerSelections.ascx" TagName="PagerSelections" TagPrefix="uc2" %>
<%@ Register Src="~/ctrl/Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplHead" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cplMain" runat="server">
   <div class="page_header"> 
       <h1>Agregar Producto</h1> 
   </div>
                
   <div class="content" >
     <div id="prodcut" runat="server" style="height:270px;"> 
        <div id="productForm" class="box" style="width:44%; float:left; height:230px;">
           <h1>Producto</h1>
               <div class="form">
                <fieldset style="float:left; width:40%;">
                  <div><label>Código</label><asp:TextBox ID="txtCode" MaxLength="50" runat="server" Width="200px" TabIndex="1"></asp:TextBox></div>
                  <div><label>Descripción</label><asp:TextBox ID="txtDescripcion" runat="server" MaxLength="1024" Width="201px" TabIndex="2"></asp:TextBox></div>
                  <div><label>Modelo</label><asp:TextBox ID="txtModel" runat="server" MaxLength="1024" Width="201px" TabIndex="2"></asp:TextBox></div>
                  <div><label>Proveedor</label><asp:TextBox ID="txtProvider" runat="server" MaxLength="1024" Width="201px" Enabled="false" TabIndex="2"></asp:TextBox><asp:DropDownList runat="server" ID="ddlProvider" Visible="false"></asp:DropDownList></div>
                </fieldset>
               </div>
               <div>
               <fieldset style="float:right;">
                  <div><asp:RadioButtonList ID="rblProductType" runat="server" AutoPostBack="false" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">50 Hz</asp:ListItem>
                        <asp:ListItem Value="2">60 Hz</asp:ListItem>
                        <asp:ListItem Value="3">50/60 Hz</asp:ListItem>
                    </asp:RadioButtonList>&nbsp;</div>
                  <div><label runat="server" id="lblOthersProv">Otros Proveedores</label><asp:ListBox ID="lstProviders" Enabled="false" runat="server"></asp:ListBox></div>
               </fieldset>
               </div>
            <fieldset>
              <asp:Label ID="lblError" runat="server" Visible="false"  ForeColor="Red" ></asp:Label>
            </fieldset>
     </div>
     <div id="priceForm" class="box" style="height:230px; width:55%; float:right;">
                      <h1>Precio:</h1>
                      <div class="form">
                         <fieldset style="float:right; width:50%;">
                          <div><label >Compra(TP)</label><asp:TextBox ID="txtPricePurchase" Height="18px" runat="server" Width="50px" MaxLength="12" TabIndex="7" Enabled="false"></asp:TextBox></div>
                          <div><label>Venta(PV)</label><asp:TextBox ID="txtPriceSell" Height="18px" runat="server" Width="50px" MaxLength="12" TabIndex="7" Enabled="false"></asp:TextBox></div>
                          <div><label>Index</label><asp:TextBox ID="txtIndex" Height="18px" runat="server" Width="50px" MaxLength="12" TabIndex="7" Enabled="false"></asp:TextBox></div>
                         </fieldset>
                        <fieldset>
                             <div><label >Lista(PL)</label><asp:TextBox ID="txtPriceList" Height="18px" runat="server" Width="50px" MaxLength="12" Enabled="false" TabIndex="9"></asp:TextBox></div>
                             <div><label >Sugerido(GRP)</label><asp:TextBox ID="txtPriceSuggested" Height="18px" runat="server" Width="50px" Enabled="false" MaxLength="12" TabIndex="5"></asp:TextBox></div>
                             <div><label >CTM</label><asp:TextBox ID="txtCTM" Height="18px" runat="server" Width="50px" Enabled="false" MaxLength="12" TabIndex="5"></asp:TextBox></div>
                             <div><label>CTR</label><asp:TextBox ID="txtCTR" Height="18px" runat="server" Width="50px" Enabled="false" MaxLength="12" TabIndex="5"></asp:TextBox></div>
                          </fieldset>
                      </div>
           <asp:Label ID="lblErrorPrice" runat="server" Visible="false"  ForeColor="Red" ></asp:Label>
      </div>
      <div style="width:100%;">
        <center>
           <asp:Button ID="btnSave" runat="server" Text="Guardar" OnClick="btnSave_Click" CssClass="button" TabIndex="15" />&nbsp&nbsp&nbsp<a href="default.aspx">Cerrar</a>
        </center>
      </div>
   
   </div>
</div>
      
</asp:Content>
