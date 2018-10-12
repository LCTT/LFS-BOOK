<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: matthew $
$Date: 2013-10-09 04:03:29 +0800 (Wed, 09 Oct 2013) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0">

  <!-- Top-level chunked code for normal processing.
       Import customized output templates.
       Include customized chunk templates.
       Replaces {docbook-xsl}/xhtml/chunk.xsl -->

  <!-- Our master non-chunking presentation templates -->
  <xsl:import href="chunk-slave.xsl"/>

  <!-- Upstream chunk code named templates -->
  <xsl:import href="docbook-xsl-1.78.1/xhtml/chunk-common.xsl"/>

  <!-- Upstream chunk code match templates -->
  <xsl:include href="docbook-xsl-1.78.1/xhtml/chunk-code.xsl"/>

  <!-- Customized chunk templates -->
  <xsl:include href="xhtml/lfs-index.xsl"/>
  <xsl:include href="xhtml/lfs-legalnotice.xsl"/>
  <xsl:include href="xhtml/lfs-navigational.xsl"/>

  <!-- sect1:
         Prevent creation of dummy sect1 files used to emulate sub-chapters.
         The original template is in {docbook-xsl}/xhtml/chunk-code.xsl
         It also matches other sect* tags. The code for those tags are
         unchanged. -->
  <xsl:template match="sect1">
    <xsl:variable name="ischunk">
      <xsl:call-template name="chunk"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="@role = 'dummy'"/>
      <xsl:when test="not(parent::*)">
        <xsl:call-template name="process-chunk-element"/>
      </xsl:when>
      <xsl:when test="$ischunk = 0">
        <xsl:apply-imports/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="process-chunk-element"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
