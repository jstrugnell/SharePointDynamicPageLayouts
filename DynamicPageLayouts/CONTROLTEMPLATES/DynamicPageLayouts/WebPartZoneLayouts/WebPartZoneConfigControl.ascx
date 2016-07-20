<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebPartZoneConfigControl.ascx.cs" Inherits="DynamicPageLayouts.CONTROLTEMPLATES.DynamicPageLayouts.WebPartZoneLayouts.WebPartZoneConfigControl" %>


<style type="text/css">

.row-config-urlpicker-field {
    width:75%;
    display:inline-block;
}
</style>

<PublishingWebControls:EditModePanel runat="server" PageDisplayMode="Edit">
    
        <div class="row" style="margin-top:15px;">
            <div class="dynamic-management-panel" style="text-align:center">
                <button type="button" class="btn btn-primary" title="Settings" data-rowid="" data-toggle="modal" data-target="#rowLayoutConfigModal">
                     <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        Add new dynamic row 
                </button>
            </div>
        </div>


        
<!-- Modal -->
<div class="modal fade row-config-control" id="rowLayoutConfigModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">New row</h4>
      </div>
      <div class="modal-body">

            <div class="form-horizontal">

              <input type="hidden" id="hiddenRowID" class="row-config-id" value="" />
                
              <div class="form-group row-config-count-section">
                <label for="inputOrder" class="col-sm-3 control-label">Order</label>
                <div class="col-sm-9">
                    <input type="number" class="row-config-number-field form-control row-config-order" id="inputOrder" />
                </div>
              </div>

              <div class="form-group">
                <label for="selectLayout" class="col-sm-3 control-label">Layout</label>
                <div class="col-sm-9">
                    <select class="row-config-number-field row-config-layout form-control" id="selectLayout" >
                        <option value="FullWidthWebPartZone">Full width column</option>
                        <option value="TwoWebPartZones">2 * 1/2 columns</option>
                        <option value="ThreeWebPartZones">3 * 1/3 columns</option>
                        <option value="FourWebPartZones">4 * 1/4 columns</option>
                        <option value="SixWebPartZones">6 * 1/6 columns</option>
                        <option value="OneHalf-TwoQuarterWebPartZones">1 * 1/2 + 2 * 1/4 columns</option>
                        <option value="TwoQuarter-OneHalfWebPartZones">2 * 1/4 + 1 * 1/2 columns</option>
                        <option value="OneQuarter-OneThreeQuarterWebPartZones">1 * 1/4 + 1 * 3/4 columns</option>
                        <option value="OneThreeQuarter-OneQuarterWebPartZones">1 * 3/4 + 1 * 1/4 columns</option>
                    </select>              
                </div>
            </div>
                    
              <div class="form-group">
                <label for="inputBackgroundColour" class="col-sm-3 control-label">Background colour</label>
                <div class="col-sm-9">
                    <input type="text" class="row-config-text-field row-config-backgroundColour form-control" id="inputBackgroundColour" />
                </div>
              </div>

              <div class="form-group">
                <label for="inputTopMargin" class="col-sm-3 control-label">Top margin</label>
                <div class="col-sm-9">
                    <input type="number" class="row-config-number-field row-config-topMargin form-control" id="inputTopMargin" />
                </div>
              </div>
              <div class="form-group">
                <label for="inputBottomMargin" class="col-sm-3 control-label">Bottom margin</label>
                <div class="col-sm-9">
                    <input type="number" class="row-config-number-field row-config-bottomMargin form-control" id="inputBottomMargin" />
                </div>
              </div>
              <div class="form-group">
                <label for="inputTopPadding" class="col-sm-3 control-label">Top padding</label>
                <div class="col-sm-9">
                    <input type="number" class="row-config-number-field row-config-topPadding form-control" id="inputTopPadding" />
                </div>
              </div>
              <div class="form-group">
                <label for="inputBottomPadding" class="col-sm-3 control-label">Bottom padding</label>
                <div class="col-sm-9">
                    <input type="number" class="row-config-number-field row-config-bottomPadding form-control" id="inputBottomPadding" />
                </div>
              </div>

        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="row-config-delete-button btn btn-danger" style="float:left;">Delete this row</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="row-config-update-button btn btn-success">Save changes</button>
      </div>
    </div>
  </div>
</div>


    <script>
        /* Move Modal outside of content area as otherwise I saw big display issues (i.e. behind the overlay gradient, can't get focus) */
        $(document).ready(function () {
            $('.row-config-control').appendTo("body");
        });
    </script>


</PublishingWebControls:EditModePanel>
