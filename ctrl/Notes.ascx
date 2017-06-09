<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Notes.ascx.cs" Inherits="GrundFos.PriceManager.WebSite.ctrl.Notes" %>

        <div class="page_header">
            <h1>Notas</h1>
        </div>
        <div class="content" style="text-align:center;">
          <div >
            <asp:Repeater ID="rpterNotes" runat="server" OnItemDataBound="rpterNotes_ItemDataBound" OnItemCommand="rpterNotes_ItemCommand">
                
                    <HeaderTemplate>                
                    <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <p><%# DataBinder.Eval(Container, "DataItem.Subject")%>&nbsp|&nbsp
                            <%# DataBinder.Eval(Container, "DataItem.Description")%>&nbsp|&nbsp
                            <asp:LinkButton ID="lnkErase" runat="server" CommandName="Erase" CommandArgument='<%#DataBinder.Eval(Container, "DataItem.Id") %>' Text="[x]"/></p>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                    </ul>
                    </FooterTemplate>
            </asp:Repeater>
          </div>
              
       <div style="clear:both; text-align:center;"> 
        <asp:PlaceHolder runat="server" ID="plhFields">
             <div class="form" style="margin-left:auto; margin-right:auto; width:250px;">
             <fieldset>
                <div><label>Asunto&nbsp<asp:TextBox runat="server" ID="txtSubject" Width="200px" ValidationGroup="savenote" MaxLength="128"></asp:TextBox></label>
                 <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="*" ValidationGroup="savenote" ControlToValidate="txtSubject"></asp:RequiredFieldValidator></div>
                 <div><label>Descripción&nbsp<asp:TextBox runat="server" ID="txtDescription" Width="170px" ValidationGroup="savenote" MaxLength="500"></asp:TextBox></label>
                 <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ErrorMessage="*" ValidationGroup="savenote" ControlToValidate="txtDescription"></asp:RequiredFieldValidator></div>
                <div style="text-align:center"><asp:Button runat="server" ID="btnSave" CssClass="button" OnClick="btnSave_Click" Text="Salvar" ValidationGroup="savenote" />&nbsp
                <asp:LinkButton runat="server" ID="lnkSeeAll" OnClick="lnkSeeAll_Click">[+]</asp:LinkButton>
                <asp:LinkButton runat="server" ID="lnkSeeLess" OnClick="lnkSeeLess_Click" Visible="false">[-]</asp:LinkButton></div>
             </fieldset>
            </div>
        </asp:PlaceHolder>
            
      </div>
</div>

