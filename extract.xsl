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
    
    <xsl:template match="xh:div[@class='T_n_B']"/>
    <xsl:template match="xh:div">
        <doc>
            <xsl:apply-templates select="*"/>
            <!--
            <name><xsl:value-of select="xh:h2"/></name>
            <img>
                <url><xsl:value-of select="xh:img/@src"/></url>
                <caption><xsl:value-of select="xh:img/@alt"/></caption>
            </img>
            <category><xsl:value-of select="normalize-space(xh:table/xh:tr[1]/xh:td/text())"/></category>
            <description><xsl:value-of select="normalize-space(xh:table/xh:tr[3]/xh:td/xh:p)"/></description>
            <NTS><xsl:value-of select="normalize-space(xh:table/xh:tr[4]/xh:td[2])"/></NTS>
            <source><xsl:value-of select="normalize-space(xh:table/xh:tr[7]/xh:td/xh:em)"/></source>
            -->
        </doc>
    </xsl:template>
    
    <xsl:template match="xh:h2">
        <field name="title"><xsl:value-of select="normalize-space(.)"/></field>
    </xsl:template>
    
    <xsl:template match="xh:table">
        <xsl:apply-templates select="*"/>
    </xsl:template>
    
    <xsl:variable name="NTSmarker">National Topographic System (NTS) :</xsl:variable>
    <xsl:variable name="locationnamemarker">Location Name :</xsl:variable>
    <xsl:variable name="surveymarker">Sub Section | Section | Township | Range | Meridian</xsl:variable>
    <xsl:variable name="latlonmarker">Latitude (N) | Longitude (W)</xsl:variable>
    <xsl:variable name="sourcemarker">The content above is directly derived from :</xsl:variable>
    <xsl:template match="xh:tr">
        <xsl:variable name="td1" select="normalize-space(xh:td[1]/xh:b)"/>
        <xsl:variable name="prev" select="normalize-space(preceding-sibling::xh:tr[1]/xh:td[1]/xh:b)"/>
        <xsl:choose>
            <xsl:when test="$td1 = '&#160;' 
                or $td1 = $surveymarker or $td1 = $latlonmarker or $td1 = $sourcemarker"/>
            <xsl:when test="normalize-space(xh:td) = 'The content above is directly derived from :'"/>
            <xsl:when test="$prev = $latlonmarker">
                <field name="latlon"><xsl:value-of select="normalize-space(xh:td)"/></field>
            </xsl:when>
            <xsl:when test="$prev = $surveymarker">
                <field name="survey"><xsl:value-of select="normalize-space(xh:td)"/></field>
            </xsl:when>
            <xsl:when test="$prev = $sourcemarker">
                <field name="source"><xsl:value-of select="normalize-space(xh:td)"/></field>
            </xsl:when>
            <xsl:when test="$td1 = $NTSmarker">
                <field name="NTS"><xsl:value-of select="normalize-space(xh:td[2])"/></field>
            </xsl:when>
            <xsl:when test="$td1 = $locationnamemarker">
                <field name="locationname"><xsl:value-of select="normalize-space(xh:td[2])"/></field>
            </xsl:when>
            <xsl:when test="contains(xh:td[1][@colspan='2']/xh:b, 'Category :')">
                <field name="category"><xsl:value-of select="normalize-space(xh:td[1]/text())"/></field>
            </xsl:when>
            <xsl:when test="xh:td[@colspan='2']/xh:p">
                <field name="description"><xsl:value-of select="normalize-space(xh:td/xh:p)"/></field>
            </xsl:when>
            
            <xsl:when test="xh:td[1]/xh:b">
                <field name="{normalize-space(xh:td[1]/xh:b)}"><xsl:value-of select="normalize-space(xh:td[2])"/></field>
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="xh:img">
        <field name="img" url="{@src}">
            <xsl:value-of select="normalize-space(@alt)"/>
        </field>
    </xsl:template>
    
    <!-- suppress captions, since we get them from the alt tag -->
    <xsl:template match="xh:div/xh:p"/>
</xsl:stylesheet>