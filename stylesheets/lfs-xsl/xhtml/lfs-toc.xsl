<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: manuel $
$Date: 2007-07-06 05:18:33 +0800 (Fri, 06 Jul 2007) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0">

  <!-- This stylesheet controls how the TOC are generated -->

    <!-- make.toc:
           Using h3 for TOC title.
           Using ul for TOC list style.
           Removed code for $manual.toc and $qanda.in.toc -->
    <!-- The original template is in {docbook-xsl}/xhtml/autotoc.xsl -->
  <xsl:template name="make.toc">
    <xsl:param name="toc-context" select="."/>
    <xsl:param name="nodes" select="/NOT-AN-ELEMENT"/>
    <xsl:if test="$nodes">
      <div class="toc">
        <h3>
          <xsl:call-template name="gentext">
            <xsl:with-param name="key">TableofContents</xsl:with-param>
          </xsl:call-template>
        </h3>
        <ul>
          <xsl:apply-templates select="$nodes" mode="toc">
            <xsl:with-param name="toc-context" select="$toc-context"/>
          </xsl:apply-templates>
        </ul>
      </div>
    </xsl:if>
  </xsl:template>

    <!-- subtoc:
           Using ul for TOC list style.
           Removed code for $qanda.in.toc
           Removed code for sect* others than sect1 -->
    <!-- The original template is in {docbook-xsl}/xhtml/autotoc.xsl -->
  <xsl:template name="subtoc">
    <xsl:param name="toc-context" select="."/>
    <xsl:param name="nodes" select="NOT-AN-ELEMENT"/>
    <xsl:variable name="subtoc">
      <ul>
        <xsl:apply-templates mode="toc" select="$nodes">
          <xsl:with-param name="toc-context" select="$toc-context"/>
        </xsl:apply-templates>
      </ul>
    </xsl:variable>
    <xsl:variable name="depth">
      <xsl:choose>
        <xsl:when test="local-name(.) = 'sect1'">1</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="depth.from.context"
                  select="count(ancestor::*)-count($toc-context/ancestor::*)"/>
    <li class="{name(.)}">
      <xsl:call-template name="toc.line">
        <xsl:with-param name="toc-context" select="$toc-context"/>
      </xsl:call-template>
      <xsl:if test="$toc.section.depth &gt; $depth and count($nodes)&gt;0
                    and $toc.max.depth &gt; $depth.from.context">
        <xsl:copy-of select="$subtoc"/>
      </xsl:if>
    </li>
  </xsl:template>

    <!-- toc.line:
           Adding the h* tags and dropping unneded links.
           This template is a full re-made version of the original one. -->
    <!-- The original template is in {docbook-xsl}/xhtml/autotoc.xsl -->
  <xsl:template name="toc.line">
    <xsl:param name="toc-context" select="."/>
    <xsl:choose>
        <!-- For non dummy sect1 targets, create a link. -->
      <xsl:when test="local-name(.) = 'sect1'">
        <xsl:choose>
          <xsl:when test="@role='dummy'">
            <span class="dummy">
              <xsl:apply-templates select="." mode="titleabbrev.markup"/>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <a>
              <xsl:attribute name="href">
                <xsl:call-template name="href.target">
                  <xsl:with-param name="context" select="$toc-context"/>
                </xsl:call-template>
              </xsl:attribute>
              <xsl:apply-templates select="." mode="titleabbrev.markup"/>
            </a>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
        <!-- For part, preface, and chapter, use hX and add the label.
             For BLFS, make it a link. -->
      <xsl:when test="local-name(.) = 'part' or local-name(.) = 'preface'
                      or local-name(.) = 'chapter'">
        <xsl:choose>
          <xsl:when test="$book-type = 'blfs'">
            <xsl:apply-templates select="." mode="add.hX">
              <xsl:with-param name="toc-context" select="$toc-context"/>
              <xsl:with-param name="with-link" select="1"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="." mode="add.hX">
              <xsl:with-param name="toc-context" select="$toc-context"/>
              <xsl:with-param name="with-link" select="0"/>
            </xsl:apply-templates>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
        <!-- For appendix , create a link and add the label.
             For BLFS, use hX. -->
      <xsl:when test="local-name(.) = 'appendix'">
        <xsl:choose>
          <xsl:when test="$book-type = 'blfs'">
            <xsl:apply-templates select="." mode="add.hX">
              <xsl:with-param name="toc-context" select="$toc-context"/>
              <xsl:with-param name="with-link" select="1"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="." mode="add.link">
              <xsl:with-param name="toc-context" select="$toc-context"/>
            </xsl:apply-templates>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
        <!-- For other targets like Index, use hX, create a link, and label it. -->
      <xsl:otherwise>
        <xsl:apply-templates select="." mode="add.hX">
          <xsl:with-param name="toc-context" select="$toc-context"/>
          <xsl:with-param name="with-link" select="1"/>
        </xsl:apply-templates>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

    <!-- Self-made template to add hX tags to toc lines. -->
  <xsl:template match="*" mode="add.hX">
    <xsl:param name="toc-context" select="."/>
    <xsl:param name="with-link" select="0"/>
    <xsl:param name="hlevel">
      <xsl:choose>
        <xsl:when test="local-name(.)='chapter' or local-name(.)='preface'">4</xsl:when>
        <xsl:otherwise>3</xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <xsl:element name="h{$hlevel}" namespace="http://www.w3.org/1999/xhtml">
      <xsl:choose>
        <xsl:when test="$with-link != 0">
          <xsl:apply-templates select="." mode="add.link">
            <xsl:with-param name="toc-context" select="$toc-context"/>
          </xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="." mode="label.and.title"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>

    <!-- Self-made template to made toc line a link. -->
  <xsl:template match="*" mode="add.link">
    <xsl:param name="toc-context" select="."/>
    <a>
      <xsl:attribute name="href">
        <xsl:call-template name="href.target">
          <xsl:with-param name="context" select="$toc-context"/>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:apply-templates select="." mode="label.and.title"/>
    </a>
  </xsl:template>

    <!-- Self-made template to write the target title and label it. -->
  <xsl:template match="*" mode="label.and.title">
    <xsl:variable name="label">
      <xsl:apply-templates select="." mode="label.markup"/>
    </xsl:variable>
    <xsl:copy-of select="$label"/>
    <xsl:if test="$label != ''">
      <xsl:value-of select="$autotoc.label.separator"/>
    </xsl:if>
    <xsl:apply-templates select="." mode="titleabbrev.markup"/>
  </xsl:template>

</xsl:stylesheet>
