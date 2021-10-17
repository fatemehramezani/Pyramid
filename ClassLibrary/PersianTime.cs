using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public static class PersianTime
    {
         public static DateTime ToLocalDateTime(DateTime str)
         {
             string tz = "hi";//WebConfigHelper.GetAppSetting("Iran Standard Time");
             if (tz == "")
             {
                 return str;
             }

             TimeZoneInfo IranZone = TimeZoneInfo.FindSystemTimeZoneById(tz);
             DateTime utcTime = new DateTime(str.Year, str.Month, str.Day, str.Hour, str.Minute, str.Second, DateTimeKind.Utc);
             IranZone.GetUtcOffset(str);
             return TimeZoneInfo.ConvertTimeFromUtc(utcTime, IranZone);
             // return  TimeZoneInfo.ConvertTime(str, IranZone);
         }
    }
}
