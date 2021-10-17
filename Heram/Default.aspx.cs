using System.Collections.Specialized;
using System.Net;
using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;

public partial class Default : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        //SendEmail();
        Page.Theme = "Default";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // UserSiteMapDataSource.SiteMapProvider = "Default";
            if (Profile.UserName != null)
            {
                string[] roles = Roles.GetRolesForUser(Profile.UserName);
                if (roles.Contains("Administrator"))
                    Response.Redirect("~/Administrator/Default.aspx");
                else if (roles.Contains("Buyer"))
                    Response.Redirect("~/Buyer/Default.aspx");
                else
                    Response.Redirect("~/UnauthorizedAccess.aspx");
            }
            else
                SetItem();
        }

    }

    private void SetItem()
    {
//        #region TeaterPlaceHolder

//        content = Enumerable.Aggregate(_DatabaseEntities.Concerts.Where(item => item.IsTeater && item.EndDate >= DateTime.Now).OrderByDescending(item => item.StartDate), string.Empty, (current, concert) => current + string.Format(@"<div class=""movie movie--test movie--test--dark movie--test--left"">
//                    <div class=""movie__images"">
//                        <a href=""Guest/ShowTime.aspx?ConcertId={6}""  class=""movie-beta__link"">
//                            <img alt='' src=""Files/Singer/{0}"" width=""217px"" height=""217px"">
//                        </a>
//                    </div>
//                    <div class=""movie__info"">
//                        <a href=""Guest/ShowTime.aspx?ConcertId={6}"" class=""movie__title"">{1}</a>
//                        <p class=""movie__option"">{2}</p>
//                        <p class=""movie__option"">{3}</p>
//                        <p class=""movie__time"">{4}</p>
//                        <p class=""movie__time"">{5}</p>
//                    </div>
//                </div>", concert.PosterURL, concert.ConcertTitle, concert.Hall.Name, concert.Hall.Address, PersianDate(concert.StartDate.Value), PersianDate(concert.EndDate.Value), concert.Id));
//        if (!string.IsNullOrEmpty(content))
//            TeaterPlaceHolder.InnerHtml = content;
//        #endregion
    }

    string PersianDate(DateTime date)
    {
        PersianDateControls.PersianDateLabel currentPersianDate = new PersianDateControls.PersianDateLabel();
        currentPersianDate.DateValue = date;
        currentPersianDate.DateFormat = PersianDateControls.DateFormat.LongDate;

        return currentPersianDate.Text;
    }
}