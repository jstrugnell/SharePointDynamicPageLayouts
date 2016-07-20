using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicPageLayouts.Common.Code
{
    public class BaseWebPartZoneLayout : UserControl
    {

        public WebPartZoneRowConfiguration Config { get; set; }
        private Panel pnlRow;
        private Panel pnlEditorPanel;
        //private Panel pnlFullWidth;

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            InitialisePanels();

            if (SPContext.Current.FormContext.FormMode == SPControlMode.Edit)
            {

                var editRowButton = @"<div class='clearfix row-config-edit-panel'><div style='float:right;'>
                <button type='button' class='btn' title='Settings' data-rowid='" + Config.Id + @"' data-toggle='modal' data-target='#rowLayoutConfigModal'>
                  <span class='glyphicon glyphicon-cog' aria-hidden='true'></span>
                </button>
                </div></div>";

                pnlEditorPanel.Controls.AddAt(0, new LiteralControl(editRowButton));
            }

            if (!string.IsNullOrWhiteSpace(Config.BackgroundColour))
            {
                pnlRow.Style.Add("background-color", Config.BackgroundColour);
            }

            if (Config.MarginTop > 0)
            {
                pnlRow.Style.Add("margin-top", string.Format("{0}px", Config.MarginTop));
            }
            if (Config.MarginBottom > 0)
            {
                pnlRow.Style.Add("margin-bottom", string.Format("{0}px", Config.MarginBottom));
            }
            if (Config.PaddingTop > 0)
            {
                pnlRow.Style.Add("padding-top", string.Format("{0}px", Config.PaddingTop));
            }
            if (Config.PaddingBottom > 0)
            {
                pnlRow.Style.Add("padding-bottom", string.Format("{0}px", Config.PaddingBottom));
            }


        }

        private void InitialisePanels()
        {
            //pnlBox = (Panel)FindControl("pnlBox");
            //if (pnlBox == null)
            //{
            //    //Logger.LogWarning("Dynamic Row Control with no pnlBox control");
            //    return;
            //}

            pnlRow = (Panel)FindControl("pnlRow");
            if (pnlRow == null)
            {
                //Logger.LogWarning("Dynamic Row Control with no pnlContainer control");
                return;
            }

            pnlEditorPanel = (Panel)FindControl("pnlEditorPanel");
            if (pnlEditorPanel == null)
            {
                //Logger.LogWarning("Dynamic Row Control with no pnlEditorPanel control");
                return;
            }
        }
    }

    public class ContainerWidthOptions
    {
        public readonly static string Full = "Full";
        public readonly static string Body = "Body";
    }

    public class ContentWidthOptions
    {
        public readonly static string Full = "Full";
        public readonly static string Body = "Body";
    }
    public class BackgroundImageRenderOptions
    {
        public readonly static string Stretch = "Stretch";
        public readonly static string Repeat = "Repeat";
    }

}
