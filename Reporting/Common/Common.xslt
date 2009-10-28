﻿<?xml version="1.0" encoding="utf-8"?>
<!-- to be finished and used from   -->
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
                xmlns:sfr="urn:TechTalk:SpecFlow.Report"
                exclude-result-prefixes="msxsl">

  <xsl:include href="GherkinElements.xslt"/>

  <xsl:template name="html-common-header">
    <xsl:param name="title" />

    <xsl:comment>Generated by SpecFlow (see http://www.specflow.org/)</xsl:comment>
    <title>
      <xsl:value-of select="$title"/>
    </title>
    <style>
        <![CDATA[
      body
      {
        font: small verdana, arial, helvetica; color:#000000;
      }
      h1
      {
        font-size: 16px;
      }
      h2
      {
        font-size: 14px;
      }
      h3
      {
        font-size: 12px;
      }
      div.marker
      {
        height: 1.1em;
        width: 1.1em;
        float:left;
        margin-right: 0.3em;
      }
      table.reportTable
      {
        width: 100%;
        font-size: 12px;
      }
      table.subReportTable
      {
        font-size: 12px;
        margin-left: 2em;
      }
      td, th
      {
        text-align: left;
        border-bottom: solid 1px #dcdcdc;
        border-right: solid 1px #dcdcdc;
        padding-left: 0.5em;
        padding-right: 0.5em;
        padding-top: 0.25em;
        padding-bottom: 0.25em;
      }
      th
      {
        background-color: #FFF2E5;
        padding-top: 0.4em;
        padding-bottom: 0.4em;
      }
      .top
      {
        border-top: solid 1px #dcdcdc;
      }
      .left
      {
        border-left: solid 1px #dcdcdc;
      }
      td.accessPath, th.accessPath
      {
        padding-left: 1.0em;
      }
      td.accessPath
      {
        font-style:italic;
      }
      td.empty
      {
        border: none;
        height: 2.0em;
      }
      td.numeric
      {
        text-align: right;
      }
      td.marker
      {
        white-space: nowrap;
      }
      td.subRow
      {
        padding-left: 2em;
      }
      
      div.legend
      {
        margin-top: 2em;
        padding-left: 2em;
        font-style:italic;
        font-size: 10px;
      }
      a.button
      {
      }
      .hidden
      {
        display: none;
      }

      // gherkin elements style
      table.tableArg
      {
        font-size: 12px;
        margin-left: 2em;
      }
      table.tableArg th
      {
        background-color: #BBFFBB;
      }
      .stepKeyword
      {
        font-style:italic;
      }
      .stepParam
      {
        font-style:italic;
        color: Green;
      }
      ]]></style>
    <script>
      <![CDATA[
          function toggle(sdid){
            e=window.event.srcElement;
            toToggle=document.getElementById(sdid);
            if (e.innerText=="[show]")
            {
              e.innerText="[hide]";
              toToggle.style.display="block";
            }
            else
            {
              e.innerText="[show]";
              toToggle.style.display="none";
            }
          }

          function copyToClipboard(s)
          {
            clipboardData.setData("Text", s);
          }
          ]]>
    </script>
  </xsl:template>
  
  <xsl:template name="html-copy-step-to-clipboard-script">
    <script>
      <![CDATA[
          function copyStepToClipboard(stepId)
          {
            e=window.event.srcElement;
            text=document.getElementById("txt" + stepId);
            tableArg=document.getElementById("tbl" + stepId);
            
            result = text.innerText;
            if (tableArg != null)
            {
              result += "\r\n";
              result += getTableSource(tableArg);
            }
            
            copyToClipboard(result);
          }
          
          function getTableSource(table)
          {
            indent = "  ";
            
            header = table.rows(0).cells;
            rows = table.rows;
            
            columnWidths = new Array();
            for (colIndex = 0; colIndex < header.length; colIndex++)
                columnWidths[colIndex] = header[colIndex].innerText.length;

            for (rowIndex = 1; rowIndex < rows.length; rowIndex++)
            {
                row = rows[rowIndex].cells;
                for (colIndex = 0; colIndex < header.length; colIndex++)
                    if (row[colIndex].innerText.length > columnWidths[colIndex])
                        columnWidths[colIndex] = row[colIndex].innerText.length;
            }

            tableSource = "";
            for (rowIndex = 0; rowIndex < rows.length; rowIndex++)
            {
                row = rows[rowIndex].cells;
                tableSource = tableSource + indent + "|";
                for (colIndex = 0; colIndex < header.length; colIndex++)
                {
                  tableSource = tableSource + " ";
                  tableSource = tableSource + row[colIndex].innerText;
                  for (i = row[colIndex].innerText.length; i < columnWidths[colIndex]; i++)
                    tableSource = tableSource + " ";
                  tableSource = tableSource + " |";
                }
                tableSource = tableSource + "\r\n";
            }
            return tableSource;
          }
          ]]>
    </script>
  </xsl:template>

  <xsl:template name="html-body-header">
    <xsl:param name="title" />
    <xsl:param name="generatedAt" select="/*/@generatedAt" />
    <h1>
      <xsl:value-of select="$title"/>
    </h1>
    
    Generated by SpecFlow at <xsl:value-of select="$generatedAt"/> (see <a href="http://www.specflow.org/">http://www.specflow.org/</a>).

  </xsl:template>
</xsl:stylesheet>