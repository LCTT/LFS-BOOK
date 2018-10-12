<?xml version="1.0" encoding="ISO-8859-1"?>

<!--
$LastChangedBy: matthew $
$Date: 2013-10-10 07:46:50 +0800 (Thu, 10 Oct 2013) $
-->

<!DOCTYPE xsl:stylesheet [
<!ENTITY lowercase "'Aa&#192;&#224;&#193;&#225;&#194;&#226;&#195;&#227;&#196;&#228;&#197;&#229;&#256;&#257;&#258;&#259;&#260;&#261;&#461;&#462;&#478;&#479;&#480;&#481;&#506;&#507;&#512;&#513;&#514;&#515;&#550;&#551;&#7680;&#7681;&#7834;&#7840;&#7841;&#7842;&#7843;&#7844;&#7845;&#7846;&#7847;&#7848;&#7849;&#7850;&#7851;&#7852;&#7853;&#7854;&#7855;&#7856;&#7857;&#7858;&#7859;&#7860;&#7861;&#7862;&#7863;Bb&#384;&#385;&#595;&#386;&#387;&#7682;&#7683;&#7684;&#7685;&#7686;&#7687;Cc&#199;&#231;&#262;&#263;&#264;&#265;&#266;&#267;&#268;&#269;&#391;&#392;&#597;&#7688;&#7689;Dd&#270;&#271;&#272;&#273;&#394;&#599;&#395;&#396;&#453;&#498;&#545;&#598;&#7690;&#7691;&#7692;&#7693;&#7694;&#7695;&#7696;&#7697;&#7698;&#7699;Ee&#200;&#232;&#201;&#233;&#202;&#234;&#203;&#235;&#274;&#275;&#276;&#277;&#278;&#279;&#280;&#281;&#282;&#283;&#516;&#517;&#518;&#519;&#552;&#553;&#7700;&#7701;&#7702;&#7703;&#7704;&#7705;&#7706;&#7707;&#7708;&#7709;&#7864;&#7865;&#7866;&#7867;&#7868;&#7869;&#7870;&#7871;&#7872;&#7873;&#7874;&#7875;&#7876;&#7877;&#7878;&#7879;Ff&#401;&#402;&#7710;&#7711;Gg&#284;&#285;&#286;&#287;&#288;&#289;&#290;&#291;&#403;&#608;&#484;&#485;&#486;&#487;&#500;&#501;&#7712;&#7713;Hh&#292;&#293;&#294;&#295;&#542;&#543;&#614;&#7714;&#7715;&#7716;&#7717;&#7718;&#7719;&#7720;&#7721;&#7722;&#7723;&#7830;Ii&#204;&#236;&#205;&#237;&#206;&#238;&#207;&#239;&#296;&#297;&#298;&#299;&#300;&#301;&#302;&#303;&#304;&#407;&#616;&#463;&#464;&#520;&#521;&#522;&#523;&#7724;&#7725;&#7726;&#7727;&#7880;&#7881;&#7882;&#7883;Jj&#308;&#309;&#496;&#669;Kk&#310;&#311;&#408;&#409;&#488;&#489;&#7728;&#7729;&#7730;&#7731;&#7732;&#7733;Ll&#313;&#314;&#315;&#316;&#317;&#318;&#319;&#320;&#321;&#322;&#410;&#456;&#564;&#619;&#620;&#621;&#7734;&#7735;&#7736;&#7737;&#7738;&#7739;&#7740;&#7741;Mm&#625;&#7742;&#7743;&#7744;&#7745;&#7746;&#7747;Nn&#209;&#241;&#323;&#324;&#325;&#326;&#327;&#328;&#413;&#626;&#414;&#544;&#459;&#504;&#505;&#565;&#627;&#7748;&#7749;&#7750;&#7751;&#7752;&#7753;&#7754;&#7755;Oo&#210;&#242;&#211;&#243;&#212;&#244;&#213;&#245;&#214;&#246;&#216;&#248;&#332;&#333;&#334;&#335;&#336;&#337;&#415;&#416;&#417;&#465;&#466;&#490;&#491;&#492;&#493;&#510;&#511;&#524;&#525;&#526;&#527;&#554;&#555;&#556;&#557;&#558;&#559;&#560;&#561;&#7756;&#7757;&#7758;&#7759;&#7760;&#7761;&#7762;&#7763;&#7884;&#7885;&#7886;&#7887;&#7888;&#7889;&#7890;&#7891;&#7892;&#7893;&#7894;&#7895;&#7896;&#7897;&#7898;&#7899;&#7900;&#7901;&#7902;&#7903;&#7904;&#7905;&#7906;&#7907;Pp&#420;&#421;&#7764;&#7765;&#7766;&#7767;Qq&#672;Rr&#340;&#341;&#342;&#343;&#344;&#345;&#528;&#529;&#530;&#531;&#636;&#637;&#638;&#7768;&#7769;&#7770;&#7771;&#7772;&#7773;&#7774;&#7775;Ss&#346;&#347;&#348;&#349;&#350;&#351;&#352;&#353;&#536;&#537;&#642;&#7776;&#7777;&#7778;&#7779;&#7780;&#7781;&#7782;&#7783;&#7784;&#7785;Tt&#354;&#355;&#356;&#357;&#358;&#359;&#427;&#428;&#429;&#430;&#648;&#538;&#539;&#566;&#7786;&#7787;&#7788;&#7789;&#7790;&#7791;&#7792;&#7793;&#7831;Uu&#217;&#249;&#218;&#250;&#219;&#251;&#220;&#252;&#360;&#361;&#362;&#363;&#364;&#365;&#366;&#367;&#368;&#369;&#370;&#371;&#431;&#432;&#467;&#468;&#469;&#470;&#471;&#472;&#473;&#474;&#475;&#476;&#532;&#533;&#534;&#535;&#7794;&#7795;&#7796;&#7797;&#7798;&#7799;&#7800;&#7801;&#7802;&#7803;&#7908;&#7909;&#7910;&#7911;&#7912;&#7913;&#7914;&#7915;&#7916;&#7917;&#7918;&#7919;&#7920;&#7921;Vv&#434;&#651;&#7804;&#7805;&#7806;&#7807;Ww&#372;&#373;&#7808;&#7809;&#7810;&#7811;&#7812;&#7813;&#7814;&#7815;&#7816;&#7817;&#7832;Xx&#7818;&#7819;&#7820;&#7821;Yy&#221;&#253;&#255;&#376;&#374;&#375;&#435;&#436;&#562;&#563;&#7822;&#7823;&#7833;&#7922;&#7923;&#7924;&#7925;&#7926;&#7927;&#7928;&#7929;Zz&#377;&#378;&#379;&#380;&#381;&#382;&#437;&#438;&#548;&#549;&#656;&#657;&#7824;&#7825;&#7826;&#7827;&#7828;&#7829;&#7829;'">
<!ENTITY uppercase "'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBCCCCCCCCCCCCCCCCCDDDDDDDDDDDDDDDDDDDDDDDDEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEFFFFFFGGGGGGGGGGGGGGGGGGGGHHHHHHHHHHHHHHHHHHHHIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIJJJJJJKKKKKKKKKKKKKKLLLLLLLLLLLLLLLLLLLLLLLLLLMMMMMMMMMNNNNNNNNNNNNNNNNNNNNNNNNNNNOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOPPPPPPPPQQQRRRRRRRRRRRRRRRRRRRRRRRSSSSSSSSSSSSSSSSSSSSSSSTTTTTTTTTTTTTTTTTTTTTTTTTUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUVVVVVVVVWWWWWWWWWWWWWWWXXXXXXYYYYYYYYYYYYYYYYYYYYYYYZZZZZZZZZZZZZZZZZZZZZ'">
<!ENTITY primary   'normalize-space(concat(primary/@sortas, primary[not(@sortas) or @sortas = ""]))'>
<!ENTITY secondary 'normalize-space(concat(secondary/@sortas, secondary[not(@sortas) or @sortas = ""]))'>
<!ENTITY scope     "count(ancestor::node()|$scope) = count(ancestor::node())">
<!ENTITY section   "(ancestor-or-self::set |ancestor-or-self::book |ancestor-or-self::part |ancestor-or-self::reference |ancestor-or-self::partintro |ancestor-or-self::chapter |ancestor-or-self::appendix |ancestor-or-self::preface |ancestor-or-self::article |ancestor-or-self::section |ancestor-or-self::sect1 |ancestor-or-self::sect2 |ancestor-or-self::sect3 |ancestor-or-self::sect4 |ancestor-or-self::sect5 |ancestor-or-self::refentry |ancestor-or-self::refsect1 |ancestor-or-self::refsect2 |ancestor-or-self::refsect3 |ancestor-or-self::simplesect |ancestor-or-self::bibliography |ancestor-or-self::glossary |ancestor-or-self::index |ancestor-or-self::webpage)[last()]">
<!ENTITY section.id "generate-id(&section;)">
<!ENTITY sep '" "'>
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0">

  <!-- Change the file name of the index page from the default ix01.html.
       There is no upstream template with match="index", only a global
       match="*", thus the following is enough to override the index
       filename. -->

  <xsl:template match="index" mode="recursive-chunk-filename">
    <xsl:text>longindex.html</xsl:text>
  </xsl:template>

  <!-- Divisions:
       Override the default division titles, translating them from the default
       'A', 'B', etc. to 'Packages', 'Programs', etc.
       Add gentext support to division titles.
       Use h2 for division titles instead of the default h3.
       Change main listings from dl to ul format.
       The original template is in {docbook-xsl}/xhtml/autoidx.xsl -->

  <xsl:template match="indexterm" mode="index-div-basic">
    <xsl:param name="scope" select="."/>
    <xsl:variable name="key" select="translate(substring(&primary;, 1, 1),&lowercase;,&uppercase;)"/>
    <xsl:variable name="divtitle" select="translate($key, &lowercase;, &uppercase;)"/>
    <!-- Make sure that we don't generate a div if there are no terms in scope
   -->
    <xsl:if test="key('letter', $key)[&scope;] [count(.|key('primary', &primary;)[&scope;][1]) = 1]">
      <xsl:if test="contains(concat(&lowercase;, &uppercase;), $key)">
        <h2>
          <xsl:choose>
            <xsl:when test="$divtitle = 'A'">
              <a id="package-index" name="package-index"/>
              <xsl:call-template name="gentext">
                <xsl:with-param name="key">Packages</xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:when test="$divtitle = 'B'">
              <a id="program-index" name="program-index"/>
              <xsl:call-template name="gentext">
                <xsl:with-param name="key">Programs</xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:when test="$divtitle = 'C'">
              <a id="library-index" name="library-index"/>
              <xsl:call-template name="gentext">
                <xsl:with-param name="key">Libraries</xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:when test="$divtitle = 'D'">
              <xsl:choose>
                <xsl:when test="$book-type = 'blfs'">
                  <a id="kernel-config-index" name="kernel-config-index"/>
                  <xsl:call-template name="gentext">
                    <xsl:with-param name="key">Kernel Configuration</xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <a id="scripts-index" name="scripts-index"/>
                  <xsl:call-template name="gentext">
                    <xsl:with-param name="key">Scripts</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$divtitle = 'E'">
              <xsl:choose>
                <xsl:when test="$book-type = 'blfs'">
                  <a id="config-file-index" name="config-file-index"/>
                  <xsl:call-template name="gentext">
                    <xsl:with-param name="key">Configuration Files</xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <a id="other-index" name="other-index"/>
                  <xsl:call-template name="gentext">
                    <xsl:with-param name="key">Others</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$divtitle = 'F'">
                <a id="bootscript-index" name="bootscript-index"/>
                <xsl:call-template name="gentext">
                  <xsl:with-param name="key">Bootscripts</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$divtitle = 'G'">
              <a id="other-index" name="other-index"/>
              <xsl:call-template name="gentext">
                <xsl:with-param name="key">Others</xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$divtitle"/>
            </xsl:otherwise>
          </xsl:choose>
        </h2>
      </xsl:if>
      <ul>
      <xsl:apply-templates select="key('letter', $key)[count(ancestor::node()|$scope) = count(ancestor::node())][count(.|key('primary', normalize-space(concat(primary/@sortas, &quot; &quot;, primary)))[count(ancestor::node()|$scope) = count(ancestor::node())][1])=1]" mode="index-primary">
        <xsl:with-param name="scope" select="$scope"/>
        <xsl:sort select="translate(&primary;, &lowercase;, &uppercase;)"/>
      </xsl:apply-templates>
      </ul>
    </xsl:if>
  </xsl:template>

  <!-- Primary items:
       Place term and separator into strong tags.
       Place target links into a div.
       Change main listings from dl to ul format.
       Removed code for unused see and sealso children.
       The original template is in {docbook-xsl}/xhtml/autoidx.xsl -->
  <xsl:template match="indexterm" mode="index-primary">
    <xsl:param name="scope" select="."/>
    <xsl:variable name="key" select="normalize-space(concat(primary/@sortas, &quot; &quot;, primary))"/>
    <xsl:variable name="refs" select="key('primary', $key)[count(ancestor::node()|$scope) = count(ancestor::node())]"/>
    <li>
      <strong class="item">
        <xsl:value-of select="primary"/>
        <xsl:text>: </xsl:text>
      </strong>
      <span class='indexref'>
        <xsl:for-each select="$refs[generate-id() = generate-id(key('primary-section',concat($key, &sep;, &section.id;))[&scope;][1])]">
        <!--<xsl:for-each select="$refs[not(see) and not(secondary)][count(ancestor::node()|$scope) = count(ancestor::node()) = 0]">-->
          <xsl:apply-templates select="." mode="reference">
            <xsl:with-param name="scope" select="$scope"/>
          </xsl:apply-templates>
        </xsl:for-each>
      </span>
      <xsl:if test="$refs/secondary">
        <ul>
          <xsl:apply-templates select="$refs[secondary and count(.|key('secondary', concat($key, &quot; &quot;, normalize-space(concat(secondary/@sortas, &quot; &quot;, secondary))))[count(ancestor::node()|$scope) = count(ancestor::node()) ][1]) = 1]" mode="index-secondary">
            <xsl:with-param name="scope" select="$scope"/>
            <xsl:sort select="translate(&secondary;, &lowercase;, &uppercase;)"/>
          </xsl:apply-templates>
         </ul>
      </xsl:if>
    </li>
  </xsl:template>

  <!-- Secondary items:
       Place term and separator into strong tags.
       Place target links into a div.
       Change main listings from dl to ul format.
       Removed code for unused tertiary, see and sealso children.
       The original template is in {docbook-xsl}/xhtml/autoidx.xsl -->
  <xsl:template match="indexterm" mode="index-secondary">
    <xsl:param name="scope" select="."/>
    <xsl:variable name="key" select="concat(normalize-space(concat(primary/@sortas, &quot; &quot;, primary)), &quot; &quot;, normalize-space(concat(secondary/@sortas, &quot; &quot;, secondary)))"/>
    <xsl:variable name="refs" select="key('secondary', $key)[count(ancestor::node()|$scope) = count(ancestor::node())]"/>
    <li>
      <strong class="secitem">
        <xsl:value-of select="secondary"/>
        <xsl:text>: </xsl:text>
      </strong>
      <span class='indexref'>
        <xsl:for-each select="$refs[generate-id() = generate-id(key('secondary-section', concat($key, &sep;, &section.id;))[&scope;][1])]">
          <xsl:apply-templates select="." mode="reference">
            <xsl:with-param name="scope" select="$scope"/>
          </xsl:apply-templates>
        </xsl:for-each>
      </span>
    </li>
  </xsl:template>

  <!-- Drop $term.separator and $number.separator from here as customized ones
       are added in the output flow.
       As all the indexterms in the book have @zone attributes, removed a lot of
       unused code.
       The original template is in {docbook-xsl}/xhtml/autoidx.xsl -->
  <xsl:template match="indexterm" mode="reference">
    <xsl:param name="scope" select="."/>
    <xsl:call-template name="reference">
      <xsl:with-param name="zones" select="normalize-space(@zone)"/>
      <xsl:with-param name="scope" select="$scope"/>
    </xsl:call-template>
  </xsl:template>

  <!-- The target links:
       Changed link separator
       On the second @zone link, we use a fixed string for the text with gentext
       support.
       Assume that there are no more than 2 @zone in a indexterm.
       Use href.target.uri named template to resolve the links. It is faster
       than the default href.target named template.
       The original template is in {docbook-xsl}/xhtml/autoidx.xsl -->
  <xsl:template name="reference">
    <xsl:param name="scope" select="."/>
    <xsl:param name="zones"/>
    <xsl:choose>
      <xsl:when test="contains($zones, ' ')">
        <xsl:variable name="zone" select="substring-before($zones, ' ')"/>
        <xsl:variable name="zone2" select="substring-after($zones, ' ')"/>
        <xsl:variable name="target" select="key('sections', $zone)[&scope;]"/>
        <xsl:variable name="target2" select="key('sections', $zone2)[&scope;]"/>
        <a>
          <xsl:attribute name="href">
            <xsl:call-template name="href.target.uri">
              <xsl:with-param name="object" select="$target[1]"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:apply-templates select="$target[1]" mode="index-title-content"/>
        </a>
        <xsl:text> -- </xsl:text>
        <a>
          <xsl:attribute name="href">
            <xsl:call-template name="href.target.uri">
              <xsl:with-param name="object" select="$target2[1]"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:call-template name="gentext">
            <xsl:with-param name="key">description</xsl:with-param>
          </xsl:call-template>
        </a>
        <br/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="zone" select="$zones"/>
        <xsl:variable name="target" select="key('sections', $zone)[&scope;]"/>
        <a>
          <xsl:attribute name="href">
            <xsl:call-template name="href.target.uri">
              <xsl:with-param name="object" select="$target[1]"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:apply-templates select="$target[1]" mode="index-title-content"/>
        </a>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
