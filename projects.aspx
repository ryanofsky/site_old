<%@ Page language="c#" AutoEventWireup="false" Inherits="site.projects" Debug="true" %>
<%@ Register TagPrefix="prefix" TagName="mrnav" src="navigate.ascx" %>
<%@ Import Namespace="Microsoft.Data.Odbc" %>
<%@ Assembly Name = "Microsoft.Data.Odbc" %>
<% header("Projects"); %>
<prefix:mrnav ID="mrnavid" runat="server" />
<div class=notugly>


<form>

<%

try
{
  OdbcConnect();
%> 
<p>It's taking a lot longer than I thought it would to gather source files, statistics, and comments for these projects.  I'm going to add to the content here and revise gradually over the next few weeks, as time permits. So far I've added all of the projects that have online CVS repositories or preexisting web sites.</p>
<p><i>Note:</i> These controls don't actually do anything right now. When I get the opportunity, I'll replace them with ASP.NET Web Form elements, so I'll be able to add functionality and learn a new API at once.</p>

<table border=1 cellpadding=3>
<tr>
  <td>Order by 
    <select size=1>
    <option>Date (descending)</option>
    <option>Size (descending)</option>
    <option>Date (ascending)</option>
    <option>Size(ascending)</option>
    </select>
  </td>  
</tr>
<tr>
  <td>
    Filter by Language<br>
    <select size=5 multiple>
<%
  OdbcCommand lcmd = getOdbcCommand("SELECT language_id, name FROM languages ORDER BY language_id");
  OdbcDataReader lreader = lcmd.ExecuteReader();
  while(lreader.Read()) 
    Response.Write("    <option value=" + lreader.GetInt32(0) + ">" + lreader.GetString(1) + "</option>\n");
  lreader.Close();
%>
    </select>
  </td>
</tr>
<tr>
  <td align=center>
    <input type=submit name=submit value=Submit>
   </td>
</tr>
</table>
</form>

<%
  OdbcCommand pcmd = getOdbcCommand(@"
    SELECT p.project_id, p.name, p.lines, p.cvsmodule, p.description,
    (CASE WHEN p.startdate IS NULL THEN '?' ELSE to_char(p.startdate,'MM/DD/YYYY') END) || ' - ' ||
    (CASE WHEN p.enddate IS NULL THEN '?' ELSE to_char(p.enddate,'MM/DD/YYYY') END) AS dates,
    comma(l.name) AS langs    
    FROM projects AS p
    INNER JOIN project_languages AS pl USING (project_id)
    INNER JOIN languages AS l USING (language_id)
    GROUP BY p.project_id, p.name, p.lines, p.cvsmodule, p.description, p.startdate, p.enddate
    ORDER BY p.startdate DESC
  ");
  OdbcDataReader preader = pcmd.ExecuteReader();
  
  while(preader.Read()) 
  {
    int id = preader.GetInt32(0);
    String name = preader.GetString(1); 
    int lines = preader.GetInt32(2);
    String size = (lines == 0 ? "?" : String.Format("{0:N0}",lines)) + " lines";
    String cvs = preader.IsDBNull(3) ? "<i>none</i>" : ("<a href=\"http://cvs.russ.hn.org/viewcvs.asp/" + preader.GetString(3) + "/\">" + preader.GetString(3) + "</a>");
    String description = preader.GetString(4);
    String dates = preader.GetString(5);
    String langs = preader.GetString(6);
%>
<table border=1 bordercolor=black cellpadding=3 cellspacing=0>
<tr><td>Name:</td><td><%=name%></td></tr>
<tr><td>Size:</td><td><%=size%></td></tr>
<tr><td>Dates:</td><td><%=dates%></td></tr>
<tr><td nowrap>CVS Repository:</td><td><%=cvs%></td></tr>
<tr><td>Language(s):</td><td><%=langs%></td></tr>
<tr><td valign=top>Description:</td><td><%=description%></td></tr>
</table><br>
<%   
  }
  preader.Close();
}
finally
{
  OdbcDisconnect();
}

 %>
</div>

<% footer(); %>


