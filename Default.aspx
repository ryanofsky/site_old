<%@ Page language="c#" AutoEventWireup="false" Inherits="site.index" %>
<%@ Register TagPrefix="prefix" TagName="mrnav" src="navigate.ascx" %>
<% header("Home"); %>
<prefix:mrnav ID="mrnavid" runat="server" />
<div class=notugly>
<p>Hi, I'm Russ Yanofsky, a computer science major at Columbia University's School of Engineering. This is my homepage, built to hold my resume, some links, and the source code for some programming projects I've worked on. </p>
</div>
<% footer(); %>