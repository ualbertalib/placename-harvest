<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:xh="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 9, 2012</xd:p>
            <xd:p><xd:b>Author:</xd:b> pbinkley</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:apply-templates select="//xh:table[@id='websites_table']"/>
    </xsl:template>
    
    <xsl:template match="xh:table">
        <xsl:apply-templates select="xh:tr[position() &gt;= 2]"/>
    </xsl:template>
    
    <xsl:template match="xh:tr">
        <xsl:apply-templates select="xh:td//xh:a/@href[contains(., 'displaycontent.php')]"/>
    </xsl:template>
    
    <xsl:template match="@href">
        <xsl:value-of select="."/>
        <xsl:text>&#x0a;</xsl:text>
    </xsl:template>
</xsl:stylesheet>