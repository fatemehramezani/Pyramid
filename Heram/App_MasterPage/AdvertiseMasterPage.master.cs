using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class App_MasterPage_AdvertiseMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            #region Advertise
            string imagePath = "../Files/Advertise";
            DatabaseEntities _DatabaseEntities = new DatabaseEntities();
            string content = string.Empty;
            foreach (Advertise advertise in _DatabaseEntities.Advertises.OrderBy(advertise => advertise.Title))
            {
                content += string.Format(@"<div class=""banner-wrap""><a href=""{2}""><img src=""{0}/{1}"" alt=""{3}""></a></div>", imagePath, advertise.ImageURL,advertise.Link,advertise.Title);
            }
            if (!string.IsNullOrEmpty(content))
                advertiseContainer.InnerHtml = content;
            #endregion
        }
    }
    string PersianDate(DateTime date)
    {
        PersianDateControls.PersianDateLabel currentPersianDate = new PersianDateControls.PersianDateLabel();
        currentPersianDate.DateValue = date;
        currentPersianDate.DateFormat = PersianDateControls.DateFormat.LongDate;

        return currentPersianDate.Text;
    }
}
