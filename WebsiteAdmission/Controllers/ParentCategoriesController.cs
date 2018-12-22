using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Models.EF;

namespace WebsiteAdmission.Controllers
{
    public class ParentCategoriesController : Controller
    {
        private WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();

        // GET: ParentCategories
        public ActionResult Index()
        {
            return View(db.ParentCategories.ToList());
        }

        // GET: ParentCategories/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ParentCategory parentCategory = db.ParentCategories.Find(id);
            if (parentCategory == null)
            {
                return HttpNotFound();
            }
            return View(parentCategory);
        }

        // GET: ParentCategories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ParentCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ParentCatPath,NameParentCat,Position,Status")] ParentCategory parentCategory)
        {
            if (ModelState.IsValid)
            {
                db.ParentCategories.Add(parentCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(parentCategory);
        }

        // GET: ParentCategories/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ParentCategory parentCategory = db.ParentCategories.Find(id);
            if (parentCategory == null)
            {
                return HttpNotFound();
            }
            return View(parentCategory);
        }

        // POST: ParentCategories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ParentCatPath,NameParentCat,Position,Status")] ParentCategory parentCategory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(parentCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(parentCategory);
        }

        // GET: ParentCategories/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ParentCategory parentCategory = db.ParentCategories.Find(id);
            if (parentCategory == null)
            {
                return HttpNotFound();
            }
            return View(parentCategory);
        }

        // POST: ParentCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            ParentCategory parentCategory = db.ParentCategories.Find(id);
            db.ParentCategories.Remove(parentCategory);
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
