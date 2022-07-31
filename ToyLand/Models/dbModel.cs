using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace ToyLand.Models
{
    public partial class dbModel : DbContext
    {
        public dbModel()
            : base("name=dbModel")
        {
        }

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Toy> Toys { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>()
                .HasMany(e => e.Toys)
                .WithRequired(e => e.Category)
                .HasForeignKey(e => e.CatFID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Orders)
                .WithOptional(e => e.Customer)
                .HasForeignKey(e => e.CustomerFID);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.OrderDetails)
                .WithOptional(e => e.Order)
                .HasForeignKey(e => e.OrderFID)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Toy>()
                .Property(e => e.Status)
                .IsFixedLength();

            modelBuilder.Entity<Toy>()
                .HasMany(e => e.OrderDetails)
                .WithOptional(e => e.Toy)
                .HasForeignKey(e => e.ToyFID);
        }
    }
}
