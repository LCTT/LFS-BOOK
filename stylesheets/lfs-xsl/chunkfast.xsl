<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: manuel $
$Date: 2007-07-06 05:18:33 +0800 (Fri, 06 Jul 2007) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:exsl="http://exslt.org/common"
                xmlns:cf="http://docbook.sourceforge.net/xmlns/chunkfast/1.0"
                version="1.0"
                exclude-result-prefixes="cf exsl">

   <!-- Top-level chunked code for fast processing.
        Import standart customized chunk code.
        Replaces {docbook-xsl}/xhtml/chunkfast.xsl

        Note: Using this file as the top-level for chunked output implies that
              profiling must be done on a previous step. -->

    <!-- Our master chunking templates -->
  <xsl:import href="chunk-master.xsl"/>

    <!-- Use chunk.fast code? 1 = yes, 0 = no -->
  <xsl:param name="chunk.fast" select="1"/>

  <!-- The code below was copied as-is from {docbook-xsl}/xhtml/chunkfast.xsl -->

  <xsl:variable name="chunks" select="exsl:node-set($chunk.hierarchy)//cf:div"/>

  <xsl:template name="process-chunk-element">
    <xsl:choose>
      <xsl:when test="$chunk.fast != 0 and function-available('exsl:node-set')">
        <xsl:variable name="genid" select="generate-id()"/>

        <xsl:variable name="div" select="$chunks[@id=$genid or @xml:id=$genid]"/>

        <xsl:variable name="prevdiv" select="($div/preceding-sibling::cf:div|$div/preceding::cf:div|$div/parent::cf:div)[last()]"/>
        <xsl:variable name="prev" select="key('genid', ($prevdiv/@id|$prevdiv/@xml:id)[1])"/>

        <xsl:variable name="nextdiv" select="($div/following-sibling::cf:div|$div/following::cf:div|$div/cf:div)[1]"/>
        <xsl:variable name="next" select="key('genid', ($nextdiv/@id|$nextdiv/@xml:id)[1])"/>

        <xsl:choose>
          <xsl:when test="$onechunk != 0 and parent::*">
            <xsl:apply-imports/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="process-chunk">
              <xsl:with-param name="prev" select="$prev"/>
              <xsl:with-param name="next" select="$next"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$onechunk != 0 and not(parent::*)">
            <xsl:call-template name="chunk-all-sections"/>
          </xsl:when>
          <xsl:when test="$onechunk != 0">
            <xsl:apply-imports/>
          </xsl:when>
          <xsl:when test="$chunk.first.sections = 0">
            <xsl:call-template name="chunk-first-section-with-parent"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="chunk-all-sections"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
