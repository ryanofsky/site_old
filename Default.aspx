<%@ Page language="c#" AutoEventWireup="false" Inherits="site.index" %>
<%@ Register TagPrefix="prefix" TagName="mrnav" src="navigate.ascx" %>
<% header("Home"); %>
<prefix:mrnav ID="mrnavid" runat="server" />
<% footer(); %>