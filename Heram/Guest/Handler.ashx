<%@ WebHandler Language="C#" Class="Handler" %>
using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.IO;
using DataLayer;

public class Handler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            DataLayer.DatabaseEntities databaseEntities = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString());
            if (context.Request.QueryString["SingerId"] != null)
            {
                int singerId = Convert.ToInt32(context.Request.QueryString["SingerId"]);
                Singer singer = databaseEntities.Singers.FirstOrDefault(item => item.Id == singerId);
                context.Response.ContentType = "jpeg";
                context.Response.BinaryWrite((byte[])singer.Image);
            }
            if (context.Request.QueryString["HallPartId"] != null)
            {
                int hallPartId = Convert.ToInt32(context.Request.QueryString["HallPartId"]);
                HallPart hallPart = databaseEntities.HallParts.FirstOrDefault(item => item.Id == hallPartId);
                context.Response.ContentType = "jpeg";
                context.Response.BinaryWrite((byte[])hallPart.Image);
            }
        }
        catch
        { }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }


}