MYCLASSES = PageTemplate.cs default.aspx.cs links.aspx.cs navigate.ascx.cs projects.aspx.cs resume.aspx.cs
MYDLL = bin/site.dll
CSC_OPTIONS = "/r:System.dll;System.Web.dll;Microsoft.Data.Odbc.dll"

$(MYDLL): $(MYCLASSES)
	csc /t:library /out:$(MYDLL) $(CSC_OPTIONS) $(MYCLASSES)

clean:
	rm $(MYDLL)
