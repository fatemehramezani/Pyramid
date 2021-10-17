using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ReturnUrl"] != null)
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
    }
    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {
        if (Request.QueryString["Roles"] == null)
            Roles.AddUserToRole(RegisterUser.UserName, "Buyer");
        else
        {
            //Convert.ToBase64String(System.Text.Encoding.ASCII.GetBytes(x))
            string[] roles = (System.Text.Encoding.ASCII.GetString(Convert.FromBase64String(Request.QueryString["Roles"]))).Split(';');
            Roles.AddUserToRoles(RegisterUser.UserName, roles.Where(role => role != string.Empty).ToArray());
        }
        FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false);
        CreatedUser();
        SetPatientProfile();
    }
    private void SetPatientProfile()
    {
        DatabaseEntities databaseEntities = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString());
        User newUser = databaseEntities.Users.First(user => user.Username == RegisterUser.UserName);
        newUser.Email = ((TextBox)RegisterUserWizardStep.Controls[0].FindControl("Username")).Text;
        newUser.Mobile = ((TextBox)RegisterUserWizardStep.Controls[0].FindControl("Mobile")).Text;
        newUser.FirstName = ((TextBox)RegisterUserWizardStep.Controls[0].FindControl("FirstName")).Text;
        newUser.LastName = ((TextBox)RegisterUserWizardStep.Controls[0].FindControl("LastName")).Text;
        databaseEntities.SaveChanges();
        Buyer buyer = databaseEntities.Buyers.FirstOrDefault(item => item.UserId == newUser.Id);
        if (buyer != null)
        {
            ProfileBase profile = ProfileBase.Create(RegisterUser.UserName);
            profile.SetPropertyValue("BuyerId", buyer.Id);
            profile.SetPropertyValue("Email", newUser.Username);
            profile.SetPropertyValue("FullName", newUser.FirstName+" " +newUser.LastName);
            profile.SetPropertyValue("Mobile", ((TextBox)RegisterUserWizardStep.Controls[0].FindControl("Mobile")).Text);
            profile.Save();
        }
    }
    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        CreatedUser();
    }
    private void CreatedUser()
    {
        string continueUrl = RegisterUser.ContinueDestinationPageUrl;
        if (String.IsNullOrEmpty(continueUrl))
        {
            continueUrl = "~/Account/Profile.aspx";
        }
        Response.Redirect(continueUrl);
    }
}
