<%@ Page Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="new.aspx.cs" Inherits="GrundFos.PriceManager.WebSite.admin.Importation._new" Title="Prices Manager Advanced - Importación: Nueva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cplMain" runat="server">

<div class="page_header"> 
    <div class="page_header_links"> 
        &nbsp;
    </div> 
  <h1>Importar Productos</h1> 
</div>
        
<div class="content">
    <div class="form">
        <fieldset>
              <div>
                <label>Seleccione Archivo:</label>
                <asp:FileUpload ID="fuArchImp" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fuArchImp"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
              </div>
              
              <div>
                <label>Caracter separador:</label>
                <asp:DropDownList ID="ddlCharacter" runat="server">
                        <asp:ListItem>;</asp:ListItem>
                        <asp:ListItem>,</asp:ListItem>
                        <asp:ListItem>.</asp:ListItem>
                        <asp:ListItem>:</asp:ListItem>
                        <asp:ListItem>?</asp:ListItem>
                        <asp:ListItem>/</asp:ListItem>
                        <asp:ListItem>|</asp:ListItem>
                    </asp:DropDownList> 
              </div> 
                                 
              <div>
              <label>Tiene Encabezado?</label>
              <asp:CheckBox ID="chkHeader" runat="server" Checked="True" />
              </div>
              
              <div>
              <label>Descripción:</label>
              <asp:TextBox ID="txtDescription" runat="server" MaxLength="50" Width="256px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescription"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
              </div>
              
              <div style="text-align:center">
                    <asp:Label ID="lblError" runat="server" Visible="False" Font-Bold="True" Font-Size="Small" ForeColor="Red" ></asp:Label>
              </div>
            
              <div style="text-align:center">
                  <asp:Button ID="btnUpload" runat="server" Text="Subir" CssClass="button" OnClick="btnUpload_Click" /> o <a class="close_popup" href="default.aspx">Volver</a>
              </div>            
              
        </fieldset>
    </div>
</div>

</asp:Content>
