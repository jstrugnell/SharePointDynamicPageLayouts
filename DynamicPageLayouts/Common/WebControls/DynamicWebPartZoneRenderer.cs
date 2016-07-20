using DynamicPageLayouts.Common.Code;
using DynamicPageLayouts.CONTROLTEMPLATES.DynamicPageLayouts.WebPartZoneLayouts;
using Microsoft.SharePoint;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicPageLayouts.Common.WebControls
{
    public class DynamicWebPartZoneRenderer : WebControl
    {
        private const string _ascxPath = @"~/_CONTROLTEMPLATES/15/DynamicPageLayouts/WebPartZoneLayouts/";

        int countOfWebPartZones = 0;

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            var pageZoneConfig = GetPageWebPartZoneConfiguration();

            if (pageZoneConfig != null && pageZoneConfig.Rows != null && pageZoneConfig.Rows.Length > 0)
            {
                // do sorting in JS // Array.Sort(pageZoneConfig.Rows, delegate (WebPartZoneRowConfiguration x, WebPartZoneRowConfiguration y) { return x.Order.CompareTo(y.Order); });
                foreach (WebPartZoneRowConfiguration row in pageZoneConfig.Rows)
                {
                    // reset Web Part Zone count for each row
                    countOfWebPartZones = 0;
                    try
                    {
                        string controlPath = _ascxPath + row.Layout + ".ascx";

                        var zoneLayout = (BaseWebPartZoneLayout)this.Page.LoadControl(controlPath);

                        zoneLayout.Config = row;
                        ConfigureChildWebPartZones(zoneLayout, row.Id);
                        this.Controls.Add(zoneLayout);
                    }
                    catch (Exception ex)
                    {
                        //Logger.LogException(ex);
                    }
                }
            }


            var configControl = (WebPartZoneConfigControl)this.Page.LoadControl(_ascxPath + "WebPartZoneConfigControl.ascx");
            this.Controls.Add(configControl);


        }

        private PageWebPartZoneConfiguration GetPageWebPartZoneConfiguration()
        {

            if (SPContext.Current == null || SPContext.Current.ListItem == null)
            {
                return null;
            }

            PageWebPartZoneConfiguration pageZoneConfig = new PageWebPartZoneConfiguration();

            var currentPage = SPContext.Current.ListItem;
            if (currentPage["DynamicPageConfiguration"] != null && !string.IsNullOrWhiteSpace(currentPage["DynamicPageConfiguration"].ToString()))
            {
                try
                {
                    var currentPageConfiguration = currentPage["DynamicPageConfiguration"].ToString();
                    pageZoneConfig = JsonConvert.DeserializeObject<PageWebPartZoneConfiguration>(currentPageConfiguration);
                }
                catch (Exception ex)
                {
                    //Logger.LogWarning("Possible corrupted dynamic page configuration value");
                    //Logger.LogException(ex);
                }
            }

            return pageZoneConfig;
        }

        private void ConfigureChildWebPartZones(Control ctrl, Guid zoneId)
        {

            string webPartZoneType = "Microsoft.SharePoint.WebPartPages.WebPartZone";

            if (ctrl.GetType().ToString() == webPartZoneType)
            {
                countOfWebPartZones++;
                ctrl.ID = "dynamicZone_" + zoneId.ToString() + "_" + countOfWebPartZones.ToString();
            }

            foreach (Control childCtrl in ctrl.Controls)
            {
                ConfigureChildWebPartZones(childCtrl, zoneId);
            }
        }


    }
}
