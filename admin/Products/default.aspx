<%@ Page Language="C#" MasterPageFile="~/Base.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="GrundFos.PriceManager.WebSite.admin.Product._default" Title="Prices Manager Advanced - Administraci�n: Productos" %>

<%@ Register Src="../../ctrl/PriceMasterList.ascx" TagName="PriceMasterList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cplMain" runat="server">
    <uc1:PriceMasterList ID="PriceMasterList1" Type="3" UrlForCreateNew="addproduct.aspx" runat="server" />
</asp:Content>
