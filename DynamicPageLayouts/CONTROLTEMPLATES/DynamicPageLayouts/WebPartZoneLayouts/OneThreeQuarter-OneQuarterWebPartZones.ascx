﻿<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true"  Inherits="DynamicPageLayouts.Common.Code.BaseWebPartZoneLayout" %>



<!-- 3/4 + 1/4 zones -->
    <asp:Panel runat="server" CssClass="dynamic-editor-panel" ID="pnlEditorPanel">
        <asp:Panel runat="server" CssClass="row dynamic-row" ID="pnlRow">
	        <div class="col-md-9">
		        <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" Title="loc:2 Column Left Margin" Orientation="Vertical"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone> 
	        </div>                                                                    
            <div class="col-md-3">                                                    
		        <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" Title="loc:2 Column Right Content" Orientation="Vertical"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone> 
	        </div> 
	    </asp:panel>
    </asp:panel>

