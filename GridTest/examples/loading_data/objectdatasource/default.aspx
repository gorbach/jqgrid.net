﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="GridTest.examples.loading_data.objectdatasource._default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>    
    <script src="/js/jquery.js" type="text/javascript"></script>
    <script src="/js/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
    <script src="/js/jquery.layout.js" type="text/javascript"></script>
    <script src="/js/i18n/grid.locale-en.js" type="text/javascript"></script>
    <script src="/js/jquery.jqGrid.min.js" type="text/javascript"></script>
    <script src="/js/jquery.tablednd.js" type="text/javascript"></script>
    <script src="/js/jquery.contextmenu.js" type="text/javascript"></script>  
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    Binding to ObjectDataSource
    <trirand:JQueryGrid ID="JQGrid1" runat="server" DataSourceID="ObjectDataSource1">        
    </trirand:JQueryGrid>
   
    <br /><br />
    <trirand:codetabs runat="server" id="codetabs1"></trirand:codetabs>    
    
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName ="DataAccess" CacheDuration="300" CacheExpirationPolicy="Sliding">
        <SelectParameters>
            <asp:Parameter Name="p_sortExpression" Type="string" Direction="input" />
            <asp:Parameter Name="p_sortDirection" Type="string" Direction="input" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    </form>
</body>
</html>