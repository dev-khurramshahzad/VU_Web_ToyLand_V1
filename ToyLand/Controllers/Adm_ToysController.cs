using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ToyLand.Models;

namespace ToyLand.Controllers
{
    public class Adm_ToysController : Controller
    {
        private dbModel db = new dbModel();

        // GET: Adm_Toys
        public ActionResult Index()
        {
            var toys = db.Toys.Include(t => t.Category);
            return View(toys.ToList());
        }

        // GET: Adm_Toys/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Toy toy = db.Toys.Find(id);
            if (toy == null)
            {
                return HttpNotFound();
            }
            return View(toy);
        }

        // GET: Adm_Toys/Create
        public ActionResult Create()
        {
            ViewBag.CatFID = new SelectList(db.Categories, "CatID", "Name");
            return View();
        }

        // POST: Adm_Toys/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Toy toy, HttpPostedFileBase pic1,HttpPostedFileBase pic2)
        {

            string img1 = Path.GetFileName(pic1.FileName);
            string Ext1 = Path.GetExtension(img1);
            
            string img2 = Path.GetFileName(pic2.FileName);
            string Ext2 = Path.GetExtension(img2);

            if (Ext1 == ".jpg" || Ext1 == ".png" || Ext1 == ".bmp" || Ext1 == ".jpeg" || Ext1 == ".tiff" || Ext1 == ".tif")
            {
                toy.Image1 = img1;
                string StorePath = Path.Combine(Server.MapPath("~/Content/AppData"), img1);
                pic1.SaveAs(StorePath);
            }
            else if (Ext2 == ".jpg" || Ext2 == ".png" || Ext2 == ".bmp" || Ext2 == ".jpeg" || Ext2 == ".tiff" || Ext2 == ".tif")
            {
                toy.Image2 = img2;
                string StorePath = Path.Combine(Server.MapPath("~/Content/AppData"), img2);
                pic2.SaveAs(StorePath);
            }
            else
            {
                TempData["State"] = "error";
                TempData["Message"] = "Please select a Valid Picure.";
                return RedirectToAction("Create");
            }

            if (ModelState.IsValid)
            {
                db.Toys.Add(toy);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CatFID = new SelectList(db.Categories, "CatID", "Name", toy.CatFID);
            return View(toy);
        }

        // GET: Adm_Toys/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Toy toy = db.Toys.Find(id);
            if (toy == null)
            {
                return HttpNotFound();
            }
            ViewBag.CatFID = new SelectList(db.Categories, "CatID", "Name", toy.CatFID);
            return View(toy);
        }

        // POST: Adm_Toys/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ToyID,Name,CatFID,Quantity,CostPrice,SalePrice,Image1,Image2,DemoVideo,Details,Rating,Status")] Toy toy)
        {
            if (ModelState.IsValid)
            {
                db.Entry(toy).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CatFID = new SelectList(db.Categories, "CatID", "Name", toy.CatFID);
            return View(toy);
        }

        // GET: Adm_Toys/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Toy toy = db.Toys.Find(id);
            if (toy == null)
            {
                return HttpNotFound();
            }
            return View(toy);
        }

        // POST: Adm_Toys/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Toy toy = db.Toys.Find(id);
            db.Toys.Remove(toy);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
