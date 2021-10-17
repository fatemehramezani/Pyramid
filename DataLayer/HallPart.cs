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
    
    public partial class HallPart
    {
        public HallPart()
        {
            this.Chairs = new HashSet<Chair>();
            this.ConcertPrices = new HashSet<ConcertPrice>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public byte[] Image { get; set; }
        public int HallId { get; set; }
        public int RowCount { get; set; }
        public int ColumnCount { get; set; }
    
        public virtual ICollection<Chair> Chairs { get; set; }
        public virtual ICollection<ConcertPrice> ConcertPrices { get; set; }
        public virtual Hall Hall { get; set; }
    }
}
