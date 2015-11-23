<?xml version='1.0' encoding='ISO-8859-1'?>

<!-- Create a list of upstream URLs for packages and patches to be used
     with wget. -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

  <xsl:output method="text"/>

  <xsl:template match="/">
    <xsl:apply-templates select="//ulink"/>
  </xsl:template>

  <xsl:template match="ulink">
      <!-- If some package don't have the predefined strings in their
      name, the next test must be fixed to match it also. Skip possible
      duplicated URLs due that may be splitted for PDF output -->
    <xsl:if test="(contains(@url, '.tar.') or contains(@url, '.tgz')
                  or contains(@url, '.patch')) and
                  not(ancestor-or-self::*/@condition = 'pdf')">
      <xsl:choose>
        <xsl:when test="contains(@url,'?download')">
          <xsl:value-of select="substring-before(@url,'?download')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@url"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>&#x0a;</xsl:text>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>

