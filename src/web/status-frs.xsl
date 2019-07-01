<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" xmlns="http://www.w3.org/1999/xhtml">
<xsl:output omit-xml-declaration="no" method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />

<xsl:template match="/node()">
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=koi8-r" />
      <title>FRS Radio</title>
    </head>
    <body>
      <xsl:call-template name="content" namespace="http://www.w3.org/1999/xhtml" />
    </body>
    <style type="text/css">
      body {
        font: normal 8pt sans-serif;
      }

      td {
       font-size: 8pt; 
       font-family: Verdana, Arial, Helvetica, sans-serif; 
      }

      a, a:hover, a:visited {
        color: #02329E;
        text-decoration: none;
      }
    </style>
  </html>
</xsl:template>

<xsl:template name="content">
  <table border="0" cols="2" frame="void">
    <xsl:for-each select="source">
      <tr>
        <td>
          <a href="http://center/services/radio.php?mount={@mount}">
            <xsl:value-of select="@mount" />
          </a>
        </td>
        <td style="padding-left: 1em;">
          <a href="{@mount}.m3u">
            <img src="tunein.png" />
          </a>
        </td>
      </tr>
    </xsl:for-each>
  </table>
</xsl:template>

</xsl:stylesheet>
