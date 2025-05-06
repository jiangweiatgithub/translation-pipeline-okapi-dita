<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xhtml">

  <xsl:output method="xml" encoding="UTF-8" indent="no"/>

  <!-- Optional parameters for filtering -->
  <xsl:param name="sourceLang" select="''"/>
  <xsl:param name="targetLang" select="''"/>

  <!-- Extracted language codes -->
  <xsl:variable name="srcLangCode" select="//xhtml:langsrc"/>
  <xsl:variable name="tgtLangCode" select="//xhtml:langtgt"/>

  <xsl:template match="/xhtml:html">
    <tmx version="1.4b">
      <header
        creationtool="AlignRobot"
        creationtoolversion="4.0.3.23024"
        segtype="sentence"
        adminlang="en-US"
        srclang="{$srcLangCode}"
        datatype="plaintext"/>
      <body>
        <xsl:apply-templates select=".//xhtml:segments/xhtml:seg"/>
      </body>
    </tmx>
  </xsl:template>

  <xsl:template match="xhtml:seg">
    <tu>
      <xsl:if test="($sourceLang = '' or $sourceLang = $srcLangCode)">
        <tuv xml:lang="{$srcLangCode}"><seg><xsl:apply-templates select="xhtml:src/node()"/></seg></tuv>
      </xsl:if>
      <xsl:if test="($targetLang = '' or $targetLang = $tgtLangCode)">
        <tuv xml:lang="{$tgtLangCode}"><seg><xsl:apply-templates select="xhtml:tgt/node()"/></seg></tuv>
      </xsl:if>
    </tu>
  </xsl:template>

  <!-- Handle inline formatting tags: b, i, u, xref -->
  <xsl:template match="xhtml:b | xhtml:i | xhtml:u | xhtml:xref">
    <xsl:variable name="tag" select="name()"/>
    <xsl:variable name="i" select="generate-id()"/>
    <xsl:variable name="attrs">
      <xsl:for-each select="@*">
        <xsl:value-of select="concat(' ', name(), '=&quot;', ., '&quot;')"/>
      </xsl:for-each>
    </xsl:variable>
    <bpt i="{$i}">&lt;<xsl:value-of select="$tag"/><xsl:value-of select="$attrs"/>&gt;</bpt>
    <xsl:apply-templates select="node()"/>
    <ept i="{$i}">&lt;/<xsl:value-of select="$tag"/>&gt;</ept>
  </xsl:template>

  <!-- Text node passthrough -->
  <xsl:template match="text()">
    <xsl:value-of select="."/>
  </xsl:template>

</xsl:stylesheet>
