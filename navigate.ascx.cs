using System;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI;

namespace site
{
  public class navigate : UserControl
  {
    public string pageName;
    public string defaultCaption = "Default";

    protected override void OnLoad(EventArgs e) 
    {
      base.OnLoad(e);
      this.pageName = this.Page.Request.ServerVariables["SCRIPT_NAME"];
    }
    
    public string link(string dest, string caption, string imgsrc, string imggsrc, int height, int width)
    {
      bool isLink = pageName == null || !dest.Equals(pageName);
      string mousecap = isLink ? "<i>" + caption + "</i>" : caption;
      string mousey = @" onmouseover=""setCaption('" + mousecap + @"')"" onmouseout=""revertCaption()""";
      string img = @"<img src=""" + (isLink ? imgsrc : imggsrc) + @""" width=" + width + " height="
        + height + @" alt=""" + caption + @"""" + (isLink ? "" : mousey) + @" border=0>";

      if (!isLink) this.defaultCaption = caption;

      return isLink ? @"<a href=""" + dest + @"""" + mousey + ">" + img + "</a>" : img;
    }
  }
}
