using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace site
{
  public class PageTemplate : System.Web.UI.Page
  {
    public void header(String title)
    {
      Response.Write(
@"<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"" > 
<html>
<head>
<title>" + title + @"</title>
<style>
<!--
  h2 { text-align: center; }
  body { font-family: Modern, Trebuchet MS, Arial, Helvetica, sans-serif; }
  .notugly { font-family: Trebuchet MS, Arial, Helvetica, sans-serif; }
-->
</style>    
</head>
<body bgcolor=""#E0E0E0"">
");
    }

    public void footer()
    {
      Response.Write(@"
</body>
</html>");
      
    }
  }
}
