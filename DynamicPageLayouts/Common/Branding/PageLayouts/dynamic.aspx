<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Custom" Namespace="DynamicPageLayouts.Common.WebControls" Assembly="DynamicPageLayouts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=2749e51134f24373" %>

<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePointWebControls:FieldValue id="PageTitle" FieldName="Title" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderPageTitleInTitleArea" runat="server">
	<SharePointWebControls:FieldValue FieldName="Title" runat="server"/>
</asp:Content>

<asp:Content  ContentPlaceHolderId="PlaceHolderMain" runat="server">
		
    <Custom:DynamicWebPartZoneRenderer runat="server"></Custom:DynamicWebPartZoneRenderer>

    
    <PublishingWebControls:EditModePanel runat="server" PageDisplayMode="Edit">

        <div style="display:none;">
            <SharePointWebControls:NoteField CssClass="ms-long js-DynamicPageConfiguration" FieldName="DynamicPageConfiguration" runat="server"/> 
        </div>
   
        <script src="/_layouts/15/DynamicPageLayouts/scripts/DynamicPageConfiguration.js"></script>

        <script>
            $(document).ready(function () {
                // we are in edit mode, add a class to the body tag so that we can use this info
                $('body').addClass("editmode");
            });
        </script>

    </PublishingWebControls:EditModePanel>

</asp:Content>


