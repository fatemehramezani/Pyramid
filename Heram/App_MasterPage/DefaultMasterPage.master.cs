using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;

public partial class App_MasterPage_DefaultMasterPage : System.Web.UI.MasterPage
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        Page.Theme = "Default";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //    timeLabel.Text = PersianDate(DateTime.Now); //string.Format("{0}-{1}", PersianDate(DateTime.Now),DateTime.Now.ToShortTimeString());
    }
    string PersianDate(DateTime date)
    {
        PersianDateControls.PersianDateLabel currentPersianDate = new PersianDateControls.PersianDateLabel();
        currentPersianDate.DateValue = date;
        currentPersianDate.DateFormat = PersianDateControls.DateFormat.LongDate;

        return currentPersianDate.Text;
    }
    protected void SearchButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect(string.Format("~/Guest/Product.aspx?Title={0}", searchTextBox.Value));
    }
}
