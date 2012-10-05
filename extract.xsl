<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:xh="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xd xh"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 5, 2012</xd:p>
            <xd:p><xd:b>Author:</xd:b> pbinkley</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <xsl:apply-templates select="//xh:div[@class='content']"/>
    </xsl:template>
    
    <xsl:template match="xh:div">
        <doc>
            <name><xsl:value-of select="xh:h2"/></name>
            <img>
                <url><xsl:value-of select="xh:img/@src"/></url>
                <caption><xsl:value-of select="xh:img/@alt"/></caption>
            </img>
            <category><xsl:value-of select="normalize-space(xh:table/xh:tr[1]/xh:td/text())"/></category>
            <description><xsl:value-of select="normalize-space(xh:table/xh:tr[3]/xh:td/xh:p)"/></description>
            <NTS><xsl:value-of select="normalize-space(xh:table/xh:tr[4]/xh:td[2])"/></NTS>
            <source><xsl:value-of select="normalize-space(xh:table/xh:tr[7]/xh:td/xh:em)"/></source>
        </doc>
    </xsl:template>
</xsl:stylesheet>