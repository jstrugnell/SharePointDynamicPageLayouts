<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePointWebControls:FieldValue id="PageTitle" FieldName="Title" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderPageTitleInTitleArea" runat="server">
	<SharePointWebControls:FieldValue FieldName="Title" runat="server"/>
</asp:Content>

<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
		 <div class="row">
                <!-- Main Content -->
                <div class="col-md-9">
                                        
                    <div>
                        <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" ID="bootstrapRow1Column1" Title="loc:LeftColumn" FrameType="None" Orientation="Vertical">
                            <ZoneTemplate></ZoneTemplate>
                        </WebPartPages:WebPartZone>
                    </div>
                    
                </div>
                <!-- End Main Content -->
                <!-- Sidebar -->
                <aside class="col-md-3">
                    
                    <div>
                        <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" ID="bootstrapRow1Column2Sub1" Title="Right Column Top" FrameType="None" Orientation="Vertical">
                            <ZoneTemplate></ZoneTemplate>
                        </WebPartPages:WebPartZone>
                    </div>
                   
                    <div>
                        <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" ID="bootstrapRow1Column2Sub2" Title="Right Column Bottom" FrameType="None" Orientation="Vertical">
                            <ZoneTemplate></ZoneTemplate>
                        </WebPartPages:WebPartZone>
                    </div>
                    
                </aside>
                <!-- End Sidebar -->
            </div>
            <!-- End Main Content and Sidebar -->
</asp:Content>
