<%@ Control Inherits="site.navigate" Language="c#" AutoEventWireup="false" %>
<script>
<!--

function setCaption(c)
{
  if (document.getElementById)
  {
    var e = document.getElementById("caption");
    if (!e.defaultText) e.defaultText = e.innerHTML;
    e.innerHTML = c;
    e.hover = true;
  }
}

function revertCaption()
{
  if (document.getElementById)
  {
    var e = document.getElementById("caption");
    e.hover = false; 
    window.setTimeout("reallyRevertCaption()",50);
  }
}

function reallyRevertCaption()
{
  if (document.getElementById)
  {
    var e = document.getElementById("caption");
    if (!e.hover) e.innerHTML = e.defaultText;
  }
}


-->
</script>
<p align=center>
<%=this.link("/Default.aspx", "Home", "media/student.gif", "media/student_glow.gif", 260, 134)%>
<%=this.link("/resume.aspx", "Resume", "media/lawyer.gif", "media/lawyer_glow.gif", 249, 115)%>
<%=this.link("/projects.aspx", "Projects", "media/kneeling.gif", "media/kneeling_glow.gif", 238, 171)%>
<%=this.link("/links.aspx", "Links", "media/bird.gif", "media/bird_glow.gif", 103, 107)%>
</p>

<h2 id=caption><%=this.defaultCaption%></h2>
<p>pagename = <%=this.pageName%></p>