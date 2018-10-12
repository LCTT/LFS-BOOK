<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: manuel $
$Date: 2007-07-06 05:18:33 +0800 (Fri, 06 Jul 2007) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">

  <!-- This stylesheet controls how admonitions are displayed -->

    <!-- Use graphics in admonitions? 1 = yes, 0 = no -->
  <xsl:param name="admon.graphics" select="1"/>

    <!-- Path to admonition graphics relative to index.xml -->
  <xsl:param name="admon.graphics.path" select="'images/'"/>

    <!-- Global admonitions properties -->
  <xsl:attribute-set name="graphical.admonition.properties">
    <xsl:attribute name="keep-together.within-column">
      <xsl:variable name="keep.together">
        <xsl:call-template name="pi.dbfo_keep-together"/>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$keep.together != ''">
          <xsl:value-of select="$keep.together"/>
        </xsl:when>
        <xsl:otherwise>always</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="space-before.optimum">0.6em</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0.4em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">0.8em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
    <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
    <xsl:attribute name="padding-start">5pt</xsl:attribute>
    <xsl:attribute name="padding-top">5pt</xsl:attribute>
    <xsl:attribute name="padding-bottom">5pt</xsl:attribute>
    <xsl:attribute name="border-style">solid</xsl:attribute>
    <xsl:attribute name="border-width">0.5pt</xsl:attribute>
    <xsl:attribute name="background-color">#FFFFE6</xsl:attribute>
    <xsl:attribute name="border-color">
      <xsl:choose>
        <xsl:when test="self::note | self::tip">#E0E0E0</xsl:when>
        <xsl:otherwise>#DCC</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

    <!-- Properties for admonitions titles -->
  <xsl:attribute-set name="admonition.title.properties">
    <xsl:attribute name="font-size">14pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="hyphenate">false</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <xsl:attribute name="color">
      <xsl:choose>
        <xsl:when test="ancestor-or-self::important | ancestor-or-self::warning
                        | ancestor-or-self::caution">#500</xsl:when>
        <xsl:otherwise>#000</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

    <!-- Properties for admonitions text -->
  <xsl:attribute-set name="admonition.properties">
    <xsl:attribute name="margin-right">5pt</xsl:attribute>
  </xsl:attribute-set>

    <!-- admon.graphic.width:
           Making the graphic smaller. -->
    <!-- The original template is in {docbook-xsl}/fo/admon.xsl -->
  <xsl:template match="*" mode="admon.graphic.width">
    <xsl:param name="node" select="."/>
    <xsl:text>24pt</xsl:text>
  </xsl:template>

</xsl:stylesheet>
