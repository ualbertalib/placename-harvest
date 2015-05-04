<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 11, 2012</xd:p>
            <xd:p><xd:b>Author:</xd:b> pbinkley</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="text"/>
    <xsl:param name="id"/>
    
    <xsl:template match="/doc">
        <!--id,title,category,description,locationnote,location,elevation,nts,survey,latlon,source-->
        <xsl:value-of select="substring-before($id, '.xml')"/>
        <xsl:text>,"</xsl:text>
        <xsl:call-template name="escapestring">
            <xsl:with-param name="s" select="field[@name='title']"/>
        </xsl:call-template>
        <xsl:text>","</xsl:text>
        <xsl:call-template name="escapestring">
            <xsl:with-param name="s" select="field[@name='category']"/>
        </xsl:call-template>
        <xsl:text>","</xsl:text>
        <xsl:call-template name="escapestring">
            <xsl:with-param name="s" select="field[@name='description'][1]"/>
        </xsl:call-template>
        <xsl:text>","</xsl:text>
        <xsl:call-template name="escapestring">
            <xsl:with-param name="s" select="field[@name='description'][2]"/>
        </xsl:call-template>
        <xsl:text>","</xsl:text>
        <xsl:call-template name="escapestring">
            <xsl:with-param name="s" select="field[@name='locationname']"/>
        </xsl:call-template>
        <xsl:text>","</xsl:text>
        <xsl:call-template name="escapestring">
            <xsl:with-param name="s" select="field[@name='Elevation Height :']"/>
        </xsl:call-template>
        <xsl:text>","</xsl:text>
        <xsl:call-template name="escapestring">
            <xsl:with-param name="s" select="field[@name='NTS']"/>
        </xsl:call-template>
        <xsl:text>","</xsl:text>
        <xsl:call-template name="escapestring">
            <xsl:with-param name="s" select="field[@name='survey']"/>
        </xsl:call-template>
        <xsl:text>","</xsl:text>
        <xsl:call-template name="escapestring">
            <xsl:with-param name="s" select="field[@name='latlon']"/>
        </xsl:call-template>
        <xsl:text>","</xsl:text>
        <xsl:call-template name="escapestring">
            <xsl:with-param name="s" select="field[@name='source']"/>
        </xsl:call-template>

        <xsl:text>","</xsl:text>
        <xsl:call-template name="escapestring">
            <xsl:with-param name="s" select="field[@name='img']"/>
        </xsl:call-template>
        <xsl:text>","</xsl:text>
        <xsl:value-of select="field[@name='img']/@url"/>
        <xsl:text>"</xsl:text>

    </xsl:template>

    <xsl:template name="escapestring">
        <!-- replace " with \" -->
        <xsl:param name="s"/>
        <xsl:choose>
            <xsl:when test="contains($s, '&quot;')">
                <xsl:value-of select="substring-before($s, '&quot;')"/>
                <xsl:text>|</xsl:text>
                <xsl:call-template name="escapestring">
                    <xsl:with-param name="s" select="substring-after($s, '&quot;')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$s"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>