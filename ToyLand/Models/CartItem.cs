using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ToyLand.Models
{
    public class CartItem
    {
        public Toy toy {get; set;}
        public int quantity { get; set; }
    }
}