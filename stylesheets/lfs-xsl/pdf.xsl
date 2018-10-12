<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: matthew $
$Date: 2013-10-17 02:55:24 +0800 (Thu, 17 Oct 2013) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">

  <!-- Stylesheet for FO output used to generate PDF
       Sets global params and include customization stylesheets. -->

  <!-- Upstream FO templates. Profiled version is not supported by
       xsltproc, thus pofiling must be done in two steps (see Makefile) -->
  <xsl:import href="docbook-xsl-1.78.1/fo/docbook.xsl"/>

  <!-- Uncomment the following to make debugging the raw FO code easier.
       Note that FOP will complaints about a lot of paragraph overflows
       because verbatim output is also indented.
       Remember to comment the "rm $(BASEDIR)/lfs-pdf.fo" in
       the Makefile. -->
  <!--<xsl:output  encoding="UTF-8" indent="yes" />-->

  <!-- Including our others customized templates. -->
  <xsl:include href="common.xsl"/>
  <xsl:include href="pdf/lfs-admon.xsl"/>
  <xsl:include href="pdf/lfs-index.xsl"/>
  <xsl:include href="pdf/lfs-lists.xsl"/>
  <xsl:include href="pdf/lfs-mixed.xsl"/>
  <xsl:include href="pdf/lfs-pagesetup.xsl"/>
  <xsl:include href="pdf/lfs-xref.xsl"/>

  <!-- Activate FOP-1 extensions. We use FOP-0.93 as the FO procesor. -->
  <xsl:param name="fop1.extensions" select="1"/>

  <!-- Deactivate draft mode. -->
  <xsl:param name="draft.mode" select="'no'"/>

  <!-- Paper size -->
  <xsl:param name="paper.type" select="'USletter'"/>

  <!-- Paper size required by the publisher
  <xsl:param name="paper.type" select="'Customized'"/>
  <xsl:param name="page.width">7.25in</xsl:param>
  <xsl:param name="page.height">9.25in</xsl:param>
    -->

  <!-- Is the document to be printed double sided? 1 = yes, 0 = no -->
  <!-- Change "double.sided" to "1" for published versions. -->
  <xsl:param name="double.sided" select="0"/>

  <!-- Hyphenate? -->
  <xsl:param name="hyphenate">false</xsl:param>

  <!-- Allow URLs to be automatically hyphenated.
       We have expanded the support to several inline tags.
       See pdf/lfs-mixed.xsl -->
  <xsl:param name="ulink.hyphenate" select="'&#x200B;'"/>

  <!-- List of characters to allow ulink URLs, and supported inline tags,
       to be automatically hyphenated on.
       Note: the / character is in the list but FOP-0.93 ignores it. -->
  <xsl:param name="ulink.hyphenate.chars" select="'/._-'"/>

  <!-- Specify the default text alignment. -->
  <xsl:param name="alignment">justify</xsl:param>

  <!-- Specify the default point size for body text.
       Used for calculating the size of titles. -->
  <xsl:param name="body.font.master">9</xsl:param>

  <!-- Specifies the default font size for body text. -->
  <xsl:param name="body.font.size">12pt</xsl:param>

  <!-- Control generation of ToCs and LoTs -->
  <xsl:param name="generate.toc">
    book      toc,title
    part      nop
  </xsl:param>

  <!-- How deep should recursive sections appear in the TOC? -->
  <xsl:param name="toc.section.depth">1</xsl:param>

  <!-- Amount of indentation for TOC entries. -->
  <xsl:param name="toc.indent.width" select="18"/>

  <!-- Turns page numbers in xrefs on and off. -->
  <xsl:param name="insert.xref.page.number">no</xsl:param>

  <!-- Display URLs after ulinks? 1 = yes, 0 = no
       Set to 0 to prevent duplicate e-mails in the Acknowledgments pages. -->
  <xsl:param name="ulink.show" select="0"/>

  <!-- Processing instruction for hard page breaks.
       FOP-0.93 supports @keep-*.*, @orphans, and @widows attributes,
       that solves several page break issues.
       It also supports the soft page break procesing instruction included
       in the DocBook stylesheets.
       But sometimes we may need hard page breaks for final book versions.
       To understand all of the page break features, see
       http://www.sagehill.net/docbookxsl/PageBreaking.html -->
  <xsl:template match="processing-instruction('hard-pagebreak')">
    <fo:block break-before='page'/>
  </xsl:template>

</xsl:stylesheet>
