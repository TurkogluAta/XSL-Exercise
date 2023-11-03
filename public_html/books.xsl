<?xml version="1.0" ?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />

  <xsl:template match="/">
    <html>
      <head>
        <title>Book Page</title>
      </head>
      <body>
        <!--All book titles-->
        <h2>All book titles:</h2>
        <xsl:apply-templates select="/catalog/book/title"/>

        <!--All out of print titles-->
        <h2>Out of Print Titles:</h2>
        <xsl:apply-templates select="/catalog/book/outOfPrint"/>

        <!--Fantasy book id numbers -->
        <h2>Fantasy book id's :</h2>
        <xsl:apply-templates select="/catalog/book/genre[contains(string(), 'Fantasy')]"/>

        <!--Published after 2001-->
        <h2>Books published after 2001:</h2>
        <xsl:apply-templates select="/catalog/book[publish[publish_date>'2001']]"/>

        <!--Books costing more than 30 -->
        <h2>Books with the price greater than 30:</h2>
        <xsl:apply-templates select="/catalog/book[price>'30']"/>
      </body>
    </html>
  </xsl:template>

  <!--All book titles-->
  <xsl:template match="title">
    <p><xsl:value-of select="." /></p>
  </xsl:template>

  <!--All out of print titles-->
  <xsl:template match="outOfPrint">
    <p><xsl:value-of select="../title" /></p>
  </xsl:template>

  <!--Fantasy book id numbers-->
  <xsl:template match="genre">
    <p><xsl:value-of select="../@id" /></p>
  </xsl:template>

  <!--Published after 2001-->
  <xsl:template match="book">
    <p><xsl:value-of select="title" /></p>
  </xsl:template>

  <!--Books costing more than 30-->
  <xsl:template match="book[price>'30']">
    <p><xsl:value-of select="title" />, <xsl:value-of select="price"/></p>
  </xsl:template>

</xsl:transform>