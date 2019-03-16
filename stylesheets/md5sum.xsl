<?xml version='1.0' encoding='ISO-8859-1'?>

<!-- Create a md5 list for packages and pathces used. -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

  <xsl:output method="text"/>

  <xsl:template match="/">
    <xsl:apply-templates select="//ulink"/>
  </xsl:template>

  <xsl:template match="ulink">
      <!-- If some package don't have the predefined strings in their
      name, the next test must be fixed to match it also. Skip possible
      duplicated URLs that may be split for PDF output -->
    <xsl:if test="(contains( @url, '.tar.' ) or 
                   contains( @url, '.tgz'  ) or 
                   contains( @url, '.patch') ) and
                   not( ancestor-or-self::*/@condition = 'pdf' )" >
      <!-- Get the md5sum -->
      <xsl:value-of select="../../para/literal"/>

      <!-- Add two spaces -->
      <xsl:text>  </xsl:text>

      <!-- Get the basename -->
      <xsl:call-template name="basename">
        <xsl:with-param name="pathname" select="@url"/>
      </xsl:call-template>

      <!-- Add a newline -->
      <xsl:text>&#x0a;</xsl:text>
    
    </xsl:if>
  </xsl:template>

  <xsl:template name="basename">
    <xsl:param name="pathname"/>
   
    <xsl:choose>

       <xsl:when test="contains( $pathname, '/' )" >
          <xsl:call-template name="basename">
            <xsl:with-param name="pathname" select="substring-after( $pathname, '/' )" />
          </xsl:call-template>
       </xsl:when>

        <xsl:otherwise>
          <xsl:value-of select="$pathname"/>
        </xsl:otherwise>

    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>

