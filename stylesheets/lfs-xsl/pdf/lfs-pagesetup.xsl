<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: manuel $
$Date: 2007-07-06 05:18:33 +0800 (Fri, 06 Jul 2007) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">

  <!-- This stylesheet controls page margins, sections page break,
       header content and titles size. -->

    <!-- The inner page margin. -->
  <xsl:param name="page.margin.inner" select="'0.32in'"/>

    <!-- The outer page margin. -->
  <xsl:param name="page.margin.outer" select="'0.32in'"/>

    <!-- The bottom margin of the page. -->
  <xsl:param name="page.margin.bottom" select="'0.35in'"/>

    <!-- The top margin of the page. -->
  <xsl:param name="page.margin.top" select="'0.35in'"/>

    <!-- The bottom margin of the body text. -->
  <xsl:param name="body.margin.bottom" select="'0.4in'"/>

    <!-- The top margin of the body text. -->
  <xsl:param name="body.margin.top" select="'0.4in'"/>

    <!-- Specifies the height of the header. -->
  <xsl:param name="region.before.extent" select="'0.25in'"/>

    <!-- Specifies the height of the footer. -->
  <xsl:param name="region.after.extent" select="'0.25in'"/>

    <!-- The start-indent for the body text. -->
  <xsl:param name="body.start.indent" select="'0pc'"/>

    <!-- Adjust the left margin for titles. -->
  <xsl:param name="title.margin.left">-0.8pc</xsl:param>

    <!-- Default table width on tables that do not specify an alternate
         width using the dbfo processing instruction.
         This value is used also on bookinfo/revhistory table. -->
  <xsl:param name="default.table.width" select="'70%'"/>

    <!-- Properties for component titles -->
  <xsl:attribute-set name="component.title.properties">
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <xsl:attribute name="space-before.optimum">
      <xsl:value-of select="concat($body.font.master, 'pt')"/>
    </xsl:attribute>
    <xsl:attribute name="space-before.minimum">
      <xsl:value-of select="concat($body.font.master, 'pt * 0.8')"/>
    </xsl:attribute>
    <xsl:attribute name="space-before.maximum">
      <xsl:value-of select="concat($body.font.master, 'pt * 1.2')"/>
    </xsl:attribute>
    <xsl:attribute name="hyphenate">false</xsl:attribute>
    <xsl:attribute name="text-align">
      <xsl:choose>
        <xsl:when test="((parent::article | parent::articleinfo |
                          parent::info/parent::article)
                          and not(ancestor::book) and not(self::bibliography))
                        or (parent::slides | parent::slidesinfo)
                        or self::index">center</xsl:when>
        <xsl:otherwise>left</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="start-indent">
      <xsl:value-of select="$title.margin.left"/>
    </xsl:attribute>
  </xsl:attribute-set>

    <!-- Rule under headers? 1 =yes, 0 = no -->
  <xsl:param name="header.rule" select="0"/>

    <!-- Rule over footers? 1 =yes, 0 = no -->
  <xsl:param name="footer.rule" select="0"></xsl:param>

    <!-- Control depth of sections shown in running headers or footers.
         Be sure that no unneeded fo:marker are generated. -->
  <xsl:param name="marker.section.level" select="-1"></xsl:param>

     <!-- Force package's sect1 onto a new page -->
  <xsl:attribute-set name="section.level1.properties">
    <xsl:attribute name="break-before">
      <xsl:choose>
        <!--<xsl:when test="not(. = //*/sect1[1])">
          <xsl:text>page</xsl:text>
        </xsl:when>-->
        <xsl:when test="preceding-sibling::sect1[position()=1]/sect2/@role='package'
                        or self::sect1/sect2/@role='package'">page</xsl:when>
        <xsl:otherwise>
          <xsl:text>auto</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

    <!-- part/partintro:
           Be sure that partintro is on a new page. -->
    <!-- The original template is in {docbook-xsl}/fo/divisions.xsl -->
  <xsl:template match="part/partintro">
    <xsl:apply-templates select=".." mode="part.titlepage.mode">
      <xsl:with-param name="additional.content">
        <fo:block break-before="page"/>
        <xsl:if test="title">
          <xsl:call-template name="partintro.titlepage"/>
        </xsl:if>
        <xsl:apply-templates/>
      </xsl:with-param>
    </xsl:apply-templates>
    <xsl:call-template name="generate.part.toc">
      <xsl:with-param name="part" select=".."/>
    </xsl:call-template>
  </xsl:template>

    <!-- book title:
          Centered the title and removed unused code.
          Removed book.titlepage.separator. -->
    <!-- The original template is in {docbook-xsl}/fo/titlepage.templates.xsl -->
  <xsl:template name="book.titlepage">
    <fo:block margin-top="3in">
      <fo:block>
        <xsl:call-template name="book.titlepage.before.recto"/>
        <xsl:call-template name="book.titlepage.recto"/>
      </fo:block>
      <fo:block>
        <xsl:call-template name="book.titlepage.before.verso"/>
        <xsl:call-template name="book.titlepage.verso"/>
      </fo:block>
    </fo:block>
  </xsl:template>

    <!-- book titlepage verso:
           Added missing bibliosource and revhistory support.
           Removed unused code. -->
    <!-- The original template is in {docbook-xsl}/fo/titlepage.templates.xsl -->
  <xsl:template name="book.titlepage.verso">
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/title"/>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/corpauthor"/>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/authorgroup"/>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/author"/>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/othercredit"/>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/releaseinfo"/>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/pubdate"/>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/copyright"/>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/bibliosource"/>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/abstract"/>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/revhistory"/>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/legalnotice"/>
  </xsl:template>

    <!-- bibliosource:
           Self-made template to handle bibliosource when inside bookinfo. -->
  <xsl:template match="bibliosource" mode="book.titlepage.verso.auto.mode">
    <fo:block font-size="8pt">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

    <!-- part title:
           Centered the title and removed unused code. -->
    <!-- The original template is in {docbook-xsl}/fo/titlepage.templates.xsl -->
  <xsl:template name="part.titlepage">
    <fo:block>
      <fo:block margin-top="3.5in">
        <xsl:call-template name="part.titlepage.before.recto"/>
        <xsl:call-template name="part.titlepage.recto"/>
      </fo:block>
      <fo:block>
        <xsl:call-template name="part.titlepage.before.verso"/>
        <xsl:call-template name="part.titlepage.verso"/>
      </fo:block>
      <xsl:call-template name="part.titlepage.separator"/>
    </fo:block>
  </xsl:template>

    <!-- chapter title:
           Small font size and left alignament. -->
    <!-- The original template is in {docbook-xsl}/fo/titlepage.templates.xsl -->
  <xsl:template match="title" mode="chapter.titlepage.recto.auto.mode">
    <fo:block xsl:use-attribute-sets="chapter.titlepage.recto.style"
              font-size="21pt" font-weight="bold" text-align="left">
      <xsl:call-template name="component.title">
        <xsl:with-param name="node" select="ancestor-or-self::chapter[1]"/>
      </xsl:call-template>
    </fo:block>
  </xsl:template>

    <!-- sect2 title:
           Skip sect2.titlepage run when title is empty.
           Removed unused code. -->
    <!-- The original template is in {docbook-xsl}/fo/sections.xsl -->
  <xsl:template match="sect2">
    <xsl:variable name="id">
      <xsl:call-template name="object.id"/>
    </xsl:variable>
    <fo:block xsl:use-attribute-sets="section.level2.properties">
      <xsl:attribute name="id">
        <xsl:value-of select="$id"/>
      </xsl:attribute>
      <xsl:if test="not(string-length(title)=0)">
        <xsl:call-template name="sect2.titlepage"/>
      </xsl:if>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

   <!-- header.table:
          Re-made template to not generate a fo:table in the header,
          allowing a more simple header.content customization. -->
    <!-- The original template is in {docbook-xsl}/fo/pagesetup.xsl -->
  <xsl:template name="header.table">
    <xsl:param name="sequence" select="''"/>
    <xsl:param name="gentext-key" select="''"/>
    <xsl:choose>
      <xsl:when test="$gentext-key = 'book' or $sequence = 'blank'"/>
      <xsl:otherwise>
        <xsl:call-template name="header.content">
          <xsl:with-param name="sequence" select="$sequence"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

    <!-- header.content
           Re-made template to show the book title and version on all pages. -->
    <!-- The original template is in {docbook-xsl}/fo/pagesetup.xsl -->
  <xsl:template name="header.content">
    <xsl:param name="sequence" select="''"/>
    <fo:block>
      <xsl:attribute name="text-align">
        <xsl:choose>
          <xsl:when test="$sequence = 'first' or $sequence = 'odd'">right</xsl:when>
          <xsl:otherwise>left</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:value-of select="/book/bookinfo/title"/>
      <xsl:text> - </xsl:text>
      <xsl:value-of select="/book/bookinfo/subtitle"/>
    </fo:block>
  </xsl:template>

</xsl:stylesheet>
