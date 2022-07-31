namespace ToyLand.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Toy
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Toy()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int ToyID { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public int CatFID { get; set; }

        public int Quantity { get; set; }

        public double CostPrice { get; set; }

        public double SalePrice { get; set; }

        [StringLength(500)]
        public string Image1 { get; set; }

        [StringLength(500)]
        public string Image2 { get; set; }

        [StringLength(500)]
        public string DemoVideo { get; set; }

        [StringLength(50)]
        public string Details { get; set; }

        public int? Rating { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
