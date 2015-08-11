<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
<xsl:strip-space elements="*"/>

<xsl:param name="username" select="'jdoe'"/>
<xsl:param name="password" select="'password'"/>

<xsl:template match="node()[name(.)='subsystem' and @apiJndiName='java:global/hawkular/agent/monitor/api']">
  <xsl:copy>
     <xsl:apply-templates select="@*" />
     <xsl:attribute name="enabled">
         <xsl:value-of select="true()"/>
     </xsl:attribute>
     <xsl:apply-templates select="node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="node()[name(.)='storage-adapter']">
  <xsl:copy>
     <xsl:apply-templates select="@*" />
     <xsl:attribute name="username">
         <xsl:value-of select="$username"/>
     </xsl:attribute>
     <xsl:attribute name="password">
         <xsl:value-of select="$password"/>
     </xsl:attribute>
     <xsl:apply-templates select="node()"/>
  </xsl:copy>
</xsl:template>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*" />
    </xsl:copy>
  </xsl:template>


</xsl:stylesheet>
