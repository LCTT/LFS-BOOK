<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: manuel $
$Date: 2007-07-06 05:18:33 +0800 (Fri, 06 Jul 2007) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0">

  <!-- This stylesheet controls how admonitions are displayed -->

    <!-- Use graphics in admonitions? 1 = yes, 0 = no -->
  <xsl:param name="admon.graphics" select="1"/>

    <!-- Relative path to images directory. We set here relative path
    from sub-dirs HTML files. The path from top-level HTML files (index.html,
    partX.html, etc) MUST be fixed via a sed in the Makefile. -->
  <xsl:param name="admon.graphics.path">../images/</xsl:param>

    <!-- The images files extension -->
  <xsl:param name="admon.graphics.extension" select="'.png'"/>

    <!-- Changing the output tagging:
           Removed $admon.style support
           Hardcoded $admon.textlabel feature
           Changed the output format from table to nested divs -->
    <!-- The original template is in {docbook-xsl}/xhtml/admon.xsl -->
  <xsl:template name="graphical.admonition">
    <xsl:variable name="admon.type">
      <xsl:choose>
        <xsl:when test="local-name(.)='note'">Note</xsl:when>
        <xsl:when test="local-name(.)='warning'">Warning</xsl:when>
        <xsl:when test="local-name(.)='caution'">Caution</xsl:when>
        <xsl:when test="local-name(.)='tip'">Tip</xsl:when>
        <xsl:when test="local-name(.)='important'">Important</xsl:when>
        <xsl:otherwise>Note</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="alt">
      <xsl:call-template name="gentext">
        <xsl:with-param name="key" select="$admon.type"/>
      </xsl:call-template>
    </xsl:variable>
    <div class="admon {name(.)}">
      <img alt="[{$alt}]">
        <xsl:attribute name="src">
          <xsl:call-template name="admon.graphic"/>
        </xsl:attribute>
      </img>
      <h3>
        <xsl:apply-templates select="." mode="object.title.markup"/>
      </h3>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

</xsl:stylesheet>
