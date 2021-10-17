using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.IO;
using System.Web.UI.HtmlControls;

public partial class Admin_Advertise : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {

    }
    protected void SearchImageButton_Click(object sender, EventArgs e)
    {
        AdvertiseGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (TitleTextBox.Text != string.Empty)
        {
            AdvertiseFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void ClearImageButton_Click(object sender, EventArgs e)
    {
        TitleTextBox.Text = string.Empty;
        AdvertiseFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";
    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        AdvertiseMultiView.SetActiveView(EditView);
        AdvertiseFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton_Click(sender, e);
        AdvertiseFormView.DataBind();
    }
    protected void AdvertiseGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        AdvertiseFormView.PageIndex = (AdvertiseGridView.PageSize * AdvertiseGridView.PageIndex) + AdvertiseGridView.SelectedIndex;
        AdvertiseFormView.ChangeMode(FormViewMode.Edit);
        AdvertiseMultiView.SetActiveView(EditView);
        AdvertiseGridView.DataBind();
        AdvertiseGridView.SelectedIndex = -1;
    }
    protected void AdvertiseEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        AdvertiseGridView.DataBind();
        AdvertiseFormView.ChangeMode(FormViewMode.Insert);
        AdvertiseMultiView.SetActiveView(ShowView);
    }
    protected void AdvertiseFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        AdvertiseFormView.DataBind();
    }
    protected void AdvertiseFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "CANCEL")
        {
            AdvertiseMultiView.SetActiveView(ShowView);
            AdvertiseFormView.ChangeMode(FormViewMode.Insert);
        }
    }
    protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        AdvertiseGridView.PageSize = int.Parse(PageSizeDropDownList.SelectedValue);
    }
    protected void AdvertiseEntityDataSource_InsertingPicture(object sender, EntityDataSourceChangingEventArgs e)
    {
        //ImageUrl
        string filePath = "~/Files/Advertise";
        bool isChanged = true;
        if ((CheckBox)AdvertiseFormView.FindControl("ImageCheckBox") != null)
            isChanged = ((CheckBox)AdvertiseFormView.FindControl("ImageCheckBox")).Checked;

        if (isChanged)
        {
            FileUpload imageFileUpload = (FileUpload)AdvertiseFormView.FindControl("ImageFileUpload");
            if (imageFileUpload.HasFile)
            {
                string imgpath = Server.MapPath(filePath);
                if (!Directory.Exists(imgpath))
                    Directory.CreateDirectory(imgpath);

                string imgFile = imgpath + "\\" + imageFileUpload.FileName;
                imageFileUpload.SaveAs(imgFile);
                ((Advertise)e.Entity).ImageURL = imageFileUpload.FileName;
            }
        }

    }
    public byte[] ImageToByteArray(System.Drawing.Image imageIn)
    {
        MemoryStream ms = new MemoryStream();
        imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
        return ms.ToArray();
    }
    public bool ThumbnailCallback()
    {
        return false;
    }
}