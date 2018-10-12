<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: manuel $
$Date: 2007-07-06 05:18:33 +0800 (Fri, 06 Jul 2007) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="xlink"
                version="1.0">


  <!-- This stylesheet fixes English punctuation in xref links
       (as was requested by the publisher) via adding @role propagation
       in xref tags.
       This hack may not work with xref flavours not used in the book.
       For other languages, just remove the xref @role attributes
       in the book XML sources and/or comment-out the inclusion of
       this file in lfs-pdf.xsl -->

     <!--  xref:
           Added role variable and use it when calling mode xref-to.-->
    <!-- The original template is in {docbook-xsl}/fo/xref.xsl -->
  <xsl:template match="xref" name="xref">
    <xsl:param name="xhref" select="@xlink:href"/>
    <!-- is the @xlink:href a local idref link? -->
    <xsl:param name="xlink.idref">
      <xsl:if test="starts-with($xhref,'#')
                    and (not(contains($xhref,'&#40;'))
                    or starts-with($xhref, '#xpointer&#40;id&#40;'))">
        <xsl:call-template name="xpointer.idref">
          <xsl:with-param name="xpointer" select="$xhref"/>
        </xsl:call-template>
    </xsl:if>
    </xsl:param>
    <xsl:param name="xlink.targets" select="key('id',$xlink.idref)"/>
    <xsl:param name="linkend.targets" select="key('id',@linkend)"/>
    <xsl:param name="target" select="($xlink.targets | $linkend.targets)[1]"/>
    <xsl:param name="refelem" select="local-name($target)"/>
      <!-- Added role variable -->
    <xsl:variable name="role" select="@role"/>
    <xsl:variable name="xrefstyle">
      <xsl:choose>
        <xsl:when test="@role and not(@xrefstyle)
                        and $use.role.as.xrefstyle != 0">
          <xsl:value-of select="@role"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@xrefstyle"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="content">
      <fo:inline xsl:use-attribute-sets="xref.properties">
        <xsl:choose>
          <xsl:when test="@endterm">
            <xsl:variable name="etargets" select="key('id',@endterm)"/>
            <xsl:variable name="etarget" select="$etargets[1]"/>
            <xsl:choose>
              <xsl:when test="count($etarget) = 0">
                <xsl:message>
                  <xsl:value-of select="count($etargets)"/>
                  <xsl:text>Endterm points to nonexistent ID: </xsl:text>
                  <xsl:value-of select="@endterm"/>
                </xsl:message>
                <xsl:text>???</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="$etarget" mode="endterm"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="$target/@xreflabel">
            <xsl:call-template name="xref.xreflabel">
              <xsl:with-param name="target" select="$target"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$target">
            <xsl:if test="not(parent::citation)">
              <xsl:apply-templates select="$target" mode="xref-to-prefix"/>
            </xsl:if>
            <xsl:apply-templates select="$target" mode="xref-to">
              <xsl:with-param name="referrer" select="."/>
              <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
              <!-- Propagate role -->
              <xsl:with-param name="role" select="$role"/>
            </xsl:apply-templates>
            <xsl:if test="not(parent::citation)">
              <xsl:apply-templates select="$target" mode="xref-to-suffix"/>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:message>
              <xsl:text>ERROR: xref linking to </xsl:text>
              <xsl:value-of select="@linkend|@xlink:href"/>
              <xsl:text> has no generated link text.</xsl:text>
            </xsl:message>
            <xsl:text>???</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </fo:inline>
    </xsl:variable>
    <!-- Convert it into an active link -->
    <xsl:call-template name="simple.xlink">
      <xsl:with-param name="content" select="$content"/>
    </xsl:call-template>
    <!-- Add standard page reference? -->
    <xsl:choose>
      <xsl:when test="not($target)">
        <!-- page numbers only for local targets -->
      </xsl:when>
      <xsl:when test="starts-with(normalize-space($xrefstyle), 'select:')
                    and contains($xrefstyle, 'nopage')">
        <!-- negative xrefstyle in instance turns it off -->
      </xsl:when>
      <!-- positive xrefstyle already handles it -->
      <xsl:when test="not(starts-with(normalize-space($xrefstyle), 'select:')
                    and (contains($xrefstyle, 'page')
                        or contains($xrefstyle, 'Page')))
                    and ( $insert.xref.page.number = 'yes'
                      or $insert.xref.page.number = '1')
                    or local-name($target) = 'para'">
        <xsl:apply-templates select="$target" mode="page.citation">
          <xsl:with-param name="id" select="$target/@id|$target/@xml:id"/>
        </xsl:apply-templates>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

    <!-- sect* mode xref-to:
           Propagate role to mode object.xref.markup (see ../lfs-common.xsl) -->
    <!-- The original template is in {docbook-xsl}/fo/xref.xsl -->
  <xsl:template match="section|simplesect|sect1|sect2|sect3|sect4|sect5
                      |refsect1|refsect2|refsect3|refsection" mode="xref-to">
    <xsl:param name="referrer"/>
    <xsl:param name="xrefstyle"/>
    <xsl:param name="verbose" select="1"/>
    <xsl:param name="role"/>
    <xsl:apply-templates select="." mode="object.xref.markup">
      <xsl:with-param name="purpose" select="'xref'"/>
      <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
      <xsl:with-param name="referrer" select="$referrer"/>
      <xsl:with-param name="verbose" select="$verbose"/>
      <xsl:with-param name="role" select="$role"/>
    </xsl:apply-templates>
  </xsl:template>

    <!-- insert.title.markup:
           Apply the role value. -->
    <!-- The original template is in {docbook-xsl}/fo/xref.xsl -->
  <xsl:template match="*" mode="insert.title.markup">
    <xsl:param name="purpose"/>
    <xsl:param name="xrefstyle"/>
    <xsl:param name="title"/>
    <xsl:param name="role"/>
    <xsl:choose>
      <xsl:when test="$purpose = 'xref' and titleabbrev">
        <xsl:apply-templates select="." mode="titleabbrev.markup"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy-of select="$title"/>
        <xsl:value-of select="$role"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
