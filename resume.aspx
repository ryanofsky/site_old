<%@ Page language="c#" AutoEventWireup="false" Inherits="site.resume" %>
<%@ Register TagPrefix="prefix" TagName="mrnav" src="navigate.ascx" %>
<% header("Resume"); %>
<prefix:mrnav ID="mrnavid" runat="server" />
<div class=notugly>
<p>Now in assorted formats:</p>
<ul>
  <li>Microsoft Word (<a href="resume.doc">resume.doc</a>, 31,744 bytes)</li>
  <li>HTML (<a href="resume.htm">resume.htm</a>, 19,070 bytes)</li>
  <li>PDF (<a href="resume.pdf">resume.pdf</a>, 48,559 bytes)</li>
  <li>Postscript (<a href="resume.ps">resume.ps</a>, 109,844 bytes)</li>
</ul>
</div>
<% footer(); %>
