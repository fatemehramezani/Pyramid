using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Guest_Compare : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SetPhoto();
    }

    void SetPhoto()
    {
        imagecontainer.InnerHtml = string.Empty;
        string framePath = string.Format("../App_Themes/Default/images/compare/frame");
         string thumbnailPath = string.Format("../App_Themes/Default/images/compare/frame/Thumbnails");
        string contentPath = string.Format("../App_Themes/Default/images/compare/Content");
        string thumbnailcontentPath = string.Format("../App_Themes/Default/images/compare/Content/Thumbnails");


        DirectoryInfo frameDirectory = new DirectoryInfo(Server.MapPath(framePath));
        if (!frameDirectory.Exists)
            return;
        string frame = string.Empty;

        FileInfo[] frameFiles = frameDirectory.GetFiles();
        if (frameFiles.Length > 0)
            for (int i = 0; i < frameFiles.Length; i++)
            {
                frame += string.Format(@"<a onclick=""document.getElementById('frameDiv').style.background='url({0}/{1})'"">
               <img src=""{2}/{1}"" width=""50px"" height=""50px""></a>", framePath, frameFiles[i].Name.ToString(), thumbnailPath);
            }

        DirectoryInfo contentDirectory = new DirectoryInfo(Server.MapPath(contentPath));
        if (!contentDirectory.Exists)
            return;
        string content = string.Empty;

        FileInfo[] contentFiles = contentDirectory.GetFiles();
        if (contentFiles.Length > 0)
            for (int i = 0; i < contentFiles.Length; i++)
            {
                content += string.Format(@"<a onclick=""document.getElementById('contentDiv').style.background='url({0}/{1})'"">
                    <img src=""{2}/{1}"" width=""50px"" height=""50px""></a>" , contentPath, contentFiles[i].Name.ToString(), thumbnailcontentPath);
            }

          string contents = string.Format(@"<div class=""sixteen columns  m-bot-35"">
                <div class=""caption-container m-bot-20"">
                    <div class=""caption-text-container"">انتخاب قاب و محتوا</div>
                    <div class=""content-container-white caption-bg clearfix""></div>
                </div>
                <div class=""content-container-white pad-20 clearfix""> {0}  <br /> <br />  {1}
                </div>
            </div>", frame, content);

        imagecontainer.InnerHtml = contents;
    }
}