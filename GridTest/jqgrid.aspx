﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jqgrid.aspx.cs" Inherits="GridTest.jqgrid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jqGrid Demos</title>  
<link rel="stylesheet" type="text/css" media="screen" href="themes/redmond/jquery-ui-1.7.1.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="themes/ui.jqgrid.css" />
<style>
html, body {
	margin: 0;			/* Remove body margin/padding */
	padding: 0;
	overflow: hidden;	/* Remove scroll bars on browser window */	
    font-size: 75%;
}
/*Splitter style */


#LeftPane {
	/* optional, initial splitbar position */
	overflow: auto;
}
/*
 * Right-side element of the splitter.
*/

#RightPane {
	padding: 2px;
	overflow: auto;
}
.ui-tabs-nav li {position: relative;}
.ui-tabs-selected a span {padding-right: 10px;}
.ui-tabs-close {display: none;position: absolute;top: 3px;right: 0px;z-index: 800;width: 16px;height: 14px;font-size: 10px; font-style: normal;cursor: pointer;}
.ui-tabs-selected .ui-tabs-close {display: block;}
.ui-layout-west .ui-jqgrid tr.jqgrow td { border-bottom: 0px none;}
.ui-datepicker {z-index:1200;}
</style>

<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
<script src="js/jquery.layout.js" type="text/javascript"></script>
<script src="js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="js/jquery.tablednd.js" type="text/javascript"></script>
<script src="js/jquery.contextmenu.js" type="text/javascript"></script>
<script type="text/javascript">
var gridimgpath = 'themes/basic/images';
jQuery(document).ready(function() {
    //$('#switcher').themeswitcher();

    $('body').layout({
        resizerClass: 'ui-state-default',
        west__onresize: function(pane, $Pane) {
            jQuery("#west-grid").setGridWidth($Pane.innerWidth() - 2);
        }
    });
    $.jgrid.defaults = $.extend($.jgrid.defaults, { loadui: "enable" });
    var maintab = jQuery('#tabs', '#RightPane').tabs({
        add: function(e, ui) {
            // append close thingy
            $(ui.tab).parents('li:first')
                .append('<span class="ui-tabs-close ui-icon ui-icon-close" title="Close Tab"></span>')
                .find('span.ui-tabs-close')
                .click(function() {
                    maintab.tabs('remove', $('li', maintab).index($(this).parents('li:first')[0]));
                });
            // select just added tab
            maintab.tabs('select', '#' + ui.panel.id);
        }
    });
    jQuery("#west-grid").jqGrid({
        url: "tree.xml",
        datatype: "xml",
        height: "auto",
        pager: false,
        loadui: "disable",
        colNames: ["id", "Items", "url"],
        colModel: [
            { name: "id", width: 1, hidden: true, key: true },
            { name: "menu", width: 150, resizable: false, sortable: false },
            { name: "url", width: 1, hidden: true }
        ],
        treeGrid: true,
        caption: "jqGrid Demos",
        ExpandColumn: "menu",
        autowidth: true,
        //width: 180,
        rowNum: 200,
        ExpandColClick: true,
        treeIcons: { leaf: 'ui-icon-document-b' },
        onSelectRow: function(rowid) {
            var treedata = $("#west-grid").getRowData(rowid);
            if (treedata.isLeaf == "true") {
                //treedata.url
                var st = "#t" + treedata.id;
                if ($(st).html() != null) {
                    maintab.tabs('select', st);
                } else {
                    maintab.tabs('add', st, treedata.menu);
                    $(st, "#tabs").load(treedata.url);                    
                }
            }
        }
    });

    // end splitter

});
</script>
</head>
<body>
<script type="text/javascript"
  //src="http://ui.jquery.com/themeroller/themeswitchertool/">
</script>
  	<div id="LeftPane" class="ui-layout-west ui-widget ui-widget-content">
		<table id="west-grid"></table>
	</div> <!-- #LeftPane -->
	<div id="RightPane" class="ui-layout-center ui-helper-reset ui-widget-content" ><!-- Tabs pane -->	
    <div id="switcher"></div>
		<div id="tabs" class="jqgtabs">
			<ul>
				<li><a href="#tabs-1">jqGrid 35</a></li>
			</ul>
			<div id="tabs-1" style="font-size:12px;"> After lot of work, I'm happy to introduce a new jqGrid realease. <br/>
			The work is just in alfa stage, but I hope that the final will be released soon.<br/>
			There are a lot of issueas that I should resolve. The most of them are (as usual) in IE browsers. <br/>
			The theme integration should be polished too.There are some missing things like zebra striping, <br/>
			but I do not find a class in UI theme roller that corresponds to this.<br/>
			Instead of this, I think that this is a good start.
			<br/>
			Enjoy
			</div>
		</div>
	</div> <!-- #RightPane -->
</body>

</html>

