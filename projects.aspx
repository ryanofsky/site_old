<%@ Page language="c#" AutoEventWireup="false" Inherits="site.projects" %>
<%@ Register TagPrefix="prefix" TagName="mrnav" src="navigate.ascx" %>
<% header("Projects"); %>
<prefix:mrnav ID="mrnavid" runat="server" />

<div class=notugly>
<% showproj(); %>
</div>

<% footer(); %>


