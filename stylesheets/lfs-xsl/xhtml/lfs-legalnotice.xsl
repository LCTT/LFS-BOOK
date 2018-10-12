<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: manuel $
$Date: 2007-07-06 05:18:33 +0800 (Fri, 06 Jul 2007) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0">

  <!-- This stylesheet controls how legalnotice page is created -->

    <!-- Generating the legalnotice page:
           We are forcing separate legalnotice page generation.
           Removed the default link to legalnotice page. We want it in Copyright.
           Added footer navigational link to Home.  -->
    <!-- The original template is in {docbook-xsl}/xhtml/titlepage.xsl -->
  <xsl:template match="legalnotice" mode="titlepage.mode">
    <xsl:variable name="id">
      <xsl:call-template name="object.id"/>
    </xsl:variable>
    <xsl:variable name="filename" select="concat($base.dir, 'legalnotice.html')"/>
    <xsl:call-template name="write.chunk">
      <xsl:with-param name="filename" select="$filename"/>
      <xsl:with-param name="quiet" select="$chunk.quietly"/>
      <xsl:with-param name="content">
        <html>
          <xsl:call-template name="html.head"/>
          <body>
            <xsl:call-template name="body.attributes"/>
            <div class="{local-name(.)}">
              <xsl:apply-templates mode="titlepage.mode"/>
            </div>
            <div class="navfooter">
              <ul class="footerlinks">
                <li class="home">
                  <a accesskey="h" href="index.html">
                    <xsl:attribute name="title">
                      <xsl:value-of select="/book/bookinfo/title"/>
                      <xsl:text> - </xsl:text>
                      <xsl:value-of select="/book/bookinfo/subtitle"/>
                    </xsl:attribute>
                    <xsl:call-template name="navig.content">
                      <xsl:with-param name="direction" select="'home'"/>
                    </xsl:call-template>
                  </a>
                </li>
              </ul>
            </div>
          </body>
        </html>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

    <!-- Making the legalnotice link:
         We make the "Copyright" word a link to legalnotice page. -->
    <!-- The original template is in {docbook-xsl}/xhtml/titlepage.xsl -->
  <xsl:template match="copyright" mode="titlepage.mode">
    <p class="{name(.)}">
      <a href="legalnotice.html">
        <xsl:call-template name="gentext">
          <xsl:with-param name="key" select="'Copyright'"/>
        </xsl:call-template>
      </a>
      <xsl:call-template name="gentext.space"/>
      <xsl:call-template name="dingbat">
        <xsl:with-param name="dingbat">copyright</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gentext.space"/>
      <xsl:call-template name="copyright.years">
        <xsl:with-param name="years" select="year"/>
        <xsl:with-param name="print.ranges" select="$make.year.ranges"/>
        <xsl:with-param name="single.year.ranges" select="$make.single.year.ranges"/>
      </xsl:call-template>
      <xsl:call-template name="gentext.space"/>
      <xsl:apply-templates select="holder" mode="titlepage.mode"/>
    </p>
  </xsl:template>

</xsl:stylesheet>
