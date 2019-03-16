<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: manuel $
$Date: 2007-06-12 20:18:51 +0200 (mar, 12 jun 2007) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0">

    <!-- LFS top-level no-chunk templates. -->
  <xsl:import href="lfs-xsl/nochunks.xsl"/>

    <!-- The LFS book type to be processed (lfs, blfs, clfs, or hlfs) -->
  <xsl:param name="book-type">lfs</xsl:param>

</xsl:stylesheet>
