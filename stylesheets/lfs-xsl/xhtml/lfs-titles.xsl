<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: manuel $
$Date: 2007-07-06 05:18:33 +0800 (Fri, 06 Jul 2007) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0">

  <!-- This stylesheet controls the h* xhtml tags used for several titles -->

    <!-- preface.titlepage:
           Uses h1 and removed a lot of unneeded code.
           No label in preface. -->
    <!-- The original template is in {docbook-xsl}/xhtml/titlepage.templates.xsl -->
  <xsl:template name="preface.titlepage">
    <h1 class="{name(.)}">
      <xsl:if test="@id">
        <a id="{@id}" name="{@id}"/>
      </xsl:if>
      <xsl:value-of select="title"/>
    </h1>
  </xsl:template>

    <!-- part.titlepage:
           Uses h1 and removed a lot of unneeded code.
           When sections are not labeled, we want the part label in TOC
           but not in titlepage. -->
    <!-- The original template is in {docbook-xsl}/xhtml/titlepage.templates.xsl -->
  <xsl:template name="part.titlepage">
    <h1 class="{name(.)}">
      <xsl:if test="@id">
        <a id="{@id}" name="{@id}"/>
      </xsl:if>
      <xsl:if test="$section.autolabel != 0">
        <xsl:apply-templates select="." mode="label.markup"/>
        <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:value-of select="title"/>
    </h1>
  </xsl:template>

    <!-- partintro.titlepage:
           Uses h2 and removed a lot of unneeded code. -->
    <!-- The original template is in {docbook-xsl}/xhtml/titlepage.templates.xsl -->
  <xsl:template name="partintro.titlepage">
    <xsl:if test="title">
      <h2 class="{name(.)}">
        <xsl:if test="@id">
          <a id="{@id}" name="{@id}"/>
        </xsl:if>
        <xsl:value-of select="title"/>
      </h2>
    </xsl:if>
  </xsl:template>

    <!-- appendix.titlepage:
           Uses h1 and removed a lot of unneeded code.
           When sections are not labeled, we want the appendix label in TOC
           but not in titlepage. -->
    <!-- The original template is in {docbook-xsl}/xhtml/titlepage.templates.xsl -->
  <xsl:template name="appendix.titlepage">
    <h1 class="{name(.)}">
      <xsl:if test="@id">
        <a id="{@id}" name="{@id}"/>
      </xsl:if>
      <xsl:if test="$section.autolabel != 0">
        <xsl:apply-templates select="." mode="label.markup"/>
        <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:value-of select="title"/>
    </h1>
  </xsl:template>

    <!-- chapter.titlepage:
           Uses h1 and removed a lot of unneeded code.
           When sections are not labeled, we want the chapter label in TOC
           but not in titlepage. -->
    <!-- The original template is in {docbook-xsl}/xhtml/titlepage.templates.xsl -->
  <xsl:template name="chapter.titlepage">
    <h1 class="{name(.)}">
      <xsl:if test="@id">
        <a id="{@id}" name="{@id}"/>
      </xsl:if>
      <xsl:if test="$section.autolabel != 0">
        <xsl:apply-templates select="." mode="label.markup"/>
        <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:value-of select="title"/>
    </h1>
  </xsl:template>

    <!-- sect1.titlepage:
           Uses h1 and removed a lot of unneeded code. -->
    <!-- The original template is in {docbook-xsl}/xhtml/titlepage.templates.xsl -->
  <xsl:template name="sect1.titlepage">
    <h1 class="{name(.)}">
      <xsl:if test="@id">
        <a id="{@id}" name="{@id}"/>
      </xsl:if>
      <xsl:if test="$section.autolabel != 0">
        <xsl:apply-templates select="." mode="label.markup"/>
        <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:value-of select="title"/>
    </h1>
  </xsl:template>

    <!-- sect2.titlepage:
           Uses h2 and removed a lot of unneeded code.
           Skip empty titles.
           No label in preface. -->
    <!-- The original template is in {docbook-xsl}/xhtml/titlepage.templates.xsl -->
  <xsl:template name="sect2.titlepage">
    <xsl:choose>
      <xsl:when test="string-length(title) = 0"/>
      <xsl:otherwise>
        <h2 class="{name(.)}">
          <xsl:if test="@id">
            <a id="{@id}" name="{@id}"/>
          </xsl:if>
          <xsl:if test="not(ancestor::preface) and $section.autolabel != 0">
            <xsl:apply-templates select="." mode="label.markup"/>
            <xsl:text>. </xsl:text>
          </xsl:if>
          <xsl:value-of select="title"/>
        </h2>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

    <!-- sect3.titlepage:
           Uses h3 and removed a lot of unneeded code. -->
    <!-- The original template is in {docbook-xsl}/xhtml/titlepage.templates.xsl -->
  <xsl:template name="sect3.titlepage">
    <h3 class="{name(.)}">
      <xsl:if test="@id">
        <a id="{@id}" name="{@id}"/>
      </xsl:if>
      <xsl:if test="$section.autolabel != 0">
        <xsl:apply-templates select="." mode="label.markup"/>
        <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:value-of select="title"/>
    </h3>
  </xsl:template>

    <!-- dedication.titlepage:
           Uses h2 and removed a lot of unneeded code. -->
    <!-- The original template is in {docbook-xsl}/xhtml/titlepage.templates.xsl -->
  <xsl:template name="dedication.titlepage">
    <h2>
      <xsl:value-of select="title"/>
    </h2>
  </xsl:template>

    <!-- bridgehead:
           We use always renderas attributes and want the output h* level
           matching the defined sect* level.
           Create the anchor only if there is an @id. -->
    <!-- The original template is in {docbook-xsl}/xhtml/sections.xsl -->
  <xsl:template match="bridgehead">
    <xsl:variable name="hlevel">
      <xsl:choose>
        <xsl:when test="@renderas = 'sect1'">1</xsl:when>
        <xsl:when test="@renderas = 'sect2'">2</xsl:when>
        <xsl:when test="@renderas = 'sect3'">3</xsl:when>
        <xsl:when test="@renderas = 'sect4'">4</xsl:when>
        <xsl:when test="@renderas = 'sect5'">5</xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:element name="h{$hlevel}" namespace="http://www.w3.org/1999/xhtml">
      <xsl:if test="@id">
        <a id="{@id}" name="{@id}"/>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

    <!-- book.titlepage.verso:
           Process bookinfo/bibliosource from here. -->
    <!-- The original template is in {docbook-xsl}/xhtml/titlepage.templates.xsl -->
  <xsl:template name="book.titlepage.verso">
    <xsl:apply-templates select="bookinfo/bibliosource"/>
  </xsl:template>

    <!-- bookinfo/bibliosource:
           Self-made template to handle bibliosource when inside bookinfo. -->
  <xsl:template match="bookinfo/bibliosource">
    <p class="copyright">
      <xsl:apply-templates/>
    </p>
  </xsl:template>

</xsl:stylesheet>
