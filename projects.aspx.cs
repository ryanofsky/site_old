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
using Microsoft.Data.Odbc;
using System.Diagnostics;

namespace site
{
  /// <summary>
  /// Summary description for projects.
  /// </summary>
  public class projects : PageTemplate
  {
    OdbcConnection postgres;
    
    private void Page_Load(object sender, System.EventArgs e)
    {
      // Put user code to initialize the page here
    }

    public void OdbcConnect()
    {
      Debug.Assert(postgres == null);
      postgres = new OdbcConnection("DSN=site");
      postgres.Open();
    }
    
    public void OdbcDisconnect()
    {
      Debug.Assert(postgres != null);
      postgres.Close();
      postgres = null;
    }
    
    public OdbcCommand getOdbcCommand(string query)
    {
      Debug.Assert(postgres != null);
      OdbcCommand cmd = new OdbcCommand(query);
      cmd.Connection = postgres;
      return cmd;
    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
      //
      // CODEGEN: This call is required by the ASP.NET Web Form Designer.
      //
      InitializeComponent();
      base.OnInit(e);
    }
    
    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {    
      this.Load += new System.EventHandler(this.Page_Load);

    }
    #endregion
  }
}
