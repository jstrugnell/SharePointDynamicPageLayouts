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

<asp:Content  ContentPlaceHolderId="PlaceHolderMain" runat="server">
		 <div class="row">
                <div class="col-md-12">
                    <!-- First Row -->
                    <div class="row">
                        <div class="col-md-12">
                            <div>
                                <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" ID="bootstrapRow1" Title="loc:Header" FrameType="None" Orientation="Vertical">
                                    <ZoneTemplate></ZoneTemplate>
                                </WebPartPages:WebPartZone>
                            </div>
                        </div>
                    </div>
                    <!-- Second Row -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <!-- Four Content Areas-->
                                <div class="col-md-3 mobile-two">
                                    <div>
                                        <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" ID="bootstrapRow2Column1" Title="Second Row Column 1" FrameType="None" Orientation="Vertical">
                                            <ZoneTemplate></ZoneTemplate>
                                        </WebPartPages:WebPartZone>
                                    </div>
                                    
                                </div>
                                <div class="col-md-3 mobile-two">
                                    
                                    <div>
                                        <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" ID="bootstrapRow2Column2" Title="Second Row Column 2" FrameType="None" Orientation="Vertical">
                                            <ZoneTemplate></ZoneTemplate>
                                        </WebPartPages:WebPartZone>
                                    </div>
                                    
                                </div>
                                <div class="col-md-3 mobile-two">
                                    
                                    <div>
                                        <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" ID="bootstrapRow2Column3" Title="Second Row Column 3" FrameType="None" Orientation="Vertical">
                                            <ZoneTemplate></ZoneTemplate>
                                        </WebPartPages:WebPartZone>
                                    </div>
                                    
                                </div>
                                <div class="col-md-3 mobile-two">
                                    
                                    <div>
                                        <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" ID="bootstrapRow2Column4" Title="Second Row Column 4" FrameType="None" Orientation="Vertical">
                                            <ZoneTemplate></ZoneTemplate>
                                        </WebPartPages:WebPartZone>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
					<!-- Third Row -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="panel radius">
                                        <div class="row">
                                            <div class="col-md-6">
                                               
                                                <div>
                                                    <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" ID="bootstrapRow3Column1Sub1" Title="Left Footer Left" FrameType="None" Orientation="Vertical">
                                                        <ZoneTemplate></ZoneTemplate>
                                                    </WebPartPages:WebPartZone>
                                                </div>
                                                
                                            </div>
                                            <div class="col-md-6">
                                               
                                                <div>
                                                    <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" ID="bootstrapRow3Column1Sub2" Title="Left Footer Right" FrameType="None" Orientation="Vertical">
                                                        <ZoneTemplate></ZoneTemplate>
                                                    </WebPartPages:WebPartZone>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    
                                    <div>
                                        <WebPartPages:WebPartZone runat="server" AllowPersonalization="false" ID="bootstrapRow3Column2" Title="Right Footer" FrameType="None" Orientation="Vertical">
                                            <ZoneTemplate></ZoneTemplate>
                                        </WebPartPages:WebPartZone>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
