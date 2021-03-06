<?xml version="1.0" encoding="utf-8"?>
<!--
  Copyright 2010 simon
  
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
    http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:ui="http://kabeja.org/processing/ui/1.0" 
                xmlns:conf="http://kabeja.org/configuraion/1.0"
                version="1.0">

  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="fragment" /> 
  

  <xsl:template match="/">
        <xsl:apply-templates/>     
  </xsl:template>
  

  <xsl:template match="ui:components">  
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
        <xsl:apply-templates select="document($fragment)/conf:configuration/ui:uiconfiguration/ui:components/ui:component"/>
      </xsl:copy>  
  </xsl:template>
  
   <xsl:template match="conf:configuration">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
        <xsl:apply-templates select="document($fragment)/conf:configuration/conf:application"/>
      </xsl:copy>  
  </xsl:template>
  

   <!-- copy elements to the result tree -->
  <xsl:template match="@*|node()">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
  </xsl:template>


</xsl:stylesheet>
