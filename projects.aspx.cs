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

    public OdbcCommand getOdbcCommand(string query)
    {
      if (postgres == null)
      {
        // FIXME: Find out if the connection will be garbage collected after
        // the page executes like in php. if not, determine the best place
        // to call postgres.Close(). Does the .net runtime have any support
        // for deterministic finalization?
        postgres = new OdbcConnection("DSN=site;UID=postgres");
        postgres.Open();
      }
      OdbcCommand cmd = new OdbcCommand(query);
      cmd.Connection = postgres;
      return cmd;
    }

    public void closeOdbc()
    {
      if (postgres != null)
      {
        postgres.Close();
        postgres = null;
      }
    }

    public void showproj()
    {
      OdbcCommand cmd = getOdbcCommand("SELECT project_id, name FROM projects");
      OdbcDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
      while(reader.Read()) 
      {
        Response.Write("id = " + reader.GetInt32(0) + "<br>");
        Response.Write("name = " + reader.GetString(1) + "<br>");
      }
      reader.Close();
      closeOdbc();
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
