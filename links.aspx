<%@ Page language="c#" AutoEventWireup="false" Inherits="site.links" %>
<%@ Register TagPrefix="prefix" TagName="mrnav" src="navigate.ascx" %>
<% header("Links"); %>
<prefix:mrnav ID="mrnavid" runat="server" />
<% footer(); %>