//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class Concert
    {
        public Concert()
        {
            this.ConcertPrices = new HashSet<ConcertPrice>();
            this.ShowTimes = new HashSet<ShowTime>();
        }
    
        public int Id { get; set; }
        public string ConcertTitle { get; set; }
        public int HallId { get; set; }
        public Nullable<int> SingerId { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public string PosterURL { get; set; }
        public bool IsTeater { get; set; }
    
        public virtual Hall Hall { get; set; }
        public virtual Singer Singer { get; set; }
        public virtual ICollection<ConcertPrice> ConcertPrices { get; set; }
        public virtual ICollection<ShowTime> ShowTimes { get; set; }
    }
}