using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToyLand.Models;

namespace ToyLand.Controllers
{
    public class HomeController : Controller
    {

        private dbModel db = new dbModel();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Admin()
        {
            return View();
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Login(string return_url)
        {
            ViewBag.return_url = return_url;
            return View();
        }
        public ActionResult Logout()
        {
            Session["LoggedinUser"] = null;
            return Redirect("/Home");
        }
        public ActionResult LoginVerify(string email, string password, string return_url)
        {
            var check = db.Customers.FirstOrDefault(x => x.Email == email && x.Password == password);
            if (check == null)
            {
                return Content("<script>alert('Email or Password Incorrect....');window.history.back();</script>");
            }
            else
            {
                Session["LoggedinUser"] = check;
                return Redirect(return_url);
            }
        }
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult CreateData(string name, string phone, string address, string email, string password, string cpassword)
        {
            if (password != cpassword)
            {
                return Content("<script>alert('Passwords do not match...');window.history.back();</script>");
            }

            var check = db.Customers.FirstOrDefault(x => x.Email == email);
            if (check != null)
            {
                return Content("<script>alert('This email is already registered....');window.history.back();</script>");

            }

            var c = new Customer()
            {
                Name = name,
                Phone = phone,
                Address = address,
                Email = email,
                Password = password,
            };

            db.Customers.Add(c);
            db.SaveChanges();


            return Redirect("/Home/Login");
        }
        public ActionResult Categories()
        {
            return View(db.Categories.ToList());
        }
        public ActionResult ViewToys(int? id)
        {
            ViewBag.Cats = db.Categories.ToList();
            if (id == null)
            {
                return View(db.Toys.ToList());
            }
            else
            {
                return View(db.Toys.Where(x => x.CatFID == id).ToList());
            }

        }
        public ActionResult ToysDetails(int id)
        {
            var Product = db.Toys.Find(id);
            return View(Product);
        }
        public ActionResult ShoppingCart()
        {
            return View();
        }
        public ActionResult AddtoCart(int id)
        {
            if (Session["Cart"] == null)
            {
                List<CartItem> Cart = new List<CartItem>();
                Cart.Add(new CartItem { toy = db.Toys.Find(id), quantity = 1 });

                Session["Cart"] = Cart;
            }

            else
            {
                List<CartItem> Cart = (List<CartItem>)Session["Cart"];
                int FoundItem = -1;
                for (int i = 0; i < Cart.Count; i++)
                {
                    if (Cart[i].toy.ToyID == id)
                    {
                        FoundItem = i;
                    }

                }

                if (FoundItem == -1)
                {
                    Cart.Add(new CartItem { toy = db.Toys.Find(id), quantity = 1 });
                }
                else
                {
                    Cart[FoundItem].quantity++;
                }


                Session["Cart"] = Cart;
            }

            return RedirectToAction("ShoppingCart");
        }
        public ActionResult Remove(int id)
        {
            List<CartItem> Cart = (List<CartItem>)Session["Cart"];
            int FoundItem = -1;
            for (int i = 0; i < Cart.Count; i++)
            {
                if (Cart[i].toy.ToyID == id)
                {
                    FoundItem = i;
                }
            }
            Cart.RemoveAt(FoundItem);

            Session["Cart"] = Cart;
            return RedirectToAction("ShoppingCart");
        }
        public ActionResult QtyPlus(int id)
        {
            List<CartItem> Cart = (List<CartItem>)Session["Cart"];
            int FoundItem = -1;
            for (int i = 0; i < Cart.Count; i++)
            {
                if (Cart[i].toy.ToyID == id)
                {
                    FoundItem = i;
                }
            }


            Cart[FoundItem].quantity++;

            Session["Cart"] = Cart;
            return RedirectToAction("ShoppingCart");
        }
        public ActionResult QtyMinus(int id)
        {
            List<CartItem> Cart = (List<CartItem>)Session["Cart"];
            int FoundItem = -1;
            for (int i = 0; i < Cart.Count; i++)
            {
                if (Cart[i].toy.ToyID == id)
                {
                    FoundItem = i;
                }
            }
            if (Cart[FoundItem].quantity > 1)
            {
                Cart[FoundItem].quantity--;
            }
            else
            {
                TempData["State"] = "error";
                TempData["Message"] = "Quantity cannot be less than 1";
                return RedirectToAction("ShoppingCart");

            }

            Session["Cart"] = Cart;
            return RedirectToAction("ShoppingCart");
        }
        public ActionResult Checkout()
        {
            Customer user = null;
            if (Session["LoggedInUser"] != null)
            {
                user = (Customer)Session["LoggedInUser"];
            }
            else
            {
                TempData["State"] = "warning";
                TempData["Message"] = "You must be logged in to checkout.";

                return Redirect("/Home/Login?return_url=" + this.Request.RawUrl);
            }
            //ORDER SAVING ================================================================

            Order order = new Order()
            {
                CustomerFID = user.CustomerID,
                OrderDate = DateTime.Now.Date,
                OrderTime = DateTime.Now.TimeOfDay,
                Status = "Pending"
            };
            db.Orders.Add(order);
            db.SaveChanges();

            List<CartItem> Cart = (List<CartItem>)Session["Cart"];
            for (int i = 0; i < Cart.Count; i++)
            {
                OrderDetail detail = new OrderDetail()
                {
                    OrderFID = db.Orders.Max(x => x.OrderID),
                    ToyFID = Cart[i].toy.ToyID,
                    Quantity = Cart[i].quantity
                };
                db.OrderDetails.Add(detail);
                db.SaveChanges();


                // Reducing the Quantity=================================================

                db.Toys.Find(Cart[i].toy.ToyID).Quantity = db.Toys.Find(Cart[i].toy.ToyID).Quantity - Cart[i].quantity;
                db.SaveChanges();
            }

            string ConfirmedOrderID = db.Orders.Max(x => x.OrderID).ToString();


            //EMPTY CART======================================================================
            Session["Cart"] = null;


            //Local
            //return Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&amount=" + (float.Parse(amount) / 162.59) + "&business=JanjuaTailors@Shop.com&item_name=Electronics_items&return=https://localhost:44361/Shop/OrderConfirmed/" + ConfirmedOrderID);

            //Web
            //return Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&amount=" + (float.Parse(amount) / 162.59) + "&business=JanjuaTailors@Shop.com&item_name=Electronics_items&return=https://www.khurramappstudio.com/Shop/OrderConfirmed/" + ConfirmedOrderID);

            return Redirect("/Home/OrderConfirmed/" + ConfirmedOrderID);
        }
        public ActionResult OrderConfirmed(int? id)
        {
            if (id == null)
            {
                id = db.Orders.Max(x => x.OrderID);
            }

            TempData["State"] = "success";
            TempData["Message"] = "Order has confirmed. It will be delivered soon order details are as under";



            var order = db.Orders.Find(id);
            ViewBag.Cart = db.OrderDetails.Where(x => x.OrderFID == order.OrderID).ToList();

            return View(order);
        }
        public ActionResult LoginAdmin()
        {
            return View();
        }
      
        public ActionResult LoginAdminVerify(string email, string password)
        {
            var check = db.Admins.FirstOrDefault(x => x.Email == email && x.Password == password);
            if (check == null)
            {
                return Content("<script>alert('Email or Password Incorrect....');window.history.back();</script>");
            }
            else
            {
                return Redirect("/Home/Admin");
            }
        }




    }
}