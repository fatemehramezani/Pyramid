using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;

public partial class Buyer_LastRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Profile.UserName != null)
        {
            string[] roles = Roles.GetRolesForUser(Profile.UserName);
            if (!roles.Contains("Buyer"))
                Response.Redirect("~/UnauthorizedAccess.aspx");
        }
        else
            Response.Redirect(string.Format("~/Register.aspx?ReturnUrl={0}&Roles=QnV5ZXI=", HttpUtility.UrlEncode("~/Buyer/LastRequest.aspx")));
    }
    protected void BuyTicketButton_Click(object sender, EventArgs e)
    {
            DatabaseEntities _DatabaseEntities = new DatabaseEntities();
            var list =
                _DatabaseEntities.Tickets.Where(
                    item => (item.BuyerId == Profile.BuyerId && item.TicketStatusId == 2 && item.TimeShopping <= 10))
                    .ToList();
            if (list.Count <= 0)
                Response.Redirect("LastRequest.aspx");
            int price = (int) list.Sum(ticket => ticket.Price);
            string TrackingCode = list[0].TrackingCode;
            ClassLibrary.Shaparak.PaymentIFBinding _PaymentIFBinding = new ClassLibrary.Shaparak.PaymentIFBinding();
            string token = _PaymentIFBinding.RequestToken("10308533", TrackingCode, price,
                0, 0, 0, 0, 0, 0, string.Empty, string.Empty, 0);

            //ClassLibrary.SamanPayment.PaymentIFBinding transaction = new ClassLibrary.SamanPayment.PaymentIFBinding();
            //double result = transaction.verifyTransaction(TrackingCode, ConfigurationSettings.AppSettings["MID"]);
            //if (result >= price)
            Response.Redirect(string.Format("https://sep.shaparak.ir/payment.aspx?Token={0}&RedirectURL={1}", token, "http://www.concerteatr.com/Guest/Ticket.aspx"));
            //DateTime nowDateTime = DateTime.Now; // PersianTime.ToLocalDateTime(DateTime.Now);
            //Payment payment = new Payment
            //{
            //    TrackingCode = TrackingCode,
            //    BuyerId = Profile.BuyerId,
            //    Date = nowDateTime,
            //    BankId = 1,
            //    Price = price,
            //    IsSuccess = false,
            //    State = token,
            //    TraceNo = string.Empty
            //};
            //_DatabaseEntities.Payments.Add(payment);
            //_DatabaseEntities.SaveChanges();
            //throw new Exception(string.Format("Not completed transaction: Error Number({0})", result));
    }
}