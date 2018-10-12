<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: bdubbs $
$Date: 2012-08-30 04:45:23 +0800 (Thu, 30 Aug 2012) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0">

  <!-- This stylesheet contains common params and templates for all outputs. -->

    <!-- This file contains our localization strings (for internationalization) -->
  <xsl:param name="local.l10n.xml" select="document('lfs-l10n.xml')"/>


<!-- INDEX -->

    <!-- Should the Index be generated? 1 = yes, 0 = no -->
  <xsl:param name="generate.index" select="1"></xsl:param>

    <!-- The indexing method used. Only 'basic' is supported by xsltproc -->
  <xsl:param name="index.method" select="'basic'"></xsl:param>

    <!-- The Index title:
           We create this param to can have gentext support in both
           the Index page title and links that point to the Index page.
           It also allow us to change the title, if wanted.
           Note: To change the title involves creating the appropriate
           entries in lfs-l10n.xml -->
  <xsl:param name="index-title">Index</xsl:param>

    <!-- Index title generation. -->
    <!-- The original template is in {docbook-xsl}/common/titles.xsl -->
  <xsl:template match="index" mode="title.markup">
    <xsl:param name="allow-anchors" select="0"/>
    <xsl:call-template name="gentext">
      <xsl:with-param name="key" select="$index-title"/>
    </xsl:call-template>
  </xsl:template>

    <!-- indexterm:
           Dropping unneeded anchors and fo:wraper elemments. -->
    <!-- The original templates are in {docbook-xsl}/{xhtml,fo}/index.xsl -->
  <xsl:template match="indexterm"/>

<!-- -->

<!-- LABELS -->

    <!-- Are sections enumerated? 1 = yes, 0 = no -->
  <xsl:param name="section.autolabel" select="1"/>

    <!-- Do section labels include the component label? 1 = yes, 0 = no -->
  <xsl:param name="section.label.includes.component.label" select="1"/>

    <!-- sect1 label.markup:
           Use lowercase roman numbers for sect1 in preface. -->
    <!-- The original template is in {docbook-xsl}/common/labels.xsl -->
  <xsl:template match="sect1" mode="label.markup">
    <!-- if the parent is a component, maybe label that too -->
    <xsl:variable name="parent.is.component">
      <xsl:call-template name="is.component">
        <xsl:with-param name="node" select=".."/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="component.label">
      <xsl:if test="$section.label.includes.component.label != 0
                    and $parent.is.component != 0">
        <xsl:variable name="parent.label">
          <xsl:apply-templates select=".." mode="label.markup"/>
        </xsl:variable>
        <xsl:if test="$parent.label != ''">
          <xsl:apply-templates select=".." mode="label.markup"/>
          <xsl:apply-templates select=".." mode="intralabel.punctuation"/>
        </xsl:if>
      </xsl:if>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="@label">
        <xsl:value-of select="@label"/>
      </xsl:when>
      <xsl:when test="$section.autolabel != 0">
        <xsl:copy-of select="$component.label"/>
        <xsl:choose>
          <xsl:when test="ancestor::preface">
            <xsl:number format="i" count="sect1"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:number format="1" count="sect1"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

    <!-- sect2 label.markup:
           Skip numeration for sect2 with empty title. -->
    <!-- The original template is in {docbook-xsl}/common/labels.xsl
         It match also sect3, sect4, and sect5, that are unchanged. -->
  <xsl:template match="sect2" mode="label.markup">
      <!-- label the parent -->
      <xsl:variable name="parent.section.label">
        <xsl:call-template name="label.this.section">
          <xsl:with-param name="section" select=".."/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="$parent.section.label != '0'">
        <xsl:apply-templates select=".." mode="label.markup"/>
        <xsl:apply-templates select=".." mode="intralabel.punctuation"/>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="@label">
          <xsl:value-of select="@label"/>
        </xsl:when>
        <xsl:when test="$section.autolabel != 0">
          <xsl:choose>
            <!-- If the first sect2 isn't numbered, renumber the remainig sections -->
            <xsl:when test="string-length(../sect2[1]/title) = 0">
              <xsl:variable name="totalsect2">
                <xsl:number count="sect2"/>
              </xsl:variable>
              <xsl:number value="$totalsect2 - 1"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:number count="sect2"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
      </xsl:choose>
  </xsl:template>

    <!-- object.title.template:
           Skip numeration for sectX > sect1 in preface. -->
    <!-- The original template is in {docbook-xsl}/common/gentext.xsl. -->
  <xsl:template match="section|sect1|sect2|sect3|sect4|sect5|simplesect|bridgehead"
                mode="object.title.template">
    <xsl:variable name="is.numbered">
      <xsl:call-template name="label.this.section"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$is.numbered != 0 and not(ancestor::preface/sect1)">
        <xsl:call-template name="gentext.template">
          <xsl:with-param name="context" select="'title-numbered'"/>
          <xsl:with-param name="name">
            <xsl:call-template name="xpath.location"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="gentext.template">
          <xsl:with-param name="context" select="'title-unnumbered'"/>
          <xsl:with-param name="name">
            <xsl:call-template name="xpath.location"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

<!-- -->

<!-- XREF (see {xhtml,pdf}/xref.xsl) -->

    <!-- mode object.xref.markup:
           Propagate role to named template substitute-markup -->
    <!-- The original template is in {docbook-xsl}/common/gentext.xsl -->
  <xsl:template match="*" mode="object.xref.markup">
    <xsl:param name="purpose"/>
    <xsl:param name="xrefstyle"/>
    <xsl:param name="referrer"/>
    <xsl:param name="verbose" select="1"/>
    <xsl:param name="role"/>
    <xsl:variable name="template">
      <xsl:choose>
        <xsl:when test="starts-with(normalize-space($xrefstyle), 'select:')">
          <xsl:call-template name="make.gentext.template">
            <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
            <xsl:with-param name="purpose" select="$purpose"/>
            <xsl:with-param name="referrer" select="$referrer"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="starts-with(normalize-space($xrefstyle), 'template:')">
          <xsl:value-of select="substring-after(normalize-space($xrefstyle), 'template:')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="." mode="object.xref.template">
            <xsl:with-param name="purpose" select="$purpose"/>
            <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
            <xsl:with-param name="referrer" select="$referrer"/>
          </xsl:apply-templates>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="$template = '' and $verbose != 0">
      <xsl:message>
        <xsl:text>object.xref.markup: empty xref template</xsl:text>
        <xsl:text> for linkend="</xsl:text>
        <xsl:value-of select="@id|@xml:id"/>
        <xsl:text>" and @xrefstyle="</xsl:text>
        <xsl:value-of select="$xrefstyle"/>
        <xsl:text>"</xsl:text>
      </xsl:message>
    </xsl:if>
    <xsl:call-template name="substitute-markup">
      <xsl:with-param name="purpose" select="$purpose"/>
      <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
      <xsl:with-param name="referrer" select="$referrer"/>
      <xsl:with-param name="template" select="$template"/>
      <xsl:with-param name="verbose" select="$verbose"/>
      <xsl:with-param name="role" select="$role"/>
    </xsl:call-template>
  </xsl:template>

    <!-- substitute-markup:
           Propagate role to mode insert.title.markup -->
    <!-- The original template is in {docbook-xsl}/common/gentext.xsl -->
  <xsl:template name="substitute-markup">
    <xsl:param name="template" select="''"/>
    <xsl:param name="allow-anchors" select="'0'"/>
    <xsl:param name="title" select="''"/>
    <xsl:param name="subtitle" select="''"/>
    <xsl:param name="docname" select="''"/>
    <xsl:param name="label" select="''"/>
    <xsl:param name="pagenumber" select="''"/>
    <xsl:param name="purpose"/>
    <xsl:param name="xrefstyle"/>
    <xsl:param name="referrer"/>
    <xsl:param name="verbose"/>
    <xsl:param name="role"/>
    <xsl:choose>
      <xsl:when test="contains($template, '%')">
        <xsl:value-of select="substring-before($template, '%')"/>
        <xsl:variable name="candidate"
                      select="substring(substring-after($template, '%'), 1, 1)"/>
        <xsl:choose>
          <xsl:when test="$candidate = 't'">
            <xsl:apply-templates select="." mode="insert.title.markup">
              <xsl:with-param name="purpose" select="$purpose"/>
              <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
              <xsl:with-param name="role" select="$role"/>
              <xsl:with-param name="title">
                <xsl:choose>
                  <xsl:when test="$title != ''">
                    <xsl:copy-of select="$title"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="." mode="title.markup">
                      <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
                      <xsl:with-param name="verbose" select="$verbose"/>
                    </xsl:apply-templates>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$candidate = 's'">
            <xsl:apply-templates select="." mode="insert.subtitle.markup">
              <xsl:with-param name="purpose" select="$purpose"/>
              <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
              <xsl:with-param name="subtitle">
                <xsl:choose>
                  <xsl:when test="$subtitle != ''">
                    <xsl:copy-of select="$subtitle"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="." mode="subtitle.markup">
                      <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
                    </xsl:apply-templates>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$candidate = 'n'">
            <xsl:apply-templates select="." mode="insert.label.markup">
              <xsl:with-param name="purpose" select="$purpose"/>
              <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
              <xsl:with-param name="label">
                <xsl:choose>
                  <xsl:when test="$label != ''">
                    <xsl:copy-of select="$label"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="." mode="label.markup"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$candidate = 'p'">
            <xsl:apply-templates select="." mode="insert.pagenumber.markup">
              <xsl:with-param name="purpose" select="$purpose"/>
              <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
              <xsl:with-param name="pagenumber">
                <xsl:choose>
                  <xsl:when test="$pagenumber != ''">
                    <xsl:copy-of select="$pagenumber"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="." mode="pagenumber.markup"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$candidate = 'o'">
            <!-- olink target document title -->
            <xsl:apply-templates select="." mode="insert.olink.docname.markup">
              <xsl:with-param name="purpose" select="$purpose"/>
              <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
              <xsl:with-param name="docname">
                <xsl:choose>
                  <xsl:when test="$docname != ''">
                    <xsl:copy-of select="$docname"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="." mode="olink.docname.markup"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$candidate = 'd'">
            <xsl:apply-templates select="." mode="insert.direction.markup">
              <xsl:with-param name="purpose" select="$purpose"/>
              <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
              <xsl:with-param name="direction">
                <xsl:choose>
                  <xsl:when test="$referrer">
                    <xsl:variable name="referent-is-below">
                      <xsl:for-each select="preceding::xref">
                        <xsl:if test="generate-id(.) = generate-id($referrer)">1</xsl:if>
                      </xsl:for-each>
                    </xsl:variable>
                    <xsl:choose>
                      <xsl:when test="$referent-is-below = ''">
                        <xsl:call-template name="gentext">
                          <xsl:with-param name="key" select="'above'"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="gentext">
                          <xsl:with-param name="key" select="'below'"/>
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:message>Attempt to use %d in gentext with no referrer!</xsl:message>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$candidate = '%' ">
            <xsl:text>%</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>%</xsl:text><xsl:value-of select="$candidate"/>
          </xsl:otherwise>
        </xsl:choose>
        <!-- recurse with the rest of the template string -->
        <xsl:variable name="rest"
              select="substring($template,
              string-length(substring-before($template, '%'))+3)"/>
        <xsl:call-template name="substitute-markup">
          <xsl:with-param name="template" select="$rest"/>
          <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
          <xsl:with-param name="title" select="$title"/>
          <xsl:with-param name="subtitle" select="$subtitle"/>
          <xsl:with-param name="docname" select="$docname"/>
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="pagenumber" select="$pagenumber"/>
          <xsl:with-param name="purpose" select="$purpose"/>
          <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
          <xsl:with-param name="referrer" select="$referrer"/>
          <xsl:with-param name="verbose" select="$verbose"/>
          <xsl:with-param name="role" select="$role"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$template"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

<!-- -->

<!-- Total packages size calculation -->

    <!-- returnvalue:
            If the tag is not empty, apply the original template.
            Otherwise apply the calculation template. -->
  <xsl:template match="returnvalue">
    <xsl:choose>
      <xsl:when test="count(*)&gt;0">
        <xsl:apply-imports/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="calculation">
          <xsl:with-param name="scope" select="../../variablelist"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

    <!-- Self-made calculation template. -->
  <xsl:template name="calculation">
    <xsl:param name="scope"/>
    <xsl:param name="total">0</xsl:param>
    <xsl:param name="position">1</xsl:param>
    <xsl:variable name="tokens" select="count($scope/varlistentry)"/>
    <xsl:variable name="token" select="$scope/varlistentry[$position]/term/token"/>
    <xsl:variable name="size" select="substring-before($token,' KB')"/>
    <xsl:variable name="rawsize">
      <xsl:choose>
        <xsl:when test="contains($size,',')">
          <xsl:value-of select="concat(substring-before($size,','),substring-after($size,','))"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$size"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$position &lt;= $tokens">
        <xsl:call-template name="calculation">
          <xsl:with-param name="scope" select="$scope"/>
          <xsl:with-param name="position" select="$position +1"/>
          <xsl:with-param name="total" select="$total + $rawsize"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$total &lt; '1000'">
            <xsl:value-of select="$total"/>
            <xsl:text>  KB</xsl:text>
          </xsl:when>
          <xsl:when test="$total &gt; '1000' and $total &lt; '5000'">
            <xsl:value-of select="substring($total,1,1)"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="substring($total,2)"/>
            <xsl:text>  KB</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="round($total div 1024)"/>
            <xsl:text>  MB</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

<!-- -->

</xsl:stylesheet>
