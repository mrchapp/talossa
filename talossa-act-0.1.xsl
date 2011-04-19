<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output indent="yes"/>

<xsl:template match="/act">
<html><head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Talossan Statute <xsl:value-of select="@identifier"/>: <xsl:value-of select="@rubric"/></title>
	<style type="text/css" media="screen,projection"> @import "layout.css"; </style>
	<style type="text/css" media="print"> @import "print.css"; </style>
</head>
<body>
<div id="content">
<h1>Talossan Act 
<xsl:choose>
  <xsl:when test="@identifier">
    <xsl:value-of select="@identifier"/>
  </xsl:when>
  <xsl:otherwise>Proposed</xsl:otherwise>
</xsl:choose>:<br/><xsl:value-of select="@rubric"/></h1>
<hr/>
<xsl:apply-templates/> 
</div>
</body>
</html>
</xsl:template>

<!-- FIXME: Make lists work -->
<!--xsl:template match="orderedlist">
<ol>
<xsl:apply-templates select="item"/>
</ol>
</xsl:template>

<xsl:template match="unorderedlist">
<ul>
<xsl:apply-templates select="item"/> 
</ul>
</xsl:template>

<xsl:template match="item">
<li><xsl:value-of select="."/></li>
</xsl:template-->



<xsl:template match="antecedent">
<div id="antecedent">
<xsl:for-each select="whereas">
<p>WHEREAS <xsl:value-of select="."/></p>
</xsl:for-each>
</div>
</xsl:template>

<xsl:template match="consequent">
<div id="consequent">
<xsl:apply-templates select="orderedlist"/> 
<xsl:for-each select="therefore">
<p>THEREFORE <xsl:value-of select="."/></p>
</xsl:for-each>
<xsl:for-each select="furthermore">
<p>FURTHERMORE <xsl:value-of select="."/></p>
</xsl:for-each>
<xsl:for-each select="resolved">
<p>RESOLVED THAT <xsl:value-of select="."/></p>
</xsl:for-each>
</div>
</xsl:template>

<xsl:template match="subscribers">
<div id="subscribers">
<xsl:apply-templates/> 
</div>
</xsl:template>

<xsl:template match="swear">
<p class="swear"><xsl:value-of select="."/></p>
</xsl:template>

<xsl:template match="signature">
<p class="signature"><xsl:value-of select="."/></p>
</xsl:template>


</xsl:stylesheet>
