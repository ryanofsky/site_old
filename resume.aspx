<%@ Page language="c#" AutoEventWireup="false" Inherits="site.resume" %>
<%@ Register TagPrefix="prefix" TagName="mrnav" src="navigate.ascx" %>
<% header("Resume"); %>
<prefix:mrnav ID="mrnavid" runat="server" />
<% footer(); %>
