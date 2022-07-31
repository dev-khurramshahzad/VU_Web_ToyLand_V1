namespace ToyLand.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class OrderDetail
    {
        [Key]
        public int DetailsID { get; set; }

        public int? OrderFID { get; set; }

        public int? ToyFID { get; set; }

        public int? Quantity { get; set; }

        public virtual Order Order { get; set; }

        public virtual Toy Toy { get; set; }
    }
}
