using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynamicPageLayouts.Common.Code
{
    public class PageWebPartZoneConfiguration
    {
        public WebPartZoneRowConfiguration[] Rows;
    }

    public class WebPartZoneRowConfiguration
    {
        public Guid Id;
        public int Order;
        public string BackgroundColour;
        public int MarginTop;
        public int MarginBottom;
        public int PaddingTop;
        public int PaddingBottom;
        public string Layout;
    }

}
